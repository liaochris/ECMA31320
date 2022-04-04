# Import libraries
library(data.table)
library(Rlab)
library(foreach)
library(stargazer)
library(doParallel)

# disable scientific notation
options(scipen = 0)

set.seed(123)

`%ni%` <- Negate(`%in%`)

# make cluster for parallel computing
myCluster <- makeCluster(8, # number of cores to use
                         type = "FORK") # type of cluster
registerDoParallel(myCluster)

# function to find minimum sample given p0, p1, a, b, and range of N
findMinN <-function(nsims, p0, p1, a, b, N) {
  #find rejection region for different Ns
  dt_p0 <- data.table(i=1:nsims)[,lapply(N, function (n) mean(rbinom(n,size=1,prob = p0))),
                                 by=i]
  simcols <- colnames(dt_p0)[-1]
  
  # reject if greater than rejection region lower bound - value calculated below
  rejection_regions <- dt_p0[, lapply(.SD, function (x) quantile(x, 1-a)), .SDcols = simcols]
  
  dt_p1 <- data.table(i=1:nsims)[,lapply(N, function (n) sum(rbinom(n,size=1,prob = p1))/n),
                                 by=i]
  pcts <- dt_p1[, lapply(.SD, function (x) quantile(x, b)), .SDcols = simcols]
  
  # keep n if pcts > rejection_regions, find smallest n
  res <- min(which(unlist(unname(pcts)) > unlist(unname(rejection_regions))))
}
#number of simulations - adjust as you so wish
nsims <- 10000
# generate table of parameters
params <- data.table(rep(.05, 12), rep(c(.1, .2), each = 6), 
                     rep(c(.001, .05), each = 3, 2), rep(c(.1, .15, .2), 4),
                     c(30, 20, 20, 300, 100, 50, 20, 20, 20, 200, 100, 50))
# defined upper bound based off results to minimize computational complexity
colnames(params) <- c('a', 'b', 'p0', 'p1', 'ub')

# calculating estimate using monte carlo
system.time(est <- foreach(i = 1:12, .combine = "rbind") %dopar% {
  c(findMinN(nsims, params[i, p0], params[i, p1], params[i, a], params[i, b], 1:params[i,ub]))
})
est

# calculating using binomial distribution
binom <- foreach(i = 1:12, .combine = "rbind") %dopar% {
  rej_ub <- unlist(lapply(1:300, function(x) qbinom(params[i, b], x, params[i, p1])))
  kmin <- unlist(lapply(1:300, function(x) qbinom(1-params[i, a], x, params[i, p0])))
  min(which(rej_ub > kmin))
}

# analytical CLT
clt <- foreach(i = 1:12, .combine = "rbind") %dopar% {
  a <- params[i, a]
  b <- params[i, b]
  p0 <- params[i, p0]
  p1 <- params[i, p1]
  ceiling(((sqrt(p0*(1-p0))*qnorm(1-a) - qnorm(b) * sqrt(p1*(1-p1))) /(p1-p0))^2)
}

estimates <- data.table(est, binom, clt)
colnames(estimates) <- c("Monte Carlo", "Binomial (No Asymptotic)", "CLT")
stargazer(cbind(params[,-"ub"], estimates), summary = FALSE)

stopCluster(myCluster)



