
label define ER2001L  ///
       1 "Release number 1 - August 1995"  ///
       2 "Release number 2 - January 2003"  ///
       3 "Release number 3 - March 2004"  ///
       4 "Release number 4 - May 2008"  ///
       5 "Release number 5 - November 2013"  ///
       6 "Release number 6 - January 2016"

label define ER2005FL  ///
       1 "Reinterview family"  ///
       2 "Splitoff from reinterview family"  ///
       3 "Recontact family"  ///
       4 "Splitoff from recontact family"
forvalues n = 14/96 {
    label define ER2007L `n' "Actual age"  , modify
}
label define ER2007L       97 "Ninety-seven years of age or older"  , modify
label define ER2007L        0 "Wild code"  , modify
label define ER2007L       99 "NA; DK"  , modify

label define ER2008L  ///
       1 "Male"  ///
       2 "Female"  ///
       0 "Wild code"
label define ER2009L        0 `"No wife/"wife" in FU: Head is female or single male"'  , modify
forvalues n = 14/96 {
    label define ER2009L `n' "Actual age"  , modify
}
label define ER2009L       97 "Ninety-seven years of age or older"  , modify
label define ER2009L       99 "NA; DK"  , modify
label define ER2010L        0 "None"  , modify
forvalues n = 1/18 {
    label define ER2010L `n' "Actual number"  , modify
}

label define ER2032L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"  ///
       9 "DK; NA; refused"  ///
       0 "Inap."

label define ER2062L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER30000L  ///
       1 "Release number 1, March 2021"  ///
       2 "Release number 2, April 2021"

label define ER30003L  ///
       1 "Head"  ///
       2 `"Wife/"Wife""'  ///
       3 "Son or daughter"  ///
       4 "Brother or sister"  ///
       5 "Father or mother"  ///
       6 "Grandchild, niece, nephew, other relatives under 18"  ///
       7 "Other, including in-laws, other adult relatives"  ///
       8 "Husband or Wife of Head who moved out or died in the year prior to the 1968 interview"  ///
       9 "NA"  ///
       0 "Individual from core sample who was born or moved in after the 1968 interview; individual from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308)"

label define ER30005L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1968; born or moved in after the 1968 interview or individual from Immigrant or Latino samples (ER30003=0)"
forvalues n = 1/20 {
    label define ER30021L `n' "Individuals in the family at the time of the 1969 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30021L `n' "Individuals in institutions at the time of the 1969 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30021L `n' "Individuals who moved out of the FU or out of institutions between the 1968 and 1969 interviews but who were not included in another responding FU for 1969. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30021L `n' "Individuals living in 1968 but who died by the time of the 1969 interview"  , modify
}
label define ER30021L        0 "Born or moved in after the 1969 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse for 1969 or mover-out nonresponse in 1968 (ER30020=0)"  , modify

label define ER30022L  ///
       1 "Head in 1969; 1968 Head who was mover-out nonresponse by the time of the 1969 interview"  ///
       2 "Wife in 1969; 1968 Wife who was mover-out nonresponse by the time of the 1969 interview"  ///
       3 "Son or daughter, including stepchildren and foster children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative, including in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1969 interview (ER30020>0 and ER30021=0); main family nonresponse for 1969 or mover-out nonresponse from 1968 (ER30020=0)"

label define ER30024L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1969; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1969 interview (ER30020>0 and ER30021=0); main family nonresponse for 1969 or mover-out nonresponse from 1968 (ER30020=0)"
forvalues n = 1/97 {
    label define ER30029L `n' "Actual hours spent"  , modify
}
label define ER30029L       98 "Ninety-eight hours or more"  , modify
label define ER30029L       99 "NA; DK"  , modify
label define ER30029L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); in an institution in both 1968 and 1969 (ER30021=51-59 and ER30025=0); born or moved in after the 1969 interview (ER30020>0 and ER30021=0); main family nonresponse for 1969 or mover-out nonresponse from 1968 (ER30020=0)"  , modify

label define ER30030L  ///
       1 "Yes, is disabled"  ///
       2 "Yes, requires extra care"  ///
       5 "No; in an institution at time of 1969 interview or mover-out nonresponse from 1969 (ER30021=51-89)"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1969 interview (ER30020>0 and ER30021=0); main family nonresponse for 1969 or mover-out nonresponse from 1968 (ER30020=0)"
forvalues n = 1/20 {
    label define ER30044L `n' "Individuals in the family at the time of the 1970 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30044L `n' "Individuals in institutions at the time of the 1970 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30044L `n' "Individuals who moved out of the FU or out of institutions between the 1969 and 1970 interviews but who were not included in another responding FU for 1970. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30044L `n' "Individuals who were living in 1969 but who died by the time of the 1970 interview"  , modify
}
label define ER30044L        0 "Inap.:  born or moved in after the 1970 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1970 or mover-out nonresponse by 1969 (ER30043=0)"  , modify

label define ER30045L  ///
       1 "Head in 1970; 1969 Head who was mover-out nonresponse by the time of the 1970 interview"  ///
       2 "Wife in 1970; 1969 Wife who was mover-out nonresponse by the time of the 1970 interview"  ///
       3 "Child, stepchild"  ///
       4 "Sibling"  ///
       5 "Parent"  ///
       6 "Grandchild, great-grandchild"  ///
       7 "In-law or other relative"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1970 interview (ER30043>0 and ER30044=0); main family nonresponse by 1970 or mover-out nonresponse by 1969 (ER30043=0)"

label define ER30047L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1970; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1970 interview (ER30043>0 and ER30044=0); main family nonresponse by 1970 or mover-out nonresponse in 1969 (ER30043=0)"
forvalues n = 1/97 {
    label define ER30053L `n' "Actual hours spent"  , modify
}
label define ER30053L       98 "Ninety-eight hours or more"  , modify
label define ER30053L       99 "NA; DK"  , modify
label define ER30053L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1970 interview (ER30043>0 and ER30044=0); main family nonresponse by 1970 or mover-out nonresponse by 1969 (ER30043=0); in an institution at time of 1970 interview or mover-out nonresponse from 1970 (ER30044=51-89)"  , modify

label define ER30054L  ///
       1 "Yes, is disabled"  ///
       2 "Yes, requires extra care"  ///
       5 "No; in an institution at time of 1970 interview or mover-out nonresponse from 1970 (ER30044=51-89)"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1970 interview (ER30043>0 and ER30044=0); main family nonresponse by 1970 or mover-out nonresponse by 1969 (ER30043=0)"
forvalues n = 1/20 {
    label define ER30068L `n' "Individuals in the family at the time of the 1971 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30068L `n' "Individuals in institutions at the time of the 1971 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30068L `n' "Individuals who moved out of the FU or out of institutions between the 1970 and 1971 interviews but who were not included in another responding FU for 1971. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30068L `n' "Individuals who were living in 1970 but died by the time of the 1971 interview"  , modify
}
label define ER30068L        0 "Inap.:  born or moved in after the 1971 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1971 or mover-out nonresponse by 1970 (ER30067=0)"  , modify

label define ER30069L  ///
       1 "Head in 1971; 1970 Head who was mover-out nonresponse by the time of the 1971 interview"  ///
       2 "Wife in 1971; 1970 Wife who was mover-out nonresponse by the time of the 1971 interview"  ///
       3 "Child, stepchild"  ///
       4 "Sibling"  ///
       5 "Parent"  ///
       6 "Grandchild, great-grandchild"  ///
       7 "In-law or other relative"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of family)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1971 interview (ER30067>0 and ER30068=0); main family nonresponse by 1971 or mover-out nonresponse by 1970 (ER30067=0)"

label define ER30071L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1971; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1971 interview (ER30067>0 and ER30068=0); main family nonresponse by 1971 or mover-out nonresponse by 1970 (ER30067=0)"
forvalues n = 1/97 {
    label define ER30077L `n' "Actual hours spent"  , modify
}
label define ER30077L       98 "Ninety-eight hours or more"  , modify
label define ER30077L       99 "NA; DK"  , modify
label define ER30077L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1971 interview (ER30067>0 and ER30068=0); main family nonresponse by 1971 or mover-out nonresponse by 1970 (ER30067=0); in an institution at time of 1971 interview or mover-out nonresponse from 1971 (ER30068=51-89)"  , modify

label define ER30078L  ///
       1 "Yes, is disabled"  ///
       2 "Yes, requires extra care"  ///
       5 "No; in an institution at time of 1971 interview or mover-out nonresponse from 1971 (ER30068=51-89)"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1971 interview (ER30067>0 and ER30068=0); main family nonresponse by 1971 or mover-out nonresponse by 1970 (ER30067=0)"
forvalues n = 1/20 {
    label define ER30092L `n' "Individuals in the family at the time of the 1972 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30092L `n' "Individuals in institutions at the time of the 1972 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30092L `n' "Individuals who moved out of the FU or out of institutions between the 1971 and 1972 interviews but who were not included in another responding FU for 1972. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30092L `n' "Individuals who were living in 1971 but who died by the time of the 1972 interview"  , modify
}
label define ER30092L        0 "Inap.:  born or moved in after the 1972 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1972 or mover-out nonresponse by 1971 (ER30091=0)"  , modify

label define ER30093L  ///
       1 "Head in 1972; 1971 Head who was mover-out nonresponse by the time of the 1972 interview"  ///
       2 "Wife in 1972; 1971 Wife who was mover-out nonresponse by the time of the 1972 interview"  ///
       3 "Child, stepchild"  ///
       4 "Sibling"  ///
       5 "Parent"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of the family)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1972 interview (ER30091>0 and ER30092=0); main family nonresponse by 1972 or mover-out nonresponse by 1971 (ER30091=0)"

label define ER30095L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1972; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1972 interview (ER30091>0 and ER30092=0); main family nonresponse by 1972 or mover-out nonresponse by 1971 (ER30091=0)"
forvalues n = 1/97 {
    label define ER30102L `n' "Actual hours spent"  , modify
}
label define ER30102L       98 "Ninety-eight hours per week or more"  , modify
label define ER30102L       99 "NA; DK"  , modify
label define ER30102L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1972 or mover-out nonresponse by 1971 (ER30091=0); individual who was born or moved in after the 1972 interview (ER30091>0 and ER30092=0); in an institution at time of 1972 interview or mover-out nonresponse from 1972 (ER30092=51-89)"  , modify

label define ER30103L  ///
       1 "Yes, is disabled"  ///
       2 "Yes, requires extra care"  ///
       5 "No, is neither disabled nor requires extra care; in an institution at time of 1972 interview or mover-out nonresponse from 1972 (ER30092=51-89)"  ///
       9 "NA; DK"  ///
       0 "Inap; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1972 interview (ER30091>0 and ER30092=0); main family nonresponse by 1972 or mover-out nonresponse by 1971 (ER30091=0)"
forvalues n = 1/20 {
    label define ER30118L `n' "Individuals in FU at the time of the 1973 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30118L `n' "Individuals in institutions at the time of the 1973 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30118L `n' "Individuals who moved out of the FU or out of institutions between the 1972 and 1973 interviews but who were not included in another responding FU for 1973. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30118L `n' "Individuals who were living in 1972 but who died by the time of the 1973 interview"  , modify
}
label define ER30118L        0 "Inap.:  born or moved in after the 1973 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1973 or mover-out nonresponse by 1972 (ER30117=0)"  , modify

label define ER30119L  ///
       1 "Head in 1973; 1972 Head who was mover-out nonresponse by the time of the 1973 interview"  ///
       2 "Wife in 1973; 1972 Wife who was mover-out nonresponse by the time of the 1973 interview"  ///
       3 "Son or daughter; includes stepchildren or adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1973 interview (ER30117>0 and ER30118=0); main family nonresponse by 1973 or mover-out nonresponse by 1972 (ER30117=0)"

label define ER30121L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1973; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1973 interview (ER30117>0 and ER30118=0); main family nonresponse by 1973 or mover-out nonresponse by 1972 (ER30117=0)"
forvalues n = 1/97 {
    label define ER30127L `n' "Actual hours spent"  , modify
}
label define ER30127L       98 "Ninety-eight hours per week or more"  , modify
label define ER30127L       99 "NA; DK"  , modify
label define ER30127L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1973 interview (ER30117>0 and ER30118=0); main family nonresponse by 1973 or mover-out nonresponse by 1972 (ER30117=0); in an institution at time of 1973 interview or mover-out nonresponse from 1973 (ER30118=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30139L `n' "Individuals in FU at the time of 1974 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30139L `n' "Individuals in institutions at the time of the 1974 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30139L `n' "Individuals who moved out of the FU or out of institutions between the 1973 and 1974 interviews but who were not included in another responding FU for 1974. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30139L `n' "Individuals who were living in 1973 but who died by the time of the 1974 interview"  , modify
}
label define ER30139L        0 "Inap.:  born or moved in after the 1974 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1974 or mover-out nonresponse by 1973 (ER30138=0)"  , modify

label define ER30140L  ///
       1 "Head in 1974; 1973 Head who was mover-out nonresponse by the time of the 1974 interview"  ///
       2 "Wife in 1974; 1973 Wife who was mover-out nonresponse by the time of the 1974 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1974 interview (ER30138>0 and ER30139=0); main family nonresponse by 1974 or mover-out nonresponse by 1973 (ER30138=0)"

label define ER30142L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1974; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1974 interview (ER30138>0 and ER30139=0); main family nonresponse by 1974 or mover-out nonresponse by 1973 (ER30138=0)"
forvalues n = 1/97 {
    label define ER30148L `n' "Actual hours spent"  , modify
}
label define ER30148L       98 "Ninety-eight hours per week or more"  , modify
label define ER30148L       99 "NA; DK"  , modify
label define ER30148L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1974 interview (ER30138>0 and ER30139=0); main family nonresponse by 1974 or mover-out nonresponse by 1973 (ER30138=0); in an institution at time of 1974 interview or moved out or died between the 1973 and 1974 interviews (ER30139=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30161L `n' "Individuals in FU at the time of the 1975 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30161L `n' "Individuals in institutions at the time of the 1975 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30161L `n' "Individuals who moved out of the FU or out of institutions between the 1974 and 1975 interviews but who were not included in another responding FU for 1975. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30161L `n' "Individuals who were living in 1974 but who died by the time of the 1975 interview"  , modify
}
label define ER30161L        0 "Inap.:  born or moved in after the 1975 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1975 or mover-out nonresponse by 1974 (ER30160=0)"  , modify

label define ER30162L  ///
       1 "Head in 1975; 1974 Head who was mover-out nonresponse by the time of the 1975 interview"  ///
       2 "Wife in 1975; 1974 Wife who was mover-out nonresponse by the time of the 1975 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1975 interview (ER30160>0 and ER30161=0); main family nonresponse by 1975 or mover-out nonresponse by 1974 (ER30160=0)"

label define ER30164L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1975; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1975 interview (ER30160>0 and ER30161=0); main family nonresponse by 1975 or mover-out nonresponse by 1974 (ER30160=0)"
forvalues n = 1/20 {
    label define ER30189L `n' "Individuals in FU at the time of the 1976 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30189L `n' "Individuals in institutions at the time of the 1976 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30189L `n' "Individuals who moved out of the FU or out of institutions between the 1975 and 1976 interviews but were not included in another responding FU for 1976. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30189L `n' "Individuals who were living in 1975 but who died by the time of the 1976 interview"  , modify
}
label define ER30189L        0 "Inap.:  born or moved in after the 1976 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1976 or mover-out nonresponse by 1975 (ER30188=0)"  , modify

label define ER30190L  ///
       1 "Head in 1976; 1975 Head who was mover-out nonresponse by the time of the 1976 interview"  ///
       2 "Wife in 1976; 1975 Wife who was mover-out nonresponse by the time of the 1976 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1976 interview (ER30188>0 and ER30189=0); main family nonresponse by 1976 or mover-out nonresponse by 1975 (ER30188=0)"

label define ER30192L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU in 1976; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1976 interview (ER30188>0 and ER30189=0); main family nonresponse by 1976 or mover-out nonresponse by 1975 (ER30188=0)"
forvalues n = 1/97 {
    label define ER30198L `n' "Actual hours spent"  , modify
}
label define ER30198L       98 "Ninety-eight hours per week or more"  , modify
label define ER30198L       99 "NA; DK"  , modify
label define ER30198L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1976 or mover-out nonresponse by 1975 (ER30188=0); born or moved in after the 1976 interview (ER30188>0 and ER30189=0); in an institution at time of 1976 interview or mover-out nonresponse from 1976 (ER30189=51-89)"  , modify

label define ER30199L  ///
       1 "This person requires extra care or is disabled"  ///
       5 "This person does not require extra care or is not disabled"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1976 interview (ER30188>0 and ER30189=0); main family nonresponse by 1976 or mover-out nonresponse by 1975 (ER30188=0); in an institution at time of 1976 interview or mover-out nonresponse from 1976 (ER30189=51-89)"
forvalues n = 1/20 {
    label define ER30218L `n' "Individuals in FU at the time of the 1977 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30218L `n' "Individuals in institutions at the time of the 1977 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30218L `n' "Individuals who moved out of the FU or out of institutions between the 1976 and 1977 interviews but who were not included in another responding FU for 1977. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30218L `n' "Individuals who were living in 1976 but who died by the time of the 1977 interview"  , modify
}
label define ER30218L        0 "Inap.:  born or moved in after the 1977 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1977 or mover-out nonresponse by 1976 (ER30217=0)"  , modify

label define ER30219L  ///
       1 "Head in 1977; 1976 Head who was mover-out nonresponse by the time of the 1977 interview"  ///
       2 "Wife in 1977; 1976 Wife who was mover-out nonresponse by the time of the 1977 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1977 interview (ER30217>0 and ER30218=0); main family nonresponse by 1977 or mover-out nonresponse by 1976 (ER30217=0)"

label define ER30221L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       4 "Spouse in couple numbered 4"  ///
       5 "Spouse in couple numbered 5"  ///
       0 "Inap.:  not married; spouse not in FU in 1977; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1977 interview (ER30217>0 and ER30218=0); main family nonresponse by 1977 or mover-out nonresponse by 1976 (ER30217=0)"
forvalues n = 1/97 {
    label define ER30227L `n' "Actual hours spent"  , modify
}
label define ER30227L       98 "Ninety-eight hours per week or more"  , modify
label define ER30227L       99 "NA; DK"  , modify
label define ER30227L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1977 interview (ER30217>0 and ER30218=0); main family nonresponse by 1977 or mover-out nonresponse by 1976 (ER30217=0); in an institution at time of 1977 interview or mover-out nonresponse from 1977 (ER30218=51-89)"  , modify

label define ER30228L  ///
       1 "This person requires extra care or is disabled"  ///
       5 "This person does not require extra care or is not disabled"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1977 interview (ER30217>0 and ER30218=0); main family nonresponse by 1977 or mover-out nonresponse by 1976 (ER30217=0); in an institution at time of 1977 interview or mover-out nonresponse from 1977 (ER30218=51-89)"
forvalues n = 1/20 {
    label define ER30247L `n' "Individuals in FU at the time of the 1978 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30247L `n' "Individuals in institutions at the time of the 1978 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30247L `n' "Individuals who moved out of the FU or out of institutions between the 1977 and 1978 interviews but who were not included in another responding FU for 1978. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30247L `n' "Individuals who were living in 1977 but who died by the time of the 1978 interview"  , modify
}
label define ER30247L        0 "Inap.:  born or moved in after the 1978 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1978 or mover-out nonresponse by 1977 (ER30246=0)"  , modify

label define ER30248L  ///
       1 "Head in 1978; 1977 Head who was mover-out nonresponse by the time of the 1978 interview"  ///
       2 "Wife in 1978; 1977 Wife who was mover-out nonresponse by the time of the 1978 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1978 interview (ER30246>0 and ER30247=0); main family nonresponse by 1978 or mover-out nonresponse by 1977 (ER30246=0)"

label define ER30250L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       4 "Spouse in couple numbered 4"  ///
       5 "Spouse in couple numbered 5"  ///
       0 "Inap.:  not married; spouse was not in FU at the time of the 1978 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1978 interview (ER30246>0 and ER30247=0); main family nonresponse by 1978 or mover-out nonresponse by 1977 (ER30246=0)"
forvalues n = 1/97 {
    label define ER30256L `n' "Actual hours spent"  , modify
}
label define ER30256L       98 "Ninety-eight hours per week or more"  , modify
label define ER30256L       99 "NA; DK"  , modify
label define ER30256L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1978 interview (ER30246>0 and ER30247=0); main family nonresponse by 1978 or mover-out nonresponse by 1977 (ER30246=0); in an institution at time of 1978 interview or mover-out nonresponse from 1978 (ER30247=51-89)"  , modify

label define ER30259L  ///
       1 "This person has a physical or nervous condition"  ///
       5 "This person does not have a physical or nervous condition"  ///
       9 "NA; DK"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1978 interview (ER30246>0 and ER30247=0); main family nonresponse by 1978 or mover-out nonresponse by 1977 (ER30246=0); in an institution at time of 1978 interview or mover-out nonresponse from 1978 (ER30247=51-89)"
forvalues n = 1/20 {
    label define ER30284L `n' "Individuals in the family at the time of the 1979 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30284L `n' "Individuals in institutions at the time of the 1979 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30284L `n' "Individuals who moved out of the FU or out of institutions between the 1978 and 1979 interviews but who were not included in another responding FU for 1979. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30284L `n' "Individuals who were living in 1978 but who died by the time of the 1978 interview"  , modify
}
label define ER30284L        0 "Inap.:  born or moved in after the 1979 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1979 or mover-out nonresponse by 1978 (ER30283=0)"  , modify

label define ER30285L  ///
       1 "Head in 1979; 1978 Head who was mover-out nonresponse by the time of the 1979 interview"  ///
       2 "Wife in 1979; 1978 Wife who was mover-out nonresponse by the time of the 1979 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative, includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1979 interview (ER30283>0 and ER30284=0); main family nonresponse by 1979 or mover-out nonresponse by 1978 (ER30283=0)"

label define ER30287L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU at the time of the 1979 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1979 interview (ER30283>0 and ER30284=0); main family nonresponse by 1979 or mover-out nonresponse by 1978 (ER30283=0)"
forvalues n = 1/97 {
    label define ER30291L `n' "Actual hours spent"  , modify
}
label define ER30291L       98 "Ninety-eight hours per week or more"  , modify
label define ER30291L       99 "NA; DK"  , modify
label define ER30291L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1979 interview (ER30283>0 and ER30284=0); main family nonresponse by 1979 or mover-out nonresponse by 1978 (ER30283=0); in an institution at time of 1979 interview or mover-out nonresponse from 1979 (ER30284=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30314L `n' "Individuals in the family at the time of the 1980 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30314L `n' "Individuals in institutions at the time of the 1980 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30314L `n' "Individuals who moved out of the FU or out of institutions between the 1979 and 1980 interviews but who were not included in another responding FU for 1980. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30314L `n' "Individuals who were living in 1979 but who died by the time of the 1980 interview"  , modify
}
label define ER30314L        0 "Inap.:  born or moved in after the 1980 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1980 or mover-out nonresponse by 1979 (ER30313=0)"  , modify

label define ER30315L  ///
       1 "Head in 1980; 1979 Head who was mover-out nonresponse by the time of the 1980 interview"  ///
       2 "Wife in 1980; 1979 Wife who was mover-out nonresponse by the time of the 1980 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Mother or father of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1980 interview (ER30313>0 and ER30314=0); main family nonresponse by 1980 or mover-out nonresponse by 1979 (ER30313=0)"

label define ER30317L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU at the time of the 1980 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1980 interview (ER30313>0 and ER30314=0); main family nonresponse by 1980 or mover-out nonresponse by 1979 (ER30313=0)"
forvalues n = 1/97 {
    label define ER30321L `n' "Actual hours spent"  , modify
}
label define ER30321L       98 "Ninety-eight hours per week or more"  , modify
label define ER30321L       99 "NA; DK"  , modify
label define ER30321L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1980 interview (ER30313>0 and ER30314=0); main family nonresponse by 1980 or mover-out nonresponse by 1979 (ER30313=0); in an institution at time of 1980 interview or mover-out nonresponse from 1980 (ER30314=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30344L `n' "Individuals in the family at the time of the 1981 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30344L `n' "Individuals in institutions at the time of the 1981 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30344L `n' "Individuals who moved out of the FU or out of institutions between the 1980 and 1981 interviews but who were not included in another responding FU for 1981. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30344L `n' "Individuals who were living in 1980 but who died by the time of the 1981 interview"  , modify
}
label define ER30344L        0 "Inap.:  born or moved in after the 1981 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1981 or splitoff nonresponse by 1980 (ER30343=0)"  , modify

label define ER30345L  ///
       1 "Head in 1981; 1980 Head who was mover-out nonresponse by the time of the 1981 interview"  ///
       2 "Wife in 1981; 1980 Wife who was mover-out nonresponse by the time of the 1981 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1981 interview (ER30343>0 and ER30344=0); main family nonresponse by 1981 or mover-out nonresponse by 1980 (ER30343=0)"

label define ER30347L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU at the time of the 1981 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1981 interview (ER30343>0 and ER30344=0); main family nonresponse by 1981 or mover-out nonresponse by 1980 (ER30343=0)"
forvalues n = 1/97 {
    label define ER30351L `n' "Actual hours spent"  , modify
}
label define ER30351L       98 "Ninety-eight hours per week or more"  , modify
label define ER30351L       99 "NA; DK"  , modify
label define ER30351L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1981 interview (ER30343>0 and ER30344=0); main family nonresponse by 1981 or mover-out nonresponse by 1980 (ER30343=0); in an institution at time of 1981 interview or mover-out nonresponse from 1981 (ER30344=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30374L `n' "Individuals in the family at the time of the 1982 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30374L `n' "Individuals in institutions at the time of the 1982 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30374L `n' "Individuals who moved out of the FU or out of institutions between the 1981 and 1982 interviews but who were not included in another responding FU for 1982. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30374L `n' "Individuals who were living in 1981 but died by the time of the 1982 interview"  , modify
}
label define ER30374L        0 "Inap.:  born or moved in after the 1982 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1982 or mover-out nonresponse by 1981 (ER30373=0)"  , modify

label define ER30375L  ///
       1 "Head in 1982; 1981 Head who was mover-out nonresponse by the time of the 1982 interview"  ///
       2 "Wife in 1982; 1981 Wife who was mover-out nonresponse by the time of the 1982 interview"  ///
       3 "Son or daughter; includes stepchildren and adopted children"  ///
       4 "Brother or sister of Head"  ///
       5 "Father or mother of Head"  ///
       6 "Grandchild or great-grandchild"  ///
       7 "Other relative; includes in-laws"  ///
       8 "Nonrelative"  ///
       9 "Husband of Head (i.e., Wife was Head of FU)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1982 interview (ER30373>0 and ER30374=0); main family nonresponse by 1982 or mover-out nonresponse by 1981 (ER30373=0)"

label define ER30377L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married; spouse was not in FU at the time of the 1982 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1982 interview (ER30373>0 and ER30374=0); main family nonresponse by 1982 or mover-out nonresponse by 1981 (ER30373=0)"
forvalues n = 1/20 {
    label define ER30400L `n' "Individuals in the family at the time of the 1983 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30400L `n' "Individuals in institutions at the time of the 1983 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30400L `n' "Individuals who moved out of the FU or out of institutions between the 1982 and 1983 interviews but who were not included in another responding FU for 1983. All such individuals were nonresponse."  , modify
}
forvalues n = 81/89 {
    label define ER30400L `n' "Individuals who were living in 1982 but died by the time of the 1983 interview"  , modify
}
label define ER30400L        0 "Inap.:  born or moved in after the 1983 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1983 or mover-out nonresponse by 1982 (ER30399=0)"  , modify

label define ER30401L  ///
      10 "Head in 1983; 1982 Head who was mover-out nonresponse by the time of the 1983 interview"  ///
      20 "Legal Wife in 1983; 1982 Wife who was mover-out nonresponse by the time of the 1983 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1981 family, since consecutive interviews may be taken less or more than twelve months apart; 1982 "Wife" who was mover-out nonresponse by the time of the 1983 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20),  but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1983 interview (ER30399>0 and ER30400=0); main family nonresponse by 1983 or mover-out nonresponse by 1982 (ER30399=0)"

label define ER30405L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1983 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1983 interview (ER30399>0 and ER30400=0); main family nonresponse by 1983 or mover-out nonresponse by 1982 (ER30399=0)"
forvalues n = 1/97 {
    label define ER30409L `n' "Actual hours spent"  , modify
}
label define ER30409L       98 "Ninety-eight hours per week or more"  , modify
label define ER30409L       99 "NA; DK"  , modify
label define ER30409L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1983 interview (ER30399>0 and ER30400=0); main family nonresponse by 1983 or mover-out nonresponse by 1982 (ER30399=0); in an institution or mover-out nonresponse for 1983 (ER30400=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30430L `n' "Individuals in the family at the time of the 1984 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30430L `n' "Individuals in institutions at the time of the 1984 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30430L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1983 and 1984 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30430L `n' "Individuals who were living in 1983 but died by the time of the 1984 interview"  , modify
}
label define ER30430L        0 "Inap.:  born or moved in after the 1984 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1984 or mover-out nonresponse by 1983 (ER30429=0)"  , modify

label define ER30431L  ///
      10 "Head in 1984; 1983 Head who was mover-out nonresponse by the time of the 1984 interview"  ///
      20 "Legal Wife in 1984; 1983 Wife who was mover-out nonresponse by the time of the 1984 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1982 family, since consecutive interviews may be taken less or more than twelve months apart; 1983 "Wife" who was mover-out nonresponse by the time of the 1984 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1984 interview (ER30429>0 and ER30430=0); main family nonresponse by 1984 or mover-out nonresponse by 1983 (ER30429=0)"

label define ER30435L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1984 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1984 interview (ER30429>0 and ER30430=0); main family nonresponse by 1984 or mover-out nonresponse by 1983 (ER30429=0)"
forvalues n = 1/97 {
    label define ER30439L `n' "Actual hours spent"  , modify
}
label define ER30439L       98 "Ninety-eight hours per week or more"  , modify
label define ER30439L       99 "NA; DK"  , modify
label define ER30439L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1984 interview (ER30429>0 and ER30430=0); main family nonresponse by 1984 or mover-out nonresponse by 1983 (ER30429=0); in an institution or mover-out nonresponse for 1984 (ER30430=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30464L `n' "Individuals in the family at the time of the 1985 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30464L `n' "Individuals in institutions at the time of the 1985 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30464L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1984 and 1985 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30464L `n' "Individuals who were living in 1984 but died by the time of the 1985 interview"  , modify
}
label define ER30464L        0 "Inap.:  born or moved in after the 1985 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1985 or mover-out nonresponse by 1984 (ER30463=0)"  , modify

label define ER30465L  ///
      10 "Head in 1985; 1984 Head who was mover-out nonresponse by the time of the 1985 interview"  ///
      20 "Legal Wife in 1985; 1984 Wife who was mover-out nonresponse by the time of the 1985 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1983 family, since consecutive interviews may be taken less or more than twelve months apart; 1984 "Wife" who was mover-out nonresponse by the time of the 1985 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1985 interview (ER30463>0 and ER30464=0); main family nonresponse by 1985 or mover-out nonresponse by 1984 (ER30463=0)"

label define ER30469L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1985 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1985 interview (ER30463>0 and ER30464=0); main family nonresponse by 1985 or mover-out nonresponse by 1984 (ER30463=0)"
forvalues n = 1/97 {
    label define ER30473L `n' "Actual hours spent"  , modify
}
label define ER30473L       98 "Ninety-eight hours per week or more"  , modify
label define ER30473L       99 "NA; DK"  , modify
label define ER30473L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1985 interview (ER30463>0 and ER30464=0); main family nonresponse by 1985 or mover-out nonresponse by 1984 (ER30463=0); in an institution or mover-out nonresponse for 1985 (ER30464=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30499L `n' "Individuals in the family at the time of the 1986 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30499L `n' "Individuals in institutions at the time of the 1986 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30499L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1985 and 1986 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30499L `n' "Individuals who were living in 1985 but died by the time of the 1986 interview"  , modify
}
label define ER30499L        0 "Inap.:  born or moved in after the 1986 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1986 or mover-out nonresponse by 1985 (ER30498=0)"  , modify

label define ER30500L  ///
      10 "Head in 1986; 1985 Head who was mover-out nonresponse by the time of the 1986 interview"  ///
      20 "Legal Wife in 1986; 1985 Wife who was mover-out nonresponse by the time of the 1986 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1985 family, since consecutive interviews may be taken less or more than twelve months apart; 1985 "Wife" who was mover-out nonresponse by the time of the 1986 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1986 interview (ER30498>0 and ER30499=0); main family nonresponse by 1986 or mover-out nonresponse by 1985 (ER30498=0)"

label define ER30504L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1986 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1986 interview (ER30498>0 and ER30499=0); main family nonresponse by 1986 or mover-out nonresponse by 1985 (ER30498=0)"
forvalues n = 1/97 {
    label define ER30508L `n' "Actual hours spent"  , modify
}
label define ER30508L       98 "Ninety-eight hours per week or more"  , modify
label define ER30508L       99 "NA; DK"  , modify
label define ER30508L        0 "Inap.:  none; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1986 interview (ER30498>0 and ER30499=0); main family nonresponse by 1986 or mover-out nonresponse by 1985 (ER30498=0); in an institution or mover-out nonresponse for 1986 (ER30499=51-89)"  , modify
forvalues n = 1/20 {
    label define ER30536L `n' "Individuals in the family at the time of the 1987 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30536L `n' "Individuals in institutions at the time of the 1987 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30536L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1986 and 1987 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30536L `n' "Individuals who were living in 1986 but died by the time of the 1987 interview"  , modify
}
label define ER30536L        0 "Inap.:  born or moved in after the 1987 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1987 or mover-out nonresponse by 1986 (ER30535=0)"  , modify

label define ER30537L  ///
      10 "Head in 1987; 1986 Head who was mover-out nonresponse by the time of the 1987 interview"  ///
      20 "Legal Wife in 1987; 1986 Wife who was mover-out nonresponse by the time of the 1987 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1986 family, since consecutive interviews may be taken less or more than twelve months apart; 1986 "Wife" who was mover-out nonresponse by the time of the 1987 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1987 interview (ER30535>0 and ER30536=0); main family nonresponse by 1987 or mover-out nonresponse by 1986 (ER30535=0)"

label define ER30541L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1987 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1987 interview (ER30535>0 and ER30536=0); main family nonresponse by 1987 or mover-out nonresponse by 1986 (ER30535=0)"
forvalues n = 1/20 {
    label define ER30571L `n' "Individuals in the family at the time of the 1988 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30571L `n' "Individuals in institutions at the time of the 1988 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30571L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1987 and 1988 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30571L `n' "Individuals who were living in 1987 but died by the time of the 1988 interview"  , modify
}
label define ER30571L        0 "Inap.:  born or moved in after the 1988 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1988 or mover-out nonresponse by 1987 (ER30570=0)"  , modify

label define ER30572L  ///
      10 "Head in 1988; 1987 Head who was mover-out nonresponse by the time of the 1988 interview"  ///
      20 "Legal Wife in 1988; 1987 Wife who was mover-out nonresponse by the time of the 1988 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1987 family, since consecutive interviews may be taken less or more than twelve months apart; 1987 "Wife" who was mover-out nonresponse by the time of the 1988 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1988 interview (ER30570>0 and ER30571=0); main family nonresponse by 1988 or mover-out nonresponse by 1987 (ER30570=0)"

label define ER30576L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1988 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1988 interview (ER30570>0 and ER30571=0); main family nonresponse by 1988 or mover-out nonresponse by 1987 (ER30570=0)"
forvalues n = 1/20 {
    label define ER30607L `n' "Individuals in the family at the time of the 1989 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30607L `n' "Individuals in institutions at the time of the 1989 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30607L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1988 and 1989 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30607L `n' "Individuals who were living in 1988 but died by the time of the 1989 interview"  , modify
}
label define ER30607L        0 "Inap.:  born or moved in after the 1989 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); main family nonresponse by 1989 or mover-out nonresponse by 1988 (ER30606=0)"  , modify

label define ER30608L  ///
      10 "Head in 1989; 1988 Head who was mover-out nonresponse by the time of the 1989 interview"  ///
      20 "Legal Wife in 1989; 1988 Wife who was mover-out nonresponse by the time of the 1989 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1988 family, since consecutive interviews may be taken less or more than twelve months apart; 1988 "Wife" who was mover-out nonresponse by the time of the 1989 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1989 interview (ER30606>0 and ER30607=0); main family nonresponse by 1989 or mover-out nonresponse by 1988 (ER30606=0)"

label define ER30612L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1989 interview; from Immigrant or Latino samples (ER30001=3001-3511,4001-4851,7001-9308); born or moved in after the 1989 interview (ER30606>0 and ER30607=0); main family nonresponse by 1989 or mover-out nonresponse by 1988 (ER30606=0)"
forvalues n = 1/20 {
    label define ER30643L `n' "Individuals in the family at the time of the 1990 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30643L `n' "Individuals in institutions at the time of the 1990 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30643L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1989 and 1990 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30643L `n' "Individuals who were living in 1989 but died by the time of the 1990 interview"  , modify
}
label define ER30643L        0 "Inap.:  born or moved in after the 1990 interview; from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1990 or mover-out nonresponse by 1989 (ER30642=0)"  , modify

label define ER30644L  ///
      10 "Head in 1990; 1989 Head who was mover-out nonresponse by the time of the 1990 interview"  ///
      20 "Legal Wife in 1990; 1989 Wife who was mover-out nonresponse by the time of the 1990 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1989 family, since consecutive interviews may be taken less or more than twelve months apart; 1989 "Wife" who was mover-out nonresponse by the time of the 1990 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1990 or mover-out nonresponse by 1989 (ER30642=0); born or moved in after the 1990 interview (ER30642>0 and ER30643=0)"

label define ER30648L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1990 interview; from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1990 or mover-out nonresponse by 1989 (ER30642=0); born or moved in after the 1990 interview (ER30642>0 and ER30643=0)"
forvalues n = 1/20 {
    label define ER30690L `n' "Individuals in the family at the time of the 1991 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30690L `n' "Individuals in institutions at the time of the 1991 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30690L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1990 and 1991 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30690L `n' "Individuals who were living in 1990 but died by the time of the 1991 interview"  , modify
}
label define ER30690L        0 "Inap.:  born or moved in after the 1991 interview; from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1991 or mover-out nonresponse by 1990 (ER30689=0)"  , modify

label define ER30691L  ///
      10 "Head in 1991; 1990 Head who was mover-out nonresponse by the time of the 1991 interview"  ///
      20 "Legal Wife in 1991; 1990 Wife who was mover-out nonresponse by the time of the 1991 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1990 family, since consecutive interviews may be taken less or more than twelve months apart; 1990 "Wife" who was mover-out nonresponse by the time of the 1991 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1991 or mover-out nonresponse by 1990 (ER30689=0); born or moved in after the 1991 interview (ER30689>0 and ER30690=0)"

label define ER30695L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1991 interview; from Immigrant or Latino recontact sample (ER30001=3001-3511,4001-4851, 9044-9308); main family nonresponse by 1991 or mover-out nonresponse by 1990 (ER30689=0); born or moved in after the 1991 interview (ER30689>0 and ER30690=0)"
forvalues n = 1/20 {
    label define ER30734L `n' "Individuals in the family at the time of the 1992 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30734L `n' "Individuals in institutions at the time of the 1992 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30734L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1991 and 1992 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30734L `n' "Individuals who were living in 1991 but died by the time of the 1992 interview"  , modify
}
label define ER30734L        0 "Inap.:  born or moved in after the 1992 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1992 or mover-out nonresponse by 1991 (ER30733=0)"  , modify

label define ER30735L  ///
      10 "Head in 1992; 1991 Head who was mover-out nonresponse by the time of the 1992 interview"  ///
      20 "Legal Wife in 1992; 1991 Wife who was mover-out nonresponse by the time of the 1992 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1991 family, since consecutive interviews may be taken less or more than twelve months apart; 1991 "Wife" who was mover-out nonresponse by the time of the 1992 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.: from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1992 or mover-out nonresponse by 1991 (ER30733=0); born or moved in after the 1992 interview (ER30733>0 and ER30734=0)"

label define ER30739L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1992 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1992 or mover-out nonresponse by 1991 (ER30733=0); born or moved in after the 1992 interview (ER30733>0 and ER30734=0)"
forvalues n = 1/20 {
    label define ER30807L `n' "Individuals in the family at the time of the 1993 interview"  , modify
}
forvalues n = 51/59 {
    label define ER30807L `n' "Individuals in institutions at the time of the 1993 interview"  , modify
}
forvalues n = 71/80 {
    label define ER30807L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1992 and 1993 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER30807L `n' "Individuals who were living in 1992 but died by the time of the 1993 interview"  , modify
}
label define ER30807L        0 "Inap.:  born or moved in after the 1993 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1993 or mover-out nonresponse by 1992 (ER30806=0)"  , modify

label define ER30808L  ///
      10 "Head in 1993; 1992 Head who was mover-out nonresponse by the time of the 1993 interview"  ///
      20 "Legal Wife in 1993; 1992 Wife who was mover-out nonresponse by the time of the 1993 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1992 family, since consecutive interviews may be taken less or more than twelve months apart; 1992 "Wife" who was mover-out nonresponse by the time of the 1993 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.: from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1993 or mover-out nonresponse by 1992 (ER30806=0); born or moved in after the 1993 interview (ER30806>0 and ER30807=0)"

label define ER30812L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1993 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1993 or mover-out nonresponse by 1992 (ER30806=0); born or moved in after the 1993 interview (ER30806>0 and ER30807=0)"
forvalues n = 1/20 {
    label define ER33102L `n' "Individuals in the family at the time of the 1994 interview"  , modify
}
forvalues n = 51/59 {
    label define ER33102L `n' "Individuals in institutions at the time of the 1994 interview"  , modify
}
forvalues n = 71/80 {
    label define ER33102L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1993 and 1994 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER33102L `n' "Individuals who were living in 1993 but died by the time of the 1994 interview"  , modify
}
label define ER33102L        0 "Inap.:  born or moved in after the 1994 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1994 or mover-out nonresponse by 1993 (ER33101=0)"  , modify

label define ER33103L  ///
      10 "Head in 1994; 1993 Head who was mover-out nonresponse by the time of the 1994 interview"  ///
      20 "Legal Wife in 1994; 1993 Wife who was mover-out nonresponse by the time of the 1994 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1993 family, since consecutive interviews may be taken less or more than twelve months apart; 1993 "Wife" who was mover-out nonresponse by the time of the 1994 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.: from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1994 or mover-out nonresponse by 1993 (ER33101=0)"

label define ER33107L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       4 "Spouse in couple numbered 4"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1994 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1994 or mover-out nonresponse by 1993 (ER33101=0)"
forvalues n = 1/20 {
    label define ER33202L `n' "Individuals in the family at the time of the 1995 interview"  , modify
}
forvalues n = 51/59 {
    label define ER33202L `n' "Individuals in institutions at the time of the 1995 interview"  , modify
}
forvalues n = 71/80 {
    label define ER33202L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1994 and 1995 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER33202L `n' "Individuals who were living in 1994 but died by the time of the 1995 interview"  , modify
}
label define ER33202L        0 "Inap.:  born or moved in after the 1995 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1995 or mover-out nonresponse by 1994 (ER33201=0)"  , modify

label define ER33203L  ///
      10 "Head in 1995; 1994 Head who was mover-out nonresponse by the time of the 1995 interview"  ///
      20 "Legal Wife in 1995; 1994 Wife who was mover-out nonresponse by the time of the 1995 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more or who was present in the 1994 family, since consecutive interviews may be taken less or more than twelve months apart; 1994 "Wife" who was mover-out nonresponse by the time of the 1995 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.: from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1995 or mover-out nonresponse by 1994 (ER33201=0); born or moved in after the 1995 interview (ER33201>0 and ER33202=0)"

label define ER33207L  ///
       1 "Spouse in couple numbered 1"  ///
       2 "Spouse in couple numbered 2"  ///
       3 "Spouse in couple numbered 3"  ///
       4 "Spouse in couple numbered 4"  ///
       0 "Inap.:  not married or permanently cohabiting; spouse was not in FU at the time of the 1995 interview;from Immigrant sample (ER30001=3001-3511,4001-4851); main family nonresponse by 1995 or mover-out nonresponse by 1994 (ER33201=0); born or moved in after the 1995 interview (ER33201>0 and ER33202=0)"

label define ER3854L  ///
       1 "Yes"  ///
       5 "No"  ///
       0 "Wild code"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER3900L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 `"Inap.: no wife/"wife" in FU; no new wife/"wife" in FU"'
label define ER3916L        1 "One year or less"  , modify
forvalues n = 2/96 {
    label define ER3916L `n' "Actual number"  , modify
}
label define ER3916L       97 "Ninety-seven years or more"  , modify
label define ER3916L       98 "DK"  , modify
label define ER3916L       99 "NA; refused"  , modify
label define ER3916L        0 `"Inap.: never worked full time; wife/"wife" was under age 18 when this question was asked;  no new wife/"wife" in FU; never worked"'  , modify

label define ER3944L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER3967L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"
label define ER3986L        1 "One year or less"  , modify
forvalues n = 2/96 {
    label define ER3986L `n' "Actual number"  , modify
}
label define ER3986L       97 "Ninety-seven years or more"  , modify
label define ER3986L       98 "DK"  , modify
label define ER3986L       99 "NA; refused"  , modify
label define ER3986L        0 "Inap.: never worked full time; head was under age 18 when this question was asked; never worked"  , modify
forvalues n = 1/51 {
    label define ER4156L `n' "Actual state (PSID State code)"  , modify
}
label define ER4156L       99 "NA; DK;  Latino sample family"  , modify
label define ER4156L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define ER4157DL  ///
       1 "Same state at both times:  ER3919A equals ER4157"  ///
       2 "Same region, but different state: ER3919A does not equal ER4157 but ER4157E equals ER4157C"  ///
       3 "Different regions:  ER4157E does not equal ER4157C"  ///
       8 "DK"  ///
       9 "NA; ER3919A or ER4157C equals 99"

label define ER4159AL  ///
       1 `"Married or permanently cohabiting; wife, "wife," or husband is present in the FU"'  ///
       2 `"Single, never legally married and no wife, "wife," or husband is present in the FU"'  ///
       3 `"Widowed and no wife, "wife," or husband is present in the FU"'  ///
       4 `"Divorced and no wife, "wife," or husband is present in the FU"'  ///
       5 `"Separated; legally married but no wife, "wife," or husband is present in the FU  (the spouse may be in an institution)"'  ///
       9 "DK; NA"

label define ER5001L  ///
       1 "Release number 1 - August 1995"  ///
       2 "Release number 2 - January 2003"  ///
       3 "Release number 3 - March 2004"  ///
       4 "Release number 4 - May 2008"  ///
       5 "Release number 5 - November 2013"  ///
       6 "Release number 6 - January 2016"

label define ER5005FL  ///
       1 "Reinterview family"  ///
       2 "Splitoff from reinterview family"  ///
       3 "Recontact family"  ///
       4 "Splitoff from recontact family"
forvalues n = 14/96 {
    label define ER5006L `n' "Actual age"  , modify
}
label define ER5006L       97 "Ninety-seven years of age or older"  , modify
label define ER5006L        0 "Wild code"  , modify
label define ER5006L       98 "NA; DK"  , modify
label define ER5006L       99 "NA; DK"  , modify

label define ER5007L  ///
       1 "Male"  ///
       2 "Female"  ///
       0 "Wild code"
label define ER5008L        0 `"No wife/"wife" in FU: Head is female or single male"'  , modify
forvalues n = 14/96 {
    label define ER5008L `n' "Actual age"  , modify
}
label define ER5008L       97 "Ninety-seven years of age or older"  , modify
label define ER5008L       99 "NA; DK"  , modify
label define ER5009L        0 "None"  , modify
forvalues n = 1/18 {
    label define ER5009L `n' "Actual number"  , modify
}

label define ER5031L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"  ///
       9 "DK; NA; refused"

label define ER5061L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER6724L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER6770L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 `"Inap.: no wife/"wife" in FU"'
label define ER6786L        1 "One year or less"  , modify
forvalues n = 2/96 {
    label define ER6786L `n' "Actual number"  , modify
}
label define ER6786L       97 "Ninety-seven years or more"  , modify
label define ER6786L       98 "DK"  , modify
label define ER6786L       99 "NA; refused"  , modify
label define ER6786L        0 `"Inap.:  no wife/"wife" in FU; never worked full time; wife/"wife" was under age 18 when this question was asked;  never worked"'  , modify

label define ER6814L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       8 "DK"  ///
       9 "NA; refused"

label define ER6837L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"
label define ER6856L        1 "One year or less"  , modify
forvalues n = 2/96 {
    label define ER6856L `n' "Actual number"  , modify
}
label define ER6856L       97 "Ninety-seven years or more"  , modify
label define ER6856L       98 "DK"  , modify
label define ER6856L       99 "NA; refused"  , modify
label define ER6856L        0 "Inap.: never worked full time; head was under age 18 when this question was asked; never worked"  , modify
forvalues n = 1/51 {
    label define ER6996L `n' "Actual state (PSID State code)"  , modify
}
label define ER6996L       99 "NA; DK;  Latino sample family"  , modify
label define ER6996L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define ER6997DL  ///
       1 "Same state at both times:  ER6789A equals ER6997"  ///
       2 "Same region, but different state: ER6789A does not equal ER6997 but ER6997E equals ER6997C"  ///
       3 "Different regions:  ER6997E does not equal ER6997C"  ///
       8 "DK"  ///
       9 "NA; ER6789A or ER6997C equals 99"

label define ER6999AL  ///
       1 `"Married or permanently cohabiting; wife, "wife," or husband is present in the FU"'  ///
       2 `"Single, never legally married and no wife, "wife," or husband is present in the FU"'  ///
       3 `"Widowed and no wife, "wife," or husband is present in the FU"'  ///
       4 `"Divorced and no wife, "wife," or husband is present in the FU"'  ///
       5 `"Separated; legally married but no wife, "wife," or husband is present in the FU  (the spouse may be in an institution)"'  ///
       9 "DK; NA"

label define V1L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"

label define V10001L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V10003L `n' "Actual state (PSID State code)"  , modify
}
label define V10003L       99 "DK; NA"  , modify
label define V10003L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V10004L  ///
       0 "Data suppressed"

label define V10007L  ///
       0 "Blue (Main Family)"  ///
       1 "Yellow (Splitoff)"

label define V10019L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V10018=000000/V10437=5 or 8)"
forvalues n = 17/97 {
    label define V1008L `n' "Actual age of Head"  , modify
}
label define V1008L       98 "Ninety-eight years or older"  , modify
label define V1008L       99 "NA"  , modify

label define V1010L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/88 {
    label define V1011L `n' "Actual age in years"  , modify
}
label define V1011L       99 "NA"  , modify
label define V1011L        0 "Inap.: no Wife"  , modify
label define V1014L        0 "No family weight"  , modify
forvalues n = 1/46 {
    label define V1014L `n' "Actual family weight"  , modify
}

label define V103L  ///
       1 "Owns home (or trailer, fully or jointly)"  ///
       5 "Rents (or shares rent)"  ///
       8 "Neither (owns nor rents)"
forvalues n = 17/97 {
    label define V10419L `n' "Actual age"  , modify
}
label define V10419L       98 "98 years of age or older"  , modify
label define V10419L       99 "NA"  , modify

label define V10420L  ///
       1 "Male"  ///
       2 "Female"
label define V10421L        0 `"No Wife/"Wife" in FU:  Head is female (V10420=2) or single male"'  , modify
forvalues n = 14/97 {
    label define V10421L `n' "Actual age"  , modify
}
label define V10421L       98 "98 years of age or older"  , modify
label define V10421L       99 "NA"  , modify

label define V10422L  ///
       0 "None"  ///
       1 "One child"  ///
       2 "Two children"  ///
       3 "Three children"  ///
       4 "Four children"  ///
       5 "Five children"  ///
       6 "Six children"  ///
       7 "Seven children"  ///
       8 "Eight children"

label define V10437L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V10447L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V10879L  ///
       1 "Yes, including housework"  ///
       5 "No"  ///
       9 "NA; DK"

label define V10956L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V10421=00); finished more than twelve years of school (V10955=13-17 or 99)"'
label define V10963L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V10963L `n' "Actual number of years"  , modify
}
label define V10963L       98 "Ninety-eight years or more"  , modify
label define V10963L       99 "NA; DK"  , modify
label define V10963L        0 `"Inap.: never worked full time; no Wife/"Wife" in FU (V10421=00); never worked (V10962=00)"'  , modify
label define V10993L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V10993L `n' "Actual number of years"  , modify
}
label define V10993L       99 "NA; DK"  , modify
label define V10993L        0 "Inap.: never worked full time; never worked (V10992=00)"  , modify

label define V10997L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school (V10996=07-17 or 99)"

label define V1101L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V1103L `n' "Actual state (PSID State code)"  , modify
}
label define V1103L       99 "DK; NA"  , modify
label define V1103L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V11032L  ///
       1 "Same state at both times: V10982 equals V10003"  ///
       2 "Same region but different state: V10982 does not equal V10003 but V11028 equals V11029"  ///
       3 "Different regions: V11028 does not equal V11029"  ///
       9 "NA: V10003 or V10982 equals 99"

label define V1104L  ///
       0 "Data suppressed"

label define V11042L  ///
       0 "Cannot read or write, or has trouble reading or writing: V10999 equals 1"  ///
       1 "0-5 grades: V10996 equals 00-05 but V10999 does not equal 1"  ///
       2 `"6-8 grades; "grade school": V10996 equals 06-08"'  ///
       3 "9-11 grades: V10996 equals 09-11"  ///
       4 `"12 grades and no further training; "high school": V10996 equals 12 but V11000 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V10996 equals 12 and V11000 equals 1"  ///
       6 "College but no degree: V10996 equals 13-15 or V10996 equals 16-17 but V11002 does not equal 1"  ///
       7 "College BA but no advanced degree: V10996 equals 16-17 and V11002 equals 1 but V11003 does not equal 1"  ///
       8 "College and advanced or professional degree: V10996 equals 16-17 and V11003 equals 1"  ///
       9 "NA; DK: V10996 equals 99"

label define V11043L  ///
       1 "0-5 grades: V10955 equals 00-05"  ///
       2 `"6-8 grades; "grade school": V10955 equals 06-08"'  ///
       3 "9-11 grades: V10955 equals 09-11"  ///
       4 `"12 grades; "high school": V10955 equals 12 but V10956 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V10955 equals 12 and V10956 equals 1"  ///
       6 "College but no degree: V10955 equals 13-15 or V10955 equals 16-17 but V10958 does not equal 1"  ///
       7 "College BA but no advanced degree: V10955 equals 16-17 and V10958 equals 1 but V10959 does not equal 1"  ///
       8 "College and advanced or professional degree: V10955 equals 16-17 and V10959 equals 1"  ///
       9 "NA; DK: V10955 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU; V10421=00"'

label define V11046L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11047L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11048L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11049L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11050L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11051L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11052L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11053L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11054L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V11055L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"

label define V1106L  ///
       0 "Not a splitoff - (yellow cover sheet)"  ///
       1 "Splitoff family - (blue cover sheet)"

label define V11065L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"
forvalues n = 1/99 {
    label define V11079L `n' "Actual family weight"  , modify
}

label define V11101L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V11103L `n' "Actual state (PSID State code)"  , modify
}
label define V11103L       99 "DK; NA"  , modify
label define V11103L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V11104L  ///
       0 "Data suppressed"

label define V11107L  ///
       0 "Lavender (Main Family)"  ///
       1 "Grey (Splitoff)"

label define V11126L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V11125=000000/V11618=5 or 8)"

label define V1123L  ///
       0 "No assignments"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building"
forvalues n = 16/97 {
    label define V11606L `n' "Actual age"  , modify
}
label define V11606L       98 "Ninety-eight years of age or older"  , modify
label define V11606L       99 "NA"  , modify

label define V11607L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 17/97 {
    label define V11608L `n' "Actual age"  , modify
}
label define V11608L       98 "Ninety-eight years of age or older"  , modify
label define V11608L       99 "NA"  , modify
label define V11608L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V11607=2) or single male"'  , modify

label define V11609L  ///
       0 "None"  ///
       1 "One person"  ///
       2 "Two people"  ///
       3 "Three people"  ///
       4 "Four people"  ///
       5 "Five people"  ///
       6 "Six people"  ///
       7 "Seven people"  ///
       8 "Eight people"

label define V11618L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V11628L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
forvalues n = 1/96 {
    label define V117L `n' "Actual age"  , modify
}
label define V117L       97 "Ninety-seven years or older"  , modify
label define V117L       98 "DK"  , modify
label define V117L       99 "NA"  , modify
label define V11740L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V11740L `n' "Actual number of years"  , modify
}
label define V11740L       99 "NA; DK"  , modify
label define V11740L        0 "Inap.: worked full time for all years; Head is under age 18 (V11606=<18); not working for money now at all (V11639=5); never worked for money since age of 18 (V11739=00)"  , modify
forvalues n = 1/96 {
    label define V118L `n' "Actual years old"  , modify
}
label define V118L       97 "Ninety-seven years or older"  , modify
label define V118L       99 "NA"  , modify
label define V118L        0 "Inap.: no Wife"  , modify

label define V119L  ///
       1 "Male"  ///
       2 "Female"  ///
       9 "NA"

label define V11938L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       8 "More than 2 mentions"  ///
       9 "NA; DK"  ///
       0 "Inap.: no second mention"

label define V11964L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V11993L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V12103L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V12103L `n' "Actual number of years"  , modify
}
label define V12103L       99 "NA; DK"  , modify
label define V12103L        0 `"Inap.: worked full time for all years; Wife/"Wife" is under age 18 (V11608=<18); no Wife/"Wife" in FU (V11999=2 or 3); Wife/"Wife" refused (V12000=9); not working for money now at all (V12002=5); never worked for money since age 18 (V12102=00)"'  , modify

label define V12319L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: Head is male, no Wife/"Wife" in FU now (V11999=2); Head is female (V12261=2)"'

label define V12386L  ///
       1 "Same state at both times: V11915 equals V11103"  ///
       2 "Same region but different state: V11915 does not equal V11103 but V12379 equals V12383"  ///
       3 "Different regions: V12379 does not equal V12383"  ///
       9 "NA: V11103 or V11915 equals 99"
forvalues n = 16/93 {
    label define V1239L `n' "Actual age"  , modify
}
label define V1239L       99 "NA age"  , modify

label define V1240L  ///
       1 "Male"  ///
       2 "Female"

label define V12400L  ///
       1 "0-5 grades: V11945 equals 2 or 3 and V11948 or V11953 equals 01-05 and V11964 equals 5"  ///
       2 `"6-8 grades; "grade school": V11945 equals 2 or 3 and V11948 or V11953 equals 06-08, and V11964 equals 5"'  ///
       3 "9-11 grades: V11945 equals 2 or 3 and V11948 or V11953 equals 09-11, and V11964 equals 5"  ///
       4 `"12 grades and no further training; "high school": V11945 equals 1, V11956 equals 5, and V11964=5"'  ///
       5 "12 grades plus nonacademic training: V11945 and V11964 equals 1"  ///
       6 "College but no degree: V11956 equals 1 and V11959 equals 1-5, and V11961 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V11959 equals 4 or 5 and V11961 equals 02"  ///
       8 "College and advanced or professional degree: V11959 equals 4 or 5 and V11961 equals 03-06"  ///
       9 "NA; DK: V11945, V11956 or V11959 equals 9; V11948 or V11953 equals 99"

label define V12401L  ///
       1 "0-5 grades: V12300 equals 2 or 3 and V12303 or V12308 equals 01-05 and V12319 equals 5"  ///
       2 `"6-8 grades; "grade school": V12300 equals 2 or 3 and V12303 or V12308 equals 06-08, and V12319 equals 5"'  ///
       3 "9-11 grades: V12300 equals 2 or 3 and V12303 or V12308 equals 09-11, and V12319 equals 5"  ///
       4 `"12 grades and no further training; "high school": V12300 equals 1, V12311 equals 5, and V12319=5"'  ///
       5 "12 grades plus nonacademic training: V12300 and V12319 equals 1"  ///
       6 "College but no degree: V12311 equals 1 and V12314 equals 1-5, and V12316 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V12314 equals 4 or 5 and V12316 equals 02"  ///
       8 "College and advanced or professional degree: V12314 equals 4 or 5 and V12316 equals 03-06"  ///
       9 "NA; DK: V12300, V12311 or V12314 equals 9; V12303 or V12308 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V11608=00)"'

label define V12404L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12405L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12406L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12407L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12408L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12409L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"
forvalues n = 15/88 {
    label define V1241L `n' "Actual age"  , modify
}
label define V1241L       99 "NA"  , modify
label define V1241L        0 "Inap.: no Wife in family"  , modify

label define V12410L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12411L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12412L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V1242L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V12426L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife" or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife" or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife" or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife" or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife" or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"
forvalues n = 1/99 {
    label define V12446L `n' "Actual family weight"  , modify
}

label define V12501L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V12503L `n' "Actual state (PSID State code)"  , modify
}
label define V12503L       99 "DK; NA"  , modify
label define V12503L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V12504L  ///
       0 "Data suppressed"

label define V12507L  ///
       0 "Peach (Main Family)"  ///
       1 "Tan (Splitoff)"

label define V12525L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V12524=000000/V13023=5 or 8)"

label define V1264L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V1274L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA"
forvalues n = 17/97 {
    label define V13011L `n' "Actual age"  , modify
}
label define V13011L       98 "Ninety-eight years of age or older"  , modify
label define V13011L       99 "NA"  , modify

label define V13012L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/97 {
    label define V13013L `n' "Actual age"  , modify
}
label define V13013L       98 "Ninety-eight years of age or older"  , modify
label define V13013L       99 "NA"  , modify
label define V13013L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V13012=2) or single male"'  , modify

label define V13014L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"

label define V13023L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V13037L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V13427L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V13516L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V13484=5)"'
label define V13532L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V13532L `n' "Actual number of years"  , modify
}
label define V13532L       99 "NA; DK"  , modify
label define V13532L        0 `"Inap.: no Wife/"Wife" in FU (V13484=5); worked full time for all years; Wife/"Wife" was under age 18 in 1985; Wife/"Wife" was under age 18 in 1986; never worked since age 18 or did not work at all from January 1984 until the time of the 1985 interview and was Wife/"Wife" in 1985 (V13531=00)"'  , modify

label define V13565L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V13587L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V13606L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V13606L `n' "Actual number of years"  , modify
}
label define V13606L       99 "NA; DK"  , modify
label define V13606L        0 "Inap.: worked full time for all years; Head was under age 18 in 1985; Head was under age 18 in 1986; never worked since age 18 or did not work at all from January 1984 until the time of the 1985 interview and was Head in 1985 (V13605=00)"  , modify

label define V13636L  ///
       1 "Same state at both times: V13542 equals V12503"  ///
       2 "Same region but different state: V13542 does not equal V12503 but V13631 equals V13635"  ///
       3 "Different regions: V13631 does not equal V13635"  ///
       9 "NA: V12503 or V13542 equals 99"

label define V13640L  ///
       1 "0-5 grades: V13568 equals 2 or 3 and V13571 or V13576 equals 01-05 and V13568 equals 5"  ///
       2 `"6-8 grades; "grade school": V13568 equals 2 or 3 and V13571 or V13576 equals 06-08, and V13587 equals 5"'  ///
       3 "9-11 grades: V13568 equals 2 or 3 and V13571 or V13576 equals 09-11, and V13587 equals 5"  ///
       4 `"12 grades and no further training; "high school": V13568 equals 1, V13579 equals 5, and V13587 equals 5"'  ///
       5 "12 grades plus nonacademic training: V13568 and V13587 equal 1"  ///
       6 "College but no degree: V13579 equals 1 and V13582 equals 1-5, and V13584 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V13582 equals 4 or 5 and V13584 equals 02"  ///
       8 "College and advanced or professional degree: V13582 equals 4 or 5 and V13584 equals 03-06"  ///
       9 "NA; DK: V13568, V13579 or V13582 equals 9; V13571 or V13576 equals 99"

label define V13641L  ///
       1 "0-5 grades: V13503 equals 2 or 3 and V13505 or V13508 equals 01-05 and V13516 equals 5"  ///
       2 `"6-8 grades; "grade school": V13503 equals 2 or 3 and V13505 or V13508 equals 06-08, and V13516 equals 5"'  ///
       3 "9-11 grades: V13503 equals 2 or 3 and V13505 or V13508 equals 09-11, and V13516 equals 5"  ///
       4 `"12 grades and no further training; "high school": V13503 equals 1, V13510 equals 5, and V13516 equals 5"'  ///
       5 "12 grades plus nonacademic training: V13503 and V13516 equal 1"  ///
       6 "College but no degree: V13510 equals 1 and V13512 equals 1-5, and V13514 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V13512 equals 4 or 5 and V13514 equals 02"  ///
       8 "College and advanced or professional degree: V13512 equals 4 or 5 and V13514 equals 03-06"  ///
       9 "NA; DK: V13503, V13510 or V13512 equals 9; V13505 or V13508 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V13013=00)"'

label define V13644L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13645L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13646L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13647L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13648L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13649L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V1365L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V13650L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13651L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13652L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V13665L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V13701L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V13703L `n' "Actual state (PSID State code)"  , modify
}
label define V13703L       99 "DK; NA"  , modify
label define V13703L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V13704L  ///
       0 "Data suppressed"

label define V13707L  ///
       0 "Yellow (Main Family)"  ///
       1 "Lime (Splitoff)"

label define V13725L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V13724=000000/V14126=5 or 8)"

label define V1411L  ///
       1 "Yes"  ///
       3 "Yes, qualified, minor"  ///
       5 "No, age only"  ///
       9 "NA"
forvalues n = 17/97 {
    label define V14114L `n' "Actual age"  , modify
}
label define V14114L       98 "Ninety-eight years of age or older"  , modify
label define V14114L       99 "NA"  , modify

label define V14115L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V14116L `n' "Actual age"  , modify
}
label define V14116L       98 "Ninety-eight years of age or older"  , modify
label define V14116L       99 "NA"  , modify
label define V14116L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V14115=2) or single male"'  , modify

label define V14117L  ///
       0 "None"  ///
       1 "One person"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"

label define V14126L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V14140L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V14515L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V14563L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V14531=5)"'
label define V14579L        1 "One year or less"  , modify
forvalues n = 2/51 {
    label define V14579L `n' "Actual number of years"  , modify
}
label define V14579L       99 "NA; DK"  , modify
label define V14579L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V14531=5); never worked (V14578=00)"'  , modify

label define V14612L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V14634L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V14653L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V14653L `n' "Actual number of years"  , modify
}
label define V14653L       99 "NA; DK"  , modify
label define V14653L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V14652=00)"  , modify

label define V14683L  ///
       1 "Same state at both times: V14589 equals V13703"  ///
       2 "Same region but different state: V14589 does not equal V13703 but V14678 equals V14682"  ///
       3 "Different regions: V14678 does not equal V14682"  ///
       9 "NA: V13703 or V14589 equals 99"

label define V14687L  ///
       1 "0-5 grades: V14615 equals 2 or 3 and V14618 or V14623 equals 01-05 and V14615 equals 5"  ///
       2 `"6-8 grades; "grade school": V14615 equals 2 or 3 and V14618 or V14623 equals 06-08, and V14634 equals 5"'  ///
       3 "9-11 grades: V14615 equals 2 or 3 and V14618 or V14623 equals 09-11, and V14634 equals 5"  ///
       4 `"12 grades and no further training; "high school": V14615 equals 1, V14626 equals 5, and V14634 equals 5"'  ///
       5 "12 grades plus nonacademic training: V14615 and V14634 equal 1"  ///
       6 "College but no degree: V14626 equals 1 and V14629 equals 1-5, and V14631 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V14629 equals 4 or 5 and V14631 equals 02"  ///
       8 "College and advanced or professional degree: V14629 equals 4 or 5 and V14631 equals 03-06"  ///
       9 "NA; DK: V14615, V14626 or V14629 equals 9; V14618 or V14623 equals 99"

label define V14688L  ///
       1 "0-5 grades: V14550 equals 2 or 3 and V14552 or V14555 equals 01-05 and V14563 equals 5"  ///
       2 `"6-8 grades; "grade school": V14550 equals 2 or 3 and V14552 or V14555 equals 06-08, and V14563 equals 5"'  ///
       3 "9-11 grades: V14550 equals 2 or 3 and V14552 or V14555 equals 09-11, and V14563 equals 5"  ///
       4 `"12 grades and no further training; "high school": V14550 equals 1, V14557 equals 5, and V14563 equals 5"'  ///
       5 "12 grades plus nonacademic training: V14550 and V14563 equal 1"  ///
       6 "College but no degree: V14557 equals 1 and V14559 equals 1-5, and V14561 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V14559 equals 4 or 5 and V14561 equals 02"  ///
       8 "College and advanced or professional degree: V14559 equals 4 or 5 and V14561 equals 03-06"  ///
       9 "NA; DK: V14550, V14557 or V14559 equals 9; V14552 or V14555 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V14116=00)"'

label define V14691L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14692L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14693L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14694L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14695L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14696L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14697L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14698L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14699L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V14712L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"
label define V14737L        0 "No family weight"  , modify
forvalues n = 1/99 {
    label define V14737L `n' "Actual 1987 family weight"  , modify
}

label define V14801L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V14803L `n' "Actual state (PSID State code)"  , modify
}
label define V14803L       99 "DK; NA"  , modify
label define V14803L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V14804L  ///
       0 "Data suppressed"

label define V14807L  ///
       0 "Aqua (Main Family)"  ///
       1 "Pink (Splitoff)"

label define V14825L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V14824=000000/V15140=5 or 8)"

label define V1485L  ///
       0 "Could not read or write; DK grade and could not read or write"  ///
       1 "0 - 5 grades (or mentions could not read or write)"  ///
       2 "6 - 8 grades, grade school, DK but mentions could read or write"  ///
       3 "9 - 11 grades, some high school, junior high"  ///
       4 "12 grades, high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College degree, no advanced degree mentioned"  ///
       8 "College, advanced or professional degree"  ///
       9 "NA, DK to all L9 - L15a"

label define V1486L  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA"  ///
       0 "Inap.: no additional training or schooling and same Head in 1968, 1969, and 1970"

label define V1490L  ///
       1 "White"  ///
       2 "Negro"  ///
       3 "Spanish American, Puerto Rican, Mexican, Cuban"  ///
       7 "Other (Including Oriental, Pilipino)"  ///
       9 "NA"
forvalues n = 17/97 {
    label define V15130L `n' "Actual age"  , modify
}
label define V15130L       98 "Ninety-eight years of age or older"  , modify
label define V15130L       99 "NA"  , modify

label define V15131L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V15132L `n' "Actual age"  , modify
}
label define V15132L       98 "Ninety-eight years of age or older"  , modify
label define V15132L       99 "NA"  , modify
label define V15132L        0 `"Inap.: no Wife/"Wife" in FU: Head is female (V15131=2) or single male"'  , modify
label define V15133L        0 "None"  , modify
forvalues n = 1/9 {
    label define V15133L `n' "Actual number of children"  , modify
}

label define V15140L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V15148L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V1525L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V1576L  ///
       1 "Same state and region at both times (V1103 = V1477)"  ///
       2 "Same region but different state (V1103 NE V1477 but V1572 = V1573)"  ///
       3 "Different regions (V1572 NE V1573)"  ///
       9 "NA (V1103 or V1477 = 99)"

label define V15994L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V16037L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V16005=5)"'
label define V16053L        1 "One year or less"  , modify
forvalues n = 2/51 {
    label define V16053L `n' "Actual number of years"  , modify
}
label define V16053L       99 "NA; DK"  , modify
label define V16053L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V16005=5); never worked (V16052=00)"'  , modify

label define V16086L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       9 "NA; DK"
label define V1609L        0 "No weight"  , modify
forvalues n = 1/46 {
    label define V1609L `n' "Actual 1968 weight"  , modify
}

label define V16108L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V16127L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V16127L `n' "Actual number of years"  , modify
}
label define V16127L       99 "NA; DK"  , modify
label define V16127L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V16126=00 or 99)"  , modify

label define V16157L  ///
       1 "Same state at both times: V16063 equals V14803"  ///
       2 "Same region but different state: V16063 does not equal V14803 but V16152 equals V16156"  ///
       3 "Different regions: V16152 does not equal V16156"  ///
       9 "NA: V14803 or V16063 equals 99"

label define V16161L  ///
       1 "0-5 grades: V16089 equals 2 or 3 and V16092 or V16097 equals 01-05 and V16089 equals 5"  ///
       2 `"6-8 grades; "grade school": V16089 equals 2 or 3 and V16092 or V16097 equals 06-08, and V16108 equals 5"'  ///
       3 "9-11 grades: V16089 equals 2 or 3 and V16092 or V16097 equals 09-11, and V16108 equals 5"  ///
       4 `"12 grades and no further training; "high school": V16089 equals 1, V16100 equals 5, and V16108 equals 5"'  ///
       5 "12 grades plus nonacademic training: V16089 and V16108 equal 1"  ///
       6 "College but no degree: V16100 equals 1 and V16103 equals 1-5, and V16105 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V16103 equals 4 or 5 and V16105 equals 02"  ///
       8 "College and advanced or professional degree: V16103 equals 4 or 5 and V16105 equals 03-06"  ///
       9 "NA; DK: V16089, V16100 or V16103 equals 9; V16092 or V16097 equals 99"

label define V16162L  ///
       1 "0-5 grades: V16024 equals 2 or 3 and V16026 or V16029 equals 01-05 and V16037 equals 5"  ///
       2 `"6-8 grades; "grade school": V16024 equals 2 or 3 and V16026 or V16029 equals 06-08, and V16037 equals 5"'  ///
       3 "9-11 grades: V16024 equals 2 or 3 and V16026 or V16029 equals 09-11, and V16037 equals 5"  ///
       4 `"12 grades and no further training; "high school": V16024 equals 1, V16031 equals 5, and V16037 equals 5"'  ///
       5 "12 grades plus nonacademic training: V16024 and V16037 equal 1"  ///
       6 "College but no degree: V16031 equals 1 and V16033 equals 1-5, and V16035 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V16033 equals 4 or 5 and V16035 equals 02"  ///
       8 "College and advanced or professional degree: V16033 equals 4 or 5 and V16035 equals 03-06"  ///
       9 "NA; DK: V16024, V16031 or V16033 equals 9; V16026 or V16029 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V15132=00)"'

label define V16165L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16166L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16167L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16168L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16169L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16170L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16171L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16172L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16173L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V16187L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"
label define V16208L        0 "Family weight of zero"  , modify
forvalues n = 1/99 {
    label define V16208L `n' "Actual 1988 family weight"  , modify
}

label define V16301L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V16303L `n' "Actual state (PSID State code)"  , modify
}
label define V16303L       99 "DK; NA"  , modify
label define V16303L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V16304L  ///
       0 "Data suppressed"

label define V16307L  ///
       0 "Beige (Main Family)"  ///
       1 "Gray (Splitoff)"

label define V16325L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V16324=000000/V16641=5 or 8)"
forvalues n = 18/97 {
    label define V16631L `n' "Actual age"  , modify
}
label define V16631L       98 "Ninety-eight years of age or older"  , modify
label define V16631L       99 "NA"  , modify

label define V16632L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V16633L `n' "Actual age"  , modify
}
label define V16633L       98 "Ninety-eight years of age or older"  , modify
label define V16633L       99 "NA"  , modify
label define V16633L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V16632=2) or single male"'  , modify
label define V16634L        0 "None"  , modify
forvalues n = 1/9 {
    label define V16634L `n' "Actual number of people"  , modify
}

label define V16641L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V16649L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V17391L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V17434L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V17402=5)"'
label define V17450L        1 "One year or less"  , modify
forvalues n = 2/51 {
    label define V17450L `n' "Actual number of years"  , modify
}
label define V17450L       99 "NA; DK"  , modify
label define V17450L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V17402=5); never worked (V17449=00)"'  , modify

label define V17483L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V17505L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V17524L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V17524L `n' "Actual number of years"  , modify
}
label define V17524L       99 "NA; DK"  , modify
label define V17524L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V17523=00 or 99)"  , modify

label define V17543L  ///
       1 "Same state at both times: V17460 equals V16303"  ///
       2 "Same region but different state: V17460 does not equal V16303 but V17538 equals V17542"  ///
       3 "Different regions: V17538 does not equal V17542"  ///
       9 "NA: V16303 or V17460 equals 99"

label define V17545L  ///
       1 "0-5 grades: V17486 equals 2 or 3 and V17489 or V17494 equals 01-05 and V17486 equals 5"  ///
       2 `"6-8 grades; "grade school": V17486 equals 2 or 3 and V17489 or V17494 equals 06-08, and V17505 equals 5"'  ///
       3 "9-11 grades: V17486 equals 2 or 3 and V17489 or V17494 equals 09-11, and V17505 equals 5"  ///
       4 `"12 grades and no further training; "high school": V17486 equals 1, V17497 equals 5, and V17505 equals 5"'  ///
       5 "12 grades plus nonacademic training: V17486 and V17505 equal 1"  ///
       6 "College but no degree: V17497 equals 1 and V17500 equals 1-5, and V17502 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V17500 equals 4 or 5 and V17502 equals 02"  ///
       8 "College and advanced or professional degree: V17500 equals 4 or 5 and V17502 equals 03-06"  ///
       9 "NA; DK: V17486, V17497 or V17500 equals 9; V17489 or V17494 equals 99"

label define V17546L  ///
       1 "0-5 grades: V17421 equals 2 or 3 and V17423 or V17426 equals 01-05 and V17434 equals 5"  ///
       2 `"6-8 grades; "grade school": V17421 equals 2 or 3 and V17423 or V17426 equals 06-08, and V17434 equals 5"'  ///
       3 "9-11 grades: V17421 equals 2 or 3 and V17423 or V17426 equals 09-11, and V17434 equals 5"  ///
       4 `"12 grades and no further training; "high school": V17421 equals 1, V17428 equals 5, and V17434 equals 5"'  ///
       5 "12 grades plus nonacademic training: V17421 and V17434 equal 1"  ///
       6 "College but no degree: V17428 equals 1 and V17430 equals 1-5, and V17432 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V17430 equals 4 or 5 and V17432 equals 02"  ///
       8 "College and advanced or professional degree: V17430 equals 4 or 5 and V17432 equals 03-06"  ///
       9 "NA; DK: V17421, V17428 or V17430 equals 9; V17423 or V17426 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V16633=00)"'

label define V17547L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17548L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17549L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17550L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17551L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17552L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17553L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17554L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17555L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V17565L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V17701L  ///
       2 "Release Number 2 - May 2008"  ///
       3 "Release Number 3 - December 2013"
forvalues n = 1/51 {
    label define V17703L `n' "Actual state (PSID State code)"  , modify
}
label define V17703L       99 "DK; NA"  , modify
label define V17703L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V17704L  ///
       0 "Data suppressed"

label define V17707L  ///
       0 "Blue (Reinterview Family)"  ///
       1 "Yellow (Splitoff)"  ///
       2 "Pink (Recontact)"  ///
       3 "Tan (Latino)"

label define V17725L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V17724=000000/V18072=5 or 8)"

label define V1801L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V1803L `n' "Actual state (PSID State code)"  , modify
}
label define V1803L       99 "DK; NA"  , modify
label define V1803L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V1804L  ///
       0 "Data suppressed"
forvalues n = 17/97 {
    label define V18049L `n' "Actual age"  , modify
}
label define V18049L       98 "Ninety-eight years of age or older"  , modify
label define V18049L       99 "NA"  , modify

label define V18050L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V18051L `n' "Actual age"  , modify
}
label define V18051L       98 "Ninety-eight years of age or older"  , modify
label define V18051L       99 "NA"  , modify
label define V18051L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V18050=2) or single male"'  , modify
label define V18052L        0 "None"  , modify
forvalues n = 1/9 {
    label define V18052L `n' "Actual number of people"  , modify
}

label define V1806L  ///
       0 "Not a splitoff  - (Gray cover sheet)"  ///
       1 "Splitoff family  - (Orange cover sheet)"

label define V18072L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V18087L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V181L  ///
       1 "White"  ///
       2 "Negro"  ///
       3 "Puerto Rican, Mexican"  ///
       7 "Other (including Oriental, Pilipino)"  ///
       9 "NA"

label define V1824L  ///
       0 "No assignments"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc., between dwelling and other purposes of building"

label define V18722L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V18765L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V18733=5)"'
label define V18781L        1 "One year or less"  , modify
forvalues n = 2/54 {
    label define V18781L `n' "Actual number of years"  , modify
}
label define V18781L       99 "NA; DK"  , modify
label define V18781L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V18733=5); never worked (V18780=00)"'  , modify

label define V18814L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V18836L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V18855L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V18855L `n' "Actual number of years"  , modify
}
label define V18855L       99 "NA; DK"  , modify
label define V18855L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V18854=00 or 99)"  , modify

label define V18894L  ///
       1 "Same state at both times: V18791 equals V17703"  ///
       2 "Same region but different state: V18791 does not equal V17703 but V18889 equals V18893"  ///
       3 "Different regions: V18889 does not equal V18893"  ///
       9 "NA: V17703 or V18791 equals 99"

label define V18898L  ///
       1 "0-5 grades: V18817 equals 2 or 3 and V18820 or V18825 equals 01-05 and V18817 equals 5"  ///
       2 `"6-8 grades; "grade school": V18817 equals 2 or 3 and V18820 or V18825 equals 06-08, and V18836 equals 5"'  ///
       3 "9-11 grades: V18817 equals 2 or 3 and V18820 or V18825 equals 09-11, and V18836 equals 5"  ///
       4 `"12 grades and no further training; "high school": V18817 equals 1, V18828 equals 5, and V18836 equals 5"'  ///
       5 "12 grades plus nonacademic training: V18817 and V18836 equal 1"  ///
       6 "College but no degree: V18828 equals 1 and V18831 equals 1-5, and V18833 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V18831 equals 4 or 5 and V18833 equals 02"  ///
       8 "College and advanced or professional degree: V18831 equals 4 or 5 and V18833 equals 03-06"  ///
       9 "NA; DK: V18817, V18828 or V18831 equals 9; V18820 or V18825 equals 99"

label define V18899L  ///
       1 "0-5 grades: V18752 equals 2 or 3 and V18754 or V18757 equals 01-05 and V18765 equals 5"  ///
       2 `"6-8 grades; "grade school": V18752 equals 2 or 3 and V18754 or V18757 equals 06-08, and V18765 equals 5"'  ///
       3 "9-11 grades: V18752 equals 2 or 3 and V18754 or V18757 equals 09-11, and V18765 equals 5"  ///
       4 `"12 grades and no further training; "high school": V18752 equals 1, V18759 equals 5, and V18765 equals 5"'  ///
       5 "12 grades plus nonacademic training: V18752 and V18765 equal 1"  ///
       6 "College but no degree: V18759 equals 1 and V18761 equals 1-5, and V18763 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V18761 equals 4 or 5 and V18763 equals 02"  ///
       8 "College and advanced or professional degree: V18761 equals 4 or 5 and V18763 equals 03-06"  ///
       9 "NA; DK: V18752, V18759 or V18761 equals 9; V18754 or V18757 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V18051=00)"'

label define V18901L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18902L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18903L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18904L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18905L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18906L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18907L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18908L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18909L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V18916L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V19001L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V19003L `n' "Actual state (PSID State code)"  , modify
}
label define V19003L       99 "DK; NA"  , modify
label define V19003L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V19004L  ///
       0 "Data suppressed"

label define V19007L  ///
       0 "Green (Reinterview Family)"  ///
       1 "Yellow (Splitoff)"

label define V19025L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V19024=000000/V19372=5 or 8)"
forvalues n = 17/97 {
    label define V19349L `n' "Actual age"  , modify
}
label define V19349L       98 "Ninety-eight years of age or older"  , modify
label define V19349L       99 "NA"  , modify

label define V19350L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V19351L `n' "Actual age"  , modify
}
label define V19351L       98 "Ninety-eight years of age or older"  , modify
label define V19351L       99 "NA"  , modify
label define V19351L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V19350=2) or single male"'  , modify
label define V19352L        0 "None"  , modify
forvalues n = 1/8 {
    label define V19352L `n' "Actual number of people"  , modify
}

label define V19372L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V19387L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
forvalues n = 15/97 {
    label define V1942L `n' "Actual age"  , modify
}
label define V1942L       98 "Ninety-eight years of age or older"  , modify
label define V1942L       99 "NA, DK"  , modify

label define V1943L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/97 {
    label define V1944L `n' "Actual age"  , modify
}
label define V1944L       98 "Ninety-eight years of age or older"  , modify
label define V1944L       99 "NA, DK"  , modify
label define V1944L        0 "Inap.: no Wife listed in family"  , modify

label define V1945L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V1967L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V1979L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA, DK"

label define V20022L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V20065L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V20033=5)"'
label define V20081L        1 "One year or less"  , modify
forvalues n = 2/55 {
    label define V20081L `n' "Actual number of years"  , modify
}
label define V20081L       99 "NA; DK"  , modify
label define V20081L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V20033=5); never worked (V20080=00)"'  , modify

label define V20114L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V20136L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V20155L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V20155L `n' "Actual number of years"  , modify
}
label define V20155L       99 "NA; DK"  , modify
label define V20155L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V20154=00 or 99)"  , modify

label define V20194L  ///
       1 "Same state at both times: V20091 equals V19003"  ///
       2 "Same region but different state: V20091 does not equal V19003 but V20189 equals V20193"  ///
       3 "Different regions: V20189 does not equal V20193"  ///
       9 "NA: V19003 or V20091 equals 99"

label define V20201L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20202L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20203L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20204L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20205L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20206L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20207L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20208L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20209L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V20216L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V20301L  ///
       3 "Release number 3 - May 2008"  ///
       4 "Release number 4 - December 2013"
forvalues n = 1/51 {
    label define V20303L `n' "Actual state (PSID State code)"  , modify
}
label define V20303L       99 "DK; NA"  , modify
label define V20303L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V20304L  ///
       0 "Data suppressed"

label define V20307L  ///
       0 "Gray (Reinterview Family)"  ///
       1 "Green (Splitoff)"  ///
       2 "Pink (Reinterview Recontact)"  ///
       3 "Lime (Splitoff Recontact)"  ///
       4 "Orange (Sample Recontact)"  ///
       5 "Goldenrod (Latino Recontact)"

label define V20325L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V20324=000000/V20672=5 or 8)"
forvalues n = 14/97 {
    label define V20651L `n' "Actual age"  , modify
}
label define V20651L       98 "Ninety-eight years of age or older"  , modify
label define V20651L       99 "NA"  , modify

label define V20652L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V20653L `n' "Actual age"  , modify
}
label define V20653L       98 "Ninety-eight years of age or older"  , modify
label define V20653L       99 "NA"  , modify
label define V20653L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V20652=2) or single male"'  , modify
label define V20654L        0 "None"  , modify
forvalues n = 1/18 {
    label define V20654L `n' "Actual number of people"  , modify
}

label define V20672L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V20687L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V2072L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V2123L  ///
       1 "Yes"  ///
       3 "Yes, qualified, minor limitation"  ///
       5 "No"  ///
       9 "NA, DK, age"

label define V21322L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V21371L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V21339=5)"'
label define V21387L        1 "One year or less"  , modify
forvalues n = 2/55 {
    label define V21387L `n' "Actual amount"  , modify
}
label define V21387L       99 "NA; DK"  , modify
label define V21387L        0 `"Inap.: never worked full time; Wife/"Wife" was under age 18 when this question was asked; no Wife/ "Wife" in FU (V21339=5); never worked (V21386=00)"'  , modify

label define V21420L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V21442L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V21461L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V21461L `n' "Actual number of years"  , modify
}
label define V21461L       98 "Ninety-eight years or more"  , modify
label define V21461L       99 "NA; DK"  , modify
label define V21461L        0 "Inap.: never worked full time; Head was under age 18 when this question was asked; never worked (V21460=00 or 99)"  , modify

label define V215L  ///
       1 "Yes, a year ago; within the last year or more recently; 1967 or 1968"  ///
       2 "Yes, 2 - 3 years ago; 1965 or 1966"  ///
       3 "Yes, 4 - 9 years ago; 1959-1964"  ///
       4 "Yes, 10 or more years ago; before 1959; 1958 or earlier"  ///
       5 "No"  ///
       8 "Yes, NA when"  ///
       9 "NA; DK"  ///
       0 "Inap.: not asked of retired"

label define V21500L  ///
       1 "Same state at both times: V21397 equals V20303"  ///
       2 "Same region but different state: V21397 does not equal V20303 but V21495 equals V21499"  ///
       3 "Different regions: V21495 does not equal V21499"  ///
       9 "NA: V20303 or V21397 equals 99"

label define V21507L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21508L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21509L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21510L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21511L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21512L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21513L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21514L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21515L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V21522L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife", or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife", or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife", or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife", or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife", or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V21601L  ///
       1 "Release number 1 - January 1998"  ///
       2 "Release number 2 - February 1998"  ///
       3 "Release number 3 - April 2000"  ///
       4 "Release number 4 - May 2008"
forvalues n = 1/51 {
    label define V21603L `n' "Actual state (PSID State code)"  , modify
}
label define V21603L       99 "DK; NA"  , modify
label define V21603L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V21606L  ///
       1 "Blue (Reinterview Family)"  ///
       2 "Lavender (Splitoff from Reinterview Family)"  ///
       3 "Peach (Recontact Family)"  ///
       4 "Lavender (Splitoff from Recontact Family)"

label define V21611L  ///
       0 "Actual value"  ///
       1 "Imputed value"

label define V2197L  ///
       1 "0-5 grades"  ///
       2 "6-8 grades, grade school, DK but mentions could read or write"  ///
       3 "9-11 grades, some high school, junior high"  ///
       4 "12 grades, high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College degree, no advanced degree mentioned"  ///
       8 "College, advanced or professional degree"  ///
       9 "NA, DK to all of L33-L40"  ///
       0 "Inap.: cannot read or write or has trouble reading or writing"

label define V2198L  ///
       0 "No additional training or school and same Head all four years"  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA, DK"

label define V2202L  ///
       1 "White"  ///
       2 "Negro"  ///
       3 "Spanish American, Puerto Rican, Mexican, Cuban"  ///
       7 "Other (including Oriental, Filipino)"  ///
       9 "NA"

label define V2237L  ///
       0 "$0"  ///
       1 "$1  - 499"  ///
       2 "$500-999"  ///
       3 "$1000-1999"  ///
       4 "$2000-2999"  ///
       5 "$3000-3999"  ///
       6 "$4000-4999"  ///
       7 "$5000-7499"  ///
       8 "$7500-9999"  ///
       9 "$10,000 or more"
forvalues n = 14/97 {
    label define V22406L `n' "Actual age"  , modify
}
label define V22406L       98 "Ninety-eight years of age or older"  , modify
label define V22406L       99 "NA"  , modify

label define V22407L  ///
       1 "Male"  ///
       2 "Female"
label define V22408L        0 `"No wife/"wife" in FU: Head is female or single male"'  , modify
forvalues n = 14/97 {
    label define V22408L `n' "Actual age"  , modify
}
label define V22408L       98 "Ninety-eight years of age or older"  , modify
label define V22408L       99 "NA"  , modify
label define V22409L        0 "None"  , modify
forvalues n = 1/18 {
    label define V22409L `n' "Actual number"  , modify
}

label define V22427L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V22441L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V2288L  ///
       1 "Same state and region at both times (V1803 EQ V2189)"  ///
       2 "Same region but different state (V1803 NE V2189 but V2284 EQ V2285)"  ///
       3 "Different regions (V2284 NE V2285)"  ///
       9 "NA (V1803 or V2189 NE 99)"

label define V23181L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V2321L        0 "No weight"  , modify
forvalues n = 1/46 {
    label define V2321L `n' "Actual weight"  , modify
}

label define V23228L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no wife/"wife" in FU"'
label define V23244L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V23244L `n' "Actual number"  , modify
}
label define V23244L       98 "Ninety-eight years or more"  , modify
label define V23244L       99 "NA; DK"  , modify
label define V23244L        0 `"Inap.: never worked full time; wife/"wife" was under age 18 when this question was asked; no wife/"wife" in FU ; never worked"'  , modify

label define V23276L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       9 "NA; DK"

label define V23298L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V23317L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V23317L `n' "Actual number"  , modify
}
label define V23317L       98 "Ninety-eight years or more"  , modify
label define V23317L       99 "NA; DK"  , modify
label define V23317L        0 "Inap.: never worked full time; head was under age 18 when this question was asked; never worked"  , modify

label define V23332L  ///
       1 "Same state at both times: V21397 equals V20303"  ///
       2 "Same region but different state: V21397 does not equal V20303 but V21495 equals V21499"  ///
       3 "Different regions: V21495 does not equal V21499"  ///
       9 "NA: V20303 or V21397 equals 99"

label define V23336L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife," or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife," or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife," or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife," or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife," or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"

label define V239L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"  ///
       8 "Married, spouse absent"  ///
       9 "NA"

label define V2401L  ///
       2 "Release number 2 -- May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V2403L `n' "Actual state (PSID State code)"  , modify
}
label define V2403L       99 "DK; NA"  , modify
label define V2403L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V2404L  ///
       0 "Data suppressed"

label define V2407L  ///
       0 "Brown (Main Family)"  ///
       1 "Yellow (Split-off)"  ///
       2 "Blue (Main Family)"  ///
       3 "Pink (Split-off)"

label define V2424L  ///
       0 "No assignment"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building"

label define V246L  ///
       1 "0 - 5 grades"  ///
       2 "6 - 8 grades, grade school"  ///
       3 "9 - 11 grades (some high school)"  ///
       4 "12 grades (completed high school)"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College, bachelors degree"  ///
       8 "College, advanced or professional degree, some graduate work, close to receiving degree"  ///
       9 "NA; DK"  ///
       0 "Inap.: no Wife"
forvalues n = 17/96 {
    label define V2542L `n' "Actual age"  , modify
}
label define V2542L       99 "NA age"  , modify

label define V2543L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/91 {
    label define V2544L `n' "Actual age"  , modify
}
label define V2544L       99 "NA; DK"  , modify
label define V2544L        0 "Inap.: no Wife listed in family"  , modify
forvalues n = 1/12 {
    label define V2545L `n' "Actual number of children"  , modify
}
label define V2545L        0 "Inap.: no children in FU"  , modify

label define V2566L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V2577L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V261L  ///
       0 "None"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 4999"  ///
       6 "$5000 - 7499"  ///
       7 "$7500 - 9,999"  ///
       8 "$10,000 or more"  ///
       9 "NA"

label define V2670L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V2687L  ///
       1 "0 - 5 grades"  ///
       2 "6 - 8 grades, grade school; DK but mentions could read or write"  ///
       3 "9 - 11 grades (some high school)"  ///
       4 "12 grades (completed high school)"  ///
       5 "12 grades plus non-academic training"  ///
       6 "Some college, no degree"  ///
       7 "College, bachelors degree"  ///
       8 "College, advanced or professional degree; some graduate work; close to receiving degree"  ///
       9 "NA; DK"  ///
       0 "Inap.: no Wife"

label define V2718L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V2823L  ///
       0 "Cannot read or write or has trouble reading or writing"  ///
       1 "0 - 5 grades"  ///
       2 `"6 - 8 grades; "grade school"; DK but mentions could read or write"'  ///
       3 "9 - 11 grades; some high school; junior high"  ///
       4 "12 grades; high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College degree, no advanced degree mentioned"  ///
       8 "College, advanced or professional degree"  ///
       9 "NA; DK to all of M33 and M40"

label define V2824L  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA; DK"  ///
       0 "Inap.: no new Head"

label define V2828L  ///
       1 "White"  ///
       2 "Negro"  ///
       3 "Spanish American; Puerto Rican; Mexican; Cuban"  ///
       7 "Other (including Oriental, Filipino)"  ///
       9 "NA"

label define V2863L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V2915L  ///
       1 "Same state and region at both times (V2403 EQ V2815)"  ///
       2 "Same region but different state (V2403 NE V2815 but V2911 EQ V2912)"  ///
       3 "Different regions (V2911 NE V2912)"  ///
       9 "NA (V2403 or V2815 EQ 99)"
label define V2968L        0 "No family weight"  , modify
forvalues n = 1/46 {
    label define V2968L `n' "Actual 1972 family weight"  , modify
}

label define V3001L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V3003L `n' "Actual state (PSID State code)"  , modify
}
label define V3003L       99 "DK; NA"  , modify
label define V3003L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V3004L  ///
       0 "Data suppressed"

label define V3007L  ///
       0 "Peach (Main Family)"  ///
       1 "Green (Splitoff)"

label define V3022L  ///
       0 "No assignment"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc., between dwelling and other purposes of building"
forvalues n = 17/97 {
    label define V3095L `n' "Actual age"  , modify
}
label define V3095L       99 "NA"  , modify

label define V3096L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/92 {
    label define V3097L `n' "Actual age"  , modify
}
label define V3097L       99 "NA"  , modify
label define V3097L        0 "Inap.: no Wife listed in family"  , modify
label define V3098L        0 "None"  , modify
forvalues n = 1/12 {
    label define V3098L `n' "Actual number of children"  , modify
}

label define V3108L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V3110L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V313L  ///
       0 "0 - 5 grades and has difficulty reading"  ///
       1 "0 - 5 grades, no difficulty reading"  ///
       2 "6 - 8 grades"  ///
       3 "9 - 11 grades"  ///
       4 "12 grades (completed high school)"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College, bachelors degree (A.B., B.S., etc.)"  ///
       8 "College, advanced or professional degrees (M.A., Ph.D., LLB, BD, M.S., etc.)"  ///
       9 "NA; DK"

label define V314L  ///
       0 "No training except regular school and college"  ///
       1 "Some training outside the regular school system (apprenticeships, manpower training programs, etc."  ///
       9 "NA"

label define V3181L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V3216L  ///
       1 "0 - 5 grades"  ///
       2 "6 - 8 grades, grade school; DK but mentions could read or write"  ///
       3 "9 - 11 grades (some high school)"  ///
       4 "12 grades (completed high school)"  ///
       5 "12 grades plus non-academic training"  ///
       6 "Some college, no degree"  ///
       7 "College, bachelors degree"  ///
       8 "College, advanced or professional degree; some graduate work; close to receiving degree"  ///
       9 "NA; DK"  ///
       0 "Inap.: no new Wife in 1972; no Wife"

label define V3241L  ///
       1 "0 - 5 grades"  ///
       2 `"6 - 8 grades; "grade school" DK but mentions could read or write"'  ///
       3 "9 - 11 grades; some high school; junior high"  ///
       4 "12 grades; high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College degree, no advanced degree mentioned"  ///
       8 "College, advanced or professional degree"  ///
       9 "NA; DK to all of K23 - K30"  ///
       0 "Inap.: cannot read or write or has trouble reading or writing"

label define V3242L  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA; DK"

label define V3244L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V3267L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V3283L  ///
       1 "Same state at both times"  ///
       2 "Same region but different state"  ///
       3 "Different regions"  ///
       9 "NA (V3003 or V3233 EQ 99)"

label define V3300L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V3301L        0 "No family weight"  , modify
forvalues n = 1/46 {
    label define V3301L `n' "Actual weight"  , modify
}

label define V3401L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V3403L `n' "Actual state (PSID State code)"  , modify
}
label define V3403L       99 "DK; NA"  , modify
label define V3403L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V3404L  ///
       0 "Data suppressed"

label define V3407L  ///
       0 "Blue (Main Family)"  ///
       1 "Yellow (Splitoff)"

label define V3418L  ///
       0 "No assignment"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc., between dwelling and other purposes of building"
forvalues n = 17/93 {
    label define V3508L `n' "Actual age"  , modify
}
label define V3508L       99 "NA; DK"  , modify

label define V3509L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/93 {
    label define V3510L `n' "Actual age"  , modify
}
label define V3510L       99 "NA; DK"  , modify
label define V3510L        0 "Inap.: no Wife listed in family"  , modify
label define V3511L        0 "None"  , modify
forvalues n = 1/11 {
    label define V3511L `n' "Actual number of children"  , modify
}

label define V3522L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V3524L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V3598L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"
label define V3611L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V3611L `n' "Actual number of years"  , modify
}
label define V3611L       98 "Ninety-eight years or more"  , modify
label define V3611L       99 "NA; DK"  , modify
label define V3611L        0 "Inap.: none; Wife has never worked; Wife has never worked full time; no Wife"  , modify
label define V3621L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V3621L `n' "Actual number of years"  , modify
}
label define V3621L       98 "Ninety-eight years or more"  , modify
label define V3621L       99 "NA; DK"  , modify
label define V3621L        0 "Inap.: none; Head has never worked; Head has never worked full time"  , modify

label define V363L  ///
       0 "Lives in same state where grew up (V93 EQ V311)"  ///
       1 "Lives in same region but different state (V361 EQ V362, and V93 NE V311)"  ///
       2 "Lives in both a different state and different region from where grew up (V361 NE V362)"  ///
       9 "Region where grew up NA"

label define V3638L  ///
       1 "0 - 5 grades"  ///
       2 "6 - 8 grades, grade school; DK but mentions could read or write"  ///
       3 "9 - 11 grades (some high school)"  ///
       4 "12 grades (completed high school)"  ///
       5 "12 grades plus non-academic training"  ///
       6 "Some college, no degree"  ///
       7 "College, bachelors degree"  ///
       8 "College, advanced or professional degree; some graduate work; close to receiving degree"  ///
       9 "NA; DK"  ///
       0 "Inap.: no Wife in 1974"

label define V3663L  ///
       1 "0 - 5 grades"  ///
       2 `"6 - 8 grades; "grade school" DK but mentions could read and write"'  ///
       3 "9 - 11 grades; some high school; junior high"  ///
       4 "12 grades; high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College but no degree"  ///
       7 "College BA and no advanced degree mentioned"  ///
       8 "College and advanced or professional degree"  ///
       9 "NA; DK to all of K23 - K30"  ///
       0 "Inap.: cannot read or write or has trouble reading or writing"

label define V3664L  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA; DK"

label define V3666L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V3687L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V3703L  ///
       1 "Same state at both times (V3403 EQ V3679)"  ///
       2 "Same region but different state (V3403 NE V3655 but V3699 EQ V3700)"  ///
       3 "Different regions (V3699 NE V3700)"  ///
       9 "NA (V3403 or V3655 EQ 99)"

label define V3720L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V3721L        0 "No weight"  , modify
forvalues n = 1/72 {
    label define V3721L `n' "Actual weight"  , modify
}

label define V3801L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V3803L `n' "Actual state (PSID State code)"  , modify
}
label define V3803L       99 "DK; NA"  , modify
label define V3803L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V3804L  ///
       0 "Data suppressed"

label define V3807L  ///
       0 "Green (Main Family)"  ///
       1 "Pink (Splitoff)"

label define V3818L  ///
       0 "No assignment"  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc., between dwelling and other purposes of building"
forvalues n = 16/97 {
    label define V3921L `n' "Actual age"  , modify
}
label define V3921L       98 "Ninety-eight years of age or older"  , modify
label define V3921L       99 "NA; DK age"  , modify

label define V3922L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/97 {
    label define V3923L `n' "Actual age"  , modify
}
label define V3923L       98 "Ninety-eight years of age or older"  , modify
label define V3923L       99 "NA; DK age"  , modify
label define V3923L        0 "Inap.: no Wife"  , modify
label define V3924L        0 "None"  , modify
forvalues n = 1/10 {
    label define V3924L `n' "Actual number of children"  , modify
}

label define V3939L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V3941L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V398L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4053L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V4094L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V4093 = 07 - 99"

label define V4103L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife; V4101 = 5 or V4102 = 13 - 17, 99"
label define V4111L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V4111L `n' "Actual number of years"  , modify
}
label define V4111L       98 "Ninety-eight years or more"  , modify
label define V4111L       99 "NA; DK"  , modify
label define V4111L        0 "Inap.: None; Wife has never worked; Wife has never worked full time; no Wife; V3923 = 00 or V4110 = 00"  , modify
label define V4142L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V4142L `n' "Actual number of years"  , modify
}
label define V4142L       98 "Ninety-eight years or more"  , modify
label define V4142L       99 "NA; DK"  , modify
label define V4142L        0 "Inap.: none; Head has never worked; Head has never worked full time; V4141 = 00"  , modify

label define V4145L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V4165L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V4182L  ///
       1 "Same state at both times (V3803 EQ V4131)"  ///
       2 "Same region but different state (V3803 NE V4055 but V4178 EQ V4179)"  ///
       3 "Different regions (V4178 NE V4179)"  ///
       9 "NA (V3803 or V4131 EQ 99)"

label define V4198L  ///
       1 "0 - 5 grades"  ///
       2 `"6 - 8 grades; " grade school""'  ///
       3 "9 - 11 grades; high school"  ///
       4 "12 grades; high school"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College but no degree"  ///
       7 "College BA and no advanced degree mentioned"  ///
       8 "College and advanced or professional degree"  ///
       9 "NA; DK"  ///
       0 "Inap.: cannot not read or write; or has trouble reading or writing (V4096 =1)"

label define V4199L  ///
       1 "0 - 5 grades (V4102 EQ 00 - 05)"  ///
       2 `"6 - 8 grades; "grade school" (V4102 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V4102 EQ 09 - 11)"  ///
       4 "12 grades; high school (V4102 EQ 12 and V4103 NE 1)"  ///
       5 "12 grades plus nonacademic training (V4102 EQ 12 and V4103 EQ 1)"  ///
       6 "College but no degree (V4102 EQ 13 - 15 or V4102 EQ 13 - 15 and V4105 NE 1)"  ///
       7 "College BA and no advanced degree (V4102 EQ 16 - 17 and V4105 EQ 1 and V4106 NE 1)"  ///
       8 "College and advanced or professional degree (V4102 EQ 16 - 17 and V4106 EQ 1)"  ///
       9 "NA; DK (V4102 EQ 99)"  ///
       0 "Inap.: no Wife in FU"

label define V4204L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"

label define V4207L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4208L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4209L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4210L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4211L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4212L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4213L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4214L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V4215L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"
label define V4224L        0 "No weight"  , modify
forvalues n = 1/70 {
    label define V4224L `n' "Actual weight"  , modify
}

label define V4301L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V4303L `n' "Actual state (PSID State code)"  , modify
}
label define V4303L       99 "DK; NA"  , modify
label define V4303L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V4304L  ///
       0 "Data suppressed"

label define V4307L  ///
       0 "Beige (Main Family)"  ///
       1 "Coral (Splitoff)"

label define V4319L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building"  ///
       0 "Inap.: no assignment; not a home owner"
forvalues n = 1/32 {
    label define V439L `n' "Actual weight"  , modify
}

label define V441L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 16/97 {
    label define V4436L `n' "Actual age"  , modify
}
label define V4436L       98 "Ninety-eight years of age or older"  , modify
label define V4436L       99 "NA; DK"  , modify

label define V4437L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 14/97 {
    label define V4438L `n' "Actual age"  , modify
}
label define V4438L       98 "Ninety-eight years of age or older"  , modify
label define V4438L       99 "NA; DK"  , modify
label define V4438L        0 "Inap.: no Wife in FU"  , modify

label define V4439L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"  ///
      10 "Ten"

label define V4450L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V4452L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V450L  ///
       0 "No assignments"  ///
       1 "Minor assignment"  ///
       2 "Major assignment (probable errors more than $300 or 10%)"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building"

label define V4603L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V4625L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
label define V4631L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V4631L `n' "Actual number of years"  , modify
}
label define V4631L       98 "Ninety-eight years or more"  , modify
label define V4631L       99 "NA; DK"  , modify
label define V4631L        0 "Inap.: none; Head has never worked; Head has never worked full time; V4630 = 00"  , modify

label define V4685L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V4684 = 07 - 99"

label define V4696L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife; V4438 = 00 or V4695 = 13 - 17, 99"
label define V4990L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V4990L `n' "Actual number of years"  , modify
}
label define V4990L       98 "Ninety-eight years or more"  , modify
label define V4990L       99 "NA; DK"  , modify
label define V4990L        0 "Inap.: no Wife`=char(146)'s interview; none; Wife has never worked; Wife has never worked full time; V4989 = 00"  , modify

label define V5041L  ///
       0 "$0"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 3999"  ///
       6 "$4000 - 4999"  ///
       7 "$5000 - 7499"  ///
       8 "$7500 - 9999"  ///
       9 "$10,000 or more"

label define V5058L  ///
       1 "Same state at both times (V4303 EQ V4674)"  ///
       2 "Same region but different state (V4303 NE V4674 but V5054 EQ V5055)"  ///
       3 "Different regions (V5054 NE V5055)"  ///
       9 "NA (V4303 or V4674 EQ 99)"

label define V5074L  ///
       0 "Cannot read or write, or has trouble reading or writing (V4687 EQ 1)"  ///
       1 "0 - 5 grades (V4684 EQ 00 - 05 and V4687 NE 1)"  ///
       2 `"6 - 8 grades; "grade school" (V4684 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V4684 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V4684 EQ 12 and V4688 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V4684 EQ 12 and V4688 EQ 1)"  ///
       6 "College but no degree (V4684 EQ 13 - 15 or V4684 EQ 16 - 17 and V4690 NE 1)"  ///
       7 "College BA and no advanced degree (V4684 EQ 16 - 17 and V4690 EQ 1 and V4691 NE 1)"  ///
       8 "College and advanced or professional degree (V4684 EQ 16 - 17 and V4691 EQ 1)"  ///
       9 "NA; DK (V4684 EQ 99)"

label define V5075L  ///
       1 "0 - 5 grades (V4695 EQ 00 - 05)"  ///
       2 `"6 - 8 grades; "grade school" (V4695 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V4695 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V4695 EQ 12 and V4696 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V4695 EQ 12 and V4696 EQ 1)"  ///
       6 "College but no degree (V4695 EQ 13 - 15 or V4695 EQ 16 - 17 and V4698 NE 1)"  ///
       7 "College BA and no advanced degree (V4695 EQ 16 - 17 and V4698 EQ 1 and V4699 NE 1)"  ///
       8 "College and advanced or professional degree (V4695 EQ 16 - 17 and V4699 EQ 1)"  ///
       9 "NA; DK (V4695 EQ 99)"  ///
       0 "Inap.: no Wife in FU"

label define V5079L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5080L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5081L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5082L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5083L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5084L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5085L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5086L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5087L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5096L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V5099L        0 "No weight"  , modify
forvalues n = 1/70 {
    label define V5099L `n' "Actual weight"  , modify
}

label define V5201L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V5203L `n' "Actual state (PSID State code)"  , modify
}
label define V5203L       99 "DK; NA"  , modify
label define V5203L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V5204L  ///
       0 "Data suppressed"

label define V5207L  ///
       0 "Purple (Main Family)"  ///
       1 "Lavender (Splitoff)"

label define V5218L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment"
forvalues n = 17/95 {
    label define V5350L `n' "Actual age of Head"  , modify
}
label define V5350L       99 "NA"  , modify

label define V5351L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/97 {
    label define V5352L `n' "Actual age of Wife or permanent friend"  , modify
}
label define V5352L       98 "Ninety-eight years of age or older"  , modify
label define V5352L       99 "NA; DK"  , modify
label define V5352L        0 "Inap.: no Wife in FU; V5351=2"  , modify

label define V5353L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"

label define V5364L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V5366L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"
forvalues n = 1/51 {
    label define V537L `n' "Actual state (PSID State code)"  , modify
}
label define V537L       99 "DK; NA"  , modify
label define V537L        0 "Inap.:  U.S. territory or foreign country"  , modify
label define V550L        0 "No children"  , modify
forvalues n = 1/13 {
    label define V550L `n' "Actual number of children"  , modify
}

label define V5560L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V5568L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife; V5352 = 00 or V5567 = 13 - 17, 99"
label define V5575L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V5575L `n' "Actual number of years"  , modify
}
label define V5575L       98 "Ninety-eight years or more"  , modify
label define V5575L       99 "NA; DK"  , modify
label define V5575L        0 "Inap.: none; never worked; never worked full time; no Wife; V5352 = 00 or V5574 = 00"  , modify
label define V5605L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V5605L `n' "Actual number of years"  , modify
}
label define V5605L       98 "Ninety-eight years or more"  , modify
label define V5605L       99 "NA; DK"  , modify
label define V5605L        0 "Inap.: none; never worked; never worked full time; V5604 = 00"  , modify

label define V5609L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V5608 = 07 - 99"

label define V5637L  ///
       1 "Same state at both times (V5203 EQ V5594)"  ///
       2 "Same region but different state (V5203 NE V5594 but V5633 EQ V5634)"  ///
       3 "Different regions (V5633 NE V5634)"  ///
       9 "NA (V5203 or V5594 EQ 99)"

label define V5647L  ///
       0 "Cannot read or write, or has trouble reading or writing (V5611 EQ 1)"  ///
       1 "0 - 5 grades (V5608 EQ 00 - 05 and V5611 NE 1)"  ///
       2 `"6 - 8 grades; "grade school" (V5608 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V5608 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V5608 EQ 12 and 412 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V5608 EQ 12 and V5612 EQ 1)"  ///
       6 "College but no degree (V5608 EQ 13 - 15 or V5608 16 - 17 and V5614 NE 1)"  ///
       7 "College BA and no advanced degree (V5608 16 - 17 and V5614 EQ 1 and V5615 NE 1)"  ///
       8 "College and advanced or professional degree (V5608 EQ 16 - 17 and V5615 EQ 1)"  ///
       9 "NA; DK (V5608 EQ 99)"

label define V5648L  ///
       1 "0 - 5 grades (V5567 EQ 00 - 05)"  ///
       2 `"6 - 8 grades; "grade school" (V5567 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V5567 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V5567 EQ 12 and V5568 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V5567 EQ 12 and V5568 EQ 1)"  ///
       6 "College but no degree (V5567 EQ 13 - 15)"  ///
       7 "College BA and no advanced degree (V5567 EQ 16 - 17 and V5570 EQ 1 and V5571 NE 1)"  ///
       8 "College and advanced or professional degree (V5567 EQ 16 - 17 and V5571 EQ 1)"  ///
       9 "NA; DK (V5567 EQ 99)"  ///
       0 "Inap.: no Wife in FU"

label define V5650L  ///
       1 "Married or permanently cohabitating; spouse may be institutionalized and therefore not in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V5653L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5654L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5655L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5656L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5657L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5658L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5659L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5660L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5661L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V5662L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V5665L        0 "No family weight"  , modify
forvalues n = 1/72 {
    label define V5665L `n' "Actual family weight"  , modify
}

label define V5701L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V5703L `n' "Actual state (PSID State code)"  , modify
}
label define V5703L       99 "DK; NA"  , modify
label define V5703L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V5704L  ///
       0 "Data suppressed"

label define V5707L  ///
       0 "Gold (Main Family)"  ///
       1 "Yellow (Splitoff)"

label define V5718L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment"
forvalues n = 16/96 {
    label define V5850L `n' "Actual age"  , modify
}
label define V5850L       99 "NA"  , modify

label define V5851L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/90 {
    label define V5852L `n' "Actual age"  , modify
}
label define V5852L       99 "NA"  , modify
label define V5852L        0 "Inap.: no Wife or Permanent Friend in FU"  , modify

label define V5853L  ///
       0 "None"  ///
       1 "One child"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"

label define V5864L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V5866L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V593L  ///
       1 "Owns home (or trailer, fully or jointly)"  ///
       5 "Rents"  ///
       8 "Neither owns nor rents"

label define V603L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA"

label define V607L  ///
       1 "Married"  ///
       2 "Single"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V6102L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V6117L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife/friend; V6116 = 13 - 17, 99"
label define V6124L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V6124L `n' "Actual number of years"  , modify
}
label define V6124L       98 "Ninety-eight years or more"  , modify
label define V6124L       99 "NA; DK"  , modify
label define V6124L        0 "Inap.: none; never worked; never worked full time; no Wife/friend; V6123 = 00"  , modify
label define V6154L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V6154L `n' "Actual number of years"  , modify
}
label define V6154L       98 "Ninety-eight  years or more"  , modify
label define V6154L       99 "NA; DK"  , modify
label define V6154L        0 "Inap.: none; never worked; never worked full time; V6153 = 00"  , modify

label define V6158L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V6157 = 07 - 17, 99"

label define V6184L  ///
       1 "Same state at both times (V5703 EQ V6143)"  ///
       2 "Same region but different state (V5703 NE V6143 but V6180 EQ V6181)"  ///
       3 "Different regions (V6180 NE V6181)"  ///
       9 "NA (V5703 or V6143 EQ 99)"

label define V6194L  ///
       0 "Cannot read or write, or has trouble reading or writing (V6160 EQ 1)"  ///
       1 "0 - 5 grades (V6157 EQ 00 - 05 and V6160 NE 1)"  ///
       2 `"6 - 8 grades; "grade school" (V6157 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V6157 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V6157 EQ 12 and V6161 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V6157 EQ 12 and V6161 EQ 1)"  ///
       6 "College but no degree (V6157 EQ 13 - 15 or V6157 EQ 16 - 17 and V6163 NE 1)"  ///
       7 "College BA and no advanced degree (V6157 EQ 16 - 17 and V6163 EQ 1 and V6164 NE 1)"  ///
       8 "College and advanced or professional degree (V6157 EQ 16 - 17 and V6164 EQ 1)"  ///
       9 "NA; DK (V6157 = 99)"

label define V6195L  ///
       1 "0 - 5 grades (V6116 EQ 00 - 05)"  ///
       2 `"6 - 8 grades; "grade school" (V6116 EQ 06 - 08)"'  ///
       3 "9 - 11 grades (V6116 EQ 09 - 11)"  ///
       4 `"12 grades; "high school" (V6116 EQ 12 and V6117 NE 1)"'  ///
       5 "12 grades plus nonacademic training (V6116 EQ 12 and V6117 EQ 1)"  ///
       6 "College but no degree (V6116 EQ 13 - 15 or V6116 EQ 16, 17 and V6119 NE 1)"  ///
       7 "College BA and no advanced degree (V6116 EQ 16 - 17 and V6119 EQ 1 and V6120 NE 1)"  ///
       8 "College and advanced or professional degree (V6116 EQ 16 - 17 and V6120 EQ 1)"  ///
       9 "NA; DK (V6116 EQ 99)"  ///
       0 "Inap.: no Wife in FU"

label define V6197L  ///
       1 "Married or permanently cohabitating; spouse may be institutionalized and therefore not in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V6200L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6201L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6202L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6203L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6204L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6205L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6206L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6207L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6208L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6209L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V6212L        0 "No family weight"  , modify
forvalues n = 1/72 {
    label define V6212L `n' "Actual family weight"  , modify
}

label define V6301L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V6303L `n' "Actual state (PSID State code)"  , modify
}
label define V6303L       99 "DK; NA"  , modify
label define V6303L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V6304L  ///
       0 "Data suppressed"

label define V6307L  ///
       0 "Green (Main Family)"  ///
       1 "Light green (Splitoff)"

label define V6320L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc., between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment"
forvalues n = 17/97 {
    label define V6462L `n' "Actual age"  , modify
}
label define V6462L       99 "NA"  , modify

label define V6463L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/91 {
    label define V6464L `n' "Actual age"  , modify
}
label define V6464L       99 "NA"  , modify
label define V6464L        0 "Inap.: no Wife or Permanent Friend in FU"  , modify

label define V6465L  ///
       0 "None"  ///
       1 "One child"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"

label define V6479L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V6484L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V6710L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V6714L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife/friend; V6464=00; V6713=13-17,99"
label define V6721L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V6721L `n' "Actual number of years"  , modify
}
label define V6721L       98 "Ninety-eight years or more"  , modify
label define V6721L       99 "NA"  , modify
label define V6721L        0 "Inap.: none; never worked; never worked full time; no Wife/ friend; V6464=00; V6720=00"  , modify
label define V6751L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V6751L `n' "Actual number of years"  , modify
}
label define V6751L       98 "Ninety-eight years or more"  , modify
label define V6751L       99 "NA; DK"  , modify
label define V6751L        0 "Inap.: none; never worked; never worked full time; V6750=00"  , modify

label define V6755L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V6754=07-17,99"

label define V6777L  ///
       1 "Same state at both times (V6303= V6740)"  ///
       2 "Same region but different state (V6303 not equal to V6740 but V6743 = V6774)"  ///
       3 "Different regions (V6773 not equal to V6774)"  ///
       9 "NA (V6303 or V6740 = 99)"

label define V6787L  ///
       0 "Cannot read or write, or has trouble reading or writing (V6757 = 1)"  ///
       1 "0-5 grades (V6754 = 00-05 and V6757 not equal to 1)"  ///
       2 `"6-8 grades; "grade school" (V6754 = 06-08)"'  ///
       3 "9-11 grades (V6754 = 09-11)"  ///
       4 `"12 grades; "high school" (V6754 = 12 and V6758 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V6754 = 12 and V6758 = 1)"  ///
       6 "College but no degree (V6754 = 13-15 or V6754 = 16-17 and V6750 not equal to 1)"  ///
       7 "College BA and no advanced degree (V6754 = 16-17 and V6760 = 1 and V6761 not equal 1)"  ///
       8 "College and advanced or professional degree (V6754 = 16-17 and V6761 = 1)"  ///
       9 "NA; DK (V6754 = 99)"

label define V6788L  ///
       1 "0-5 grades (V6713 = 00-05)"  ///
       2 `"6-8 grades; "grade school" (V6713 = 06-08)"'  ///
       3 "9-11 grades (V6713 = 09-11)"  ///
       4 `"12 grades; "high school" (V6713 = 12 and V6714 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V6713 = 12 and V6714 = 1)"  ///
       6 "College but no degree (V6713 = 13-15 or V6713 = 16, 17 and V6716 not equal to 1)"  ///
       7 "College BA and no advanced degree (V6713 = 16-17 and V6716 = 1 and V6717 not equal to 1)"  ///
       8 "College and advanced or professional degree (V6713 = 16-17 and V6717 = 1)"  ///
       9 "NA; DK (V6713 = 99)"  ///
       0 "Inap.: no Wife in FU"

label define V6790L  ///
       1 "Married or permanently cohabitating; spouse may be institutionalized and therefore not in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V6793L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6794L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6795L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6796L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6797L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6798L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6799L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6800L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6801L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V6802L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V6805L        0 "No weight"  , modify
forvalues n = 1/77 {
    label define V6805L `n' "Actual weight"  , modify
}

label define V6901L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V6903L `n' "Actual state (PSID State code)"  , modify
}
label define V6903L       99 "DK; NA"  , modify
label define V6903L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V6904L  ///
       0 "Data suppressed"

label define V6907L  ///
       0 "Gray (Main Family)"  ///
       1 "Light blue (Splitoff)"

label define V6918L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of property taxes, etc. between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment; V6917=0"

label define V7L  ///
       0 "No assignments"  ///
       1 "Minor assignment"  ///
       2 "Major assignment; probable error of greater than $300 or 10 percent of assignment value (whichever is greater)"  ///
       3 "Complex property - the reported house value included farm or business property, but imputed rent and housing payments were computed on the basis of the estimated portion of property used for housing"  ///
       5 "Estimate not an accurate reflection of income or payments in 1967"  ///
       8 "Wild code"
forvalues n = 16/97 {
    label define V7067L `n' "Actual age"  , modify
}
label define V7067L       98 "Ninety-eight years of age or older"  , modify
label define V7067L       99 "NA"  , modify

label define V7068L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 15/97 {
    label define V7069L `n' "Actual age"  , modify
}
label define V7069L       98 "Ninety-eight years of age or older"  , modify
label define V7069L       99 "NA"  , modify
label define V7069L        0 "Inap.: no Wife or Permanent Friend in FU; V7068=2"  , modify

label define V7070L  ///
       0 "None"  ///
       1 "One child"  ///
       2 "Two children"  ///
       3 "Three children"  ///
       4 "Four children"  ///
       5 "Five children"  ///
       6 "Six children"  ///
       7 "Seven children"  ///
       8 "Eight children"

label define V7084L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V7089L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V709L  ///
       0 "None"  ///
       1 "$1 - 499"  ///
       2 "$500 - 999"  ///
       3 "$1000 - 1999"  ///
       4 "$2000 - 2999"  ///
       5 "$3000 - 4999"  ///
       6 "$5000 - 7499"  ///
       7 "$7500 - 9999"  ///
       8 "$10,000 or more"  ///
       9 "NA"

label define V7343L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V7347L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife/friend; V7069=00; V7346=13-17,99"
label define V7354L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V7354L `n' "Actual number of years"  , modify
}
label define V7354L       98 "Ninety-eight years or more"  , modify
label define V7354L       99 "NA"  , modify
label define V7354L        0 "Inap.: none; never worked; never worked full time; no Wife/ friend; V7069=00; V7353=00"  , modify
label define V7384L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V7384L `n' "Actual number of years"  , modify
}
label define V7384L       98 "Ninety-eight years or more"  , modify
label define V7384L       99 "NA; DK"  , modify
label define V7384L        0 "Inap.: none; never worked; never worked full time; V7383=00"  , modify

label define V7388L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V7387=07-17,99"

label define V7423L  ///
       1 "Same state at both times (V6903= V7373)"  ///
       2 "Same region but different state (V6903 not equal to V7373 but V7419 = V7420)"  ///
       3 "Different regions (V7419 not equal to V7420)"  ///
       9 "NA (V6903 or V7373 = 99)"

label define V7433L  ///
       0 "Cannot read or write, or has trouble reading or writing (V7390 = 1)"  ///
       1 "0-5 grades (V7387 = 00-05 and V7390 not equal to 1)"  ///
       2 `"6-8 grades; "grade school" (V7387 = 06-08)"'  ///
       3 "9-11 grades (V7387 = 09-11)"  ///
       4 `"12 grades; "high school" (V7387 = 12 and V7391 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V7387 = 12 and V7391 = 1)"  ///
       6 "College but no degree (V7387 = 13-15 or V7387 = 16-17 and V7393 not equal to 1)"  ///
       7 "College BA and no advanced degree (V7387 = 16-17 and V7393 = 1 and V7394 not equal 1)"  ///
       8 "College and advanced or professional degree (V7387 = 16-17 and V7394 = 1)"  ///
       9 "NA; DK (V7387 = 99)"

label define V7434L  ///
       1 "0-5 grades (V7346 = 00-05)"  ///
       2 `"6-8 grades; "grade school" (V7346 = 06-08)"'  ///
       3 "9-11 grades (V7346 = 09-11)"  ///
       4 `"12 grades; "high school" (V7346 = 12 and V7347 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V7346 = 12 and V7347 = 1)"  ///
       6 "College but no degree (V7346 = 13-15 or V7346 = 16, 17 and V7349 not equal to 1)"  ///
       7 "College BA and no advanced degree (V7346 = 16-17 and V7349 = 1 and V7350 not equal to 1)"  ///
       8 "College and advanced or professional degree (V7346 = 16-17 and V7350 = 1)"  ///
       9 "NA; DK (V7346 = 99)"  ///
       0 "Inap.: no Wife in FU; V7069=00"

label define V7435L  ///
       1 "Married or permanently cohabitating; spouse may be institutionalized and therefore not in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V7438L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7439L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7440L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7441L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7442L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7443L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7444L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7445L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7446L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V7447L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"

label define V745L  ///
       1 "Yes"  ///
       3 "Yes, qualified"  ///
       5 "No"  ///
       9 "NA"
label define V7451L        0 "No family weight"  , modify
forvalues n = 1/77 {
    label define V7451L `n' "Actual family weight"  , modify
}

label define V7501L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V7503L `n' "Actual state (PSID State code)"  , modify
}
label define V7503L       99 "DK; NA"  , modify
label define V7503L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V7504L  ///
       0 "Data suppressed"

label define V7507L  ///
       0 "Orange (Main Family)"  ///
       1 "Yellow (Splitoff)"

label define V7518L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment; V7517=0"
forvalues n = 17/97 {
    label define V7658L `n' "Actual age"  , modify
}
label define V7658L       98 "98 years of age or older"  , modify
label define V7658L       99 "NA"  , modify

label define V7659L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/97 {
    label define V7660L `n' "Actual age"  , modify
}
label define V7660L       98 "98 years of age or older"  , modify
label define V7660L       99 "NA"  , modify
label define V7660L        0 "Inap.: no Wife/friend in FU; V7659=2"  , modify

label define V7661L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"

label define V7675L  ///
       1 "Owns or is buying house or trailer (fully or jointly)"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V7700L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V794L  ///
       0 "Cannot read or write or has trouble"  ///
       1 "0 - 5 grades"  ///
       2 "6 - 8 grades"  ///
       3 "9 - 11 grades"  ///
       4 "12 grades"  ///
       5 "12 grades plus non-academic training"  ///
       6 "College, no degree"  ///
       7 "College, bachelor`=char(146)'s degree"  ///
       8 "College, advanced or professional degree"  ///
       9 "NA; DK"

label define V795L  ///
       1 "Yes, some training outside the regular school system"  ///
       5 "No training or schooling except regular school and college"  ///
       9 "NA"  ///
       0 "Inap.: no new Head in FU"

label define V7974L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V7999L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: has more than twelve years of school; no Wife/friend; V7660=00; V7998=13-17,99"
label define V8006L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V8006L `n' "Actual number of years"  , modify
}
label define V8006L       98 "Ninety-eight years or more"  , modify
label define V8006L       99 "NA; DK"  , modify
label define V8006L        0 "Inap.: none; never worked; never worked full time; no Wife/ friend; V7660=00; V8005=00"  , modify

label define V801L  ///
       1 "White"  ///
       2 "Negro"  ///
       3 "Puerto Rican, Mexican, Cuban"  ///
       7 "Other (including Oriental, Pilipino)"
label define V8036L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V8036L `n' "Actual number of years"  , modify
}
label define V8036L       99 "NA; DK"  , modify
label define V8036L        0 "Inap.: none; never worked; never worked full time; V8035=00"  , modify

label define V8040L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V8039=07-17,99"

label define V8075L  ///
       1 "Same state at both times (V8025 = V7503)"  ///
       2 "Same region but different state (V8025 not equal to V7503 but V8071 = V8072)"  ///
       3 "Different regions (V8071 not equal to V8072)"  ///
       9 "NA (V7503 or V8025 = 99)"

label define V8085L  ///
       0 "Cannot read or write, or has trouble reading or writing (V8042 = 1)"  ///
       1 "0-5 grades (V8039 = 00-05 and V8042 not equal to 1)"  ///
       2 `"6-8 grades; "grade school" (V8039 = 06-08)"'  ///
       3 "9-11 grades (V8039 = 09-11)"  ///
       4 `"12 grades; "high school" (V8039 = 12 and V8043 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V8039 = 12 and V8043 = 1)"  ///
       6 "College but no degree (V8039 = 13-15 or V8039 = 16-17 and V8045 not equal to 1)"  ///
       7 "College BA and no advanced degree (V8039 = 16-17 and V8045 = 1 and V8046 not equal 1)"  ///
       8 "College and advanced or professional degree (V8039 = 16-17 and V8046 = 1)"  ///
       9 "NA; DK (V8039 = 99)"

label define V8086L  ///
       1 "0-5 grades (V7998 = 00-05)"  ///
       2 `"6-8 grades; "grade school" (V7998 = 06-08)"'  ///
       3 "9-11 grades (V7998 = 09-11)"  ///
       4 `"12 grades; "high school" (V7998 = 12 and V7999 not equal to 1)"'  ///
       5 "12 grades plus nonacademic training (V7998 = 12 and V7999 = 1)"  ///
       6 "College but no degree (V7998 = 13-15 or V7998 = 16, 17 and V8001 not equal to 1)"  ///
       7 "College BA and no advanced degree (V7998 = 16-17 and V8001 = 1 and V8002 not equal to 1)"  ///
       8 "College and advanced or professional degree (V7998 = 16-17 and V8002 = 1)"  ///
       9 "NA; DK (V7998 = 99)"  ///
       0 "Inap.: no Wife in FU; V7660=00"

label define V8087L  ///
       1 "Married or permanently cohabitating; spouse may be institutionalized and therefore not in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"

label define V8090L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8091L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8092L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8093L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8094L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8095L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8096L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8097L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8098L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8099L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V8103L        0 "No family weight"  , modify
forvalues n = 1/77 {
    label define V8103L `n' "Actual family weight"  , modify
}

label define V8201L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V8203L `n' "Actual state (PSID State code)"  , modify
}
label define V8203L       99 "DK; NA"  , modify
label define V8203L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V8204L  ///
       0 "Data suppressed"

label define V8207L  ///
       0 "Beige (Main Family)"  ///
       1 "Pink (Splitoff)"

label define V8218L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: not a home owner; no assignment; V8217=0"
forvalues n = 17/97 {
    label define V8352L `n' "Actual age"  , modify
}
label define V8352L       98 "Ninety-eight years of age or older"  , modify
label define V8352L       99 "NA"  , modify

label define V8353L  ///
       1 "Male"  ///
       2 "Female"
label define V8354L        0 "No Wife/friend in FU; Head is female or single male; V8353=2"  , modify
forvalues n = 14/97 {
    label define V8354L `n' "Actual age"  , modify
}
label define V8354L       98 "Ninety-eight years of age or older"  , modify
label define V8354L       99 "NA"  , modify

label define V8355L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"

label define V8364L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V8369L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V8616L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V8623L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: no Wife/friend in FU; finished more than twelve years of school; V8354=00; V8622=13-17,99"
label define V8630L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V8630L `n' "Actual number of hours per week"  , modify
}
label define V8630L       98 "Ninety-eight years or more"  , modify
label define V8630L       99 "NA; DK"  , modify
label define V8630L        0 "Inap.: none; no Wife/friend in FU; never worked; never worked full time; V8354=00; V8629=00"  , modify
label define V8660L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V8660L `n' "Actual number of years"  , modify
}
label define V8660L       99 "NA; DK"  , modify
label define V8660L        0 "Inap.: none; never worked; never worked full time; V8659=00"  , modify

label define V8664L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school; V8663=07-17,99"

label define V8699L  ///
       1 "Same state at both times: V8649 equals V8203"  ///
       2 "Same region but different state: V8649 does not equal V8203 but V8695 equals V8696"  ///
       3 "Different regions: V8695 does not equal V8696"  ///
       9 "NA: V8203 or V8649 equals 99"

label define V8709L  ///
       0 "Cannot read or write, or has trouble reading or writing: V8666 equals 1"  ///
       1 "0-5 grades: V8663 equals 00-05 but V8666 does not equal 1"  ///
       2 `"6-8 grades; "grade school": V8663 equals 06-08"'  ///
       3 "9-11 grades: V8663 equals 09-11"  ///
       4 `"12 grades and no further training; "high school": V8663 equals 12 but V8667 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V8663 equals 12 and V8667 equals 1"  ///
       6 "College but no degree: V8663 equals 13-15 or V8663 equals 16-17 but V8669 does not equal 1"  ///
       7 "College BA but no advanced degree: V8663 equals 16-17 and V8669 equals 1 but V8070 does not equal 1"  ///
       8 "College and advanced or professional degree: V8663 equals 16-17 and V8070 equals 1"  ///
       9 "NA; DK: V8663 equals 99"

label define V8710L  ///
       1 "0-5 grades: V8622 equals 00-05"  ///
       2 `"6-8 grades; "grade school": V8622 equals 06-08"'  ///
       3 "9-11 grades: V8622 equals 09-11"  ///
       4 `"12 grades; "high school": V8622 equals 12 but V8623 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V8622 equals 12 and V8623 equals 1"  ///
       6 "College but no degree: V8622 equals 13-15 or V8622 equals 16-17 but V8625 does not equal 1"  ///
       7 "College BA but no advanced degree: V8622 equals 16-17 and V8625 equals 1 but V8636 does not equal 1"  ///
       8 "College and advanced or professional degree: V8622 equals 16-17 and V8626 equals 1"  ///
       9 "NA; DK: V8622 equals 99"  ///
       0 "Inap.: no Wife/friend in FU; V8354=00"

label define V8711L  ///
       1 "Married or permanently cohabiting; spouse must be in the FU"  ///
       2 "Single, never legally married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated; legally married but spouse is not in the FU (may be in an institution)"  ///
       9 "NA; DK"

label define V8714L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8715L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8716L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8717L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8718L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8719L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8720L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8721L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8722L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V8723L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"
label define V8727L        0 "No weight"  , modify
forvalues n = 1/94 {
    label define V8727L `n' "Actual family weight"  , modify
}

label define V878L  ///
       1 "Same state and region at both times (V537 = V787)"  ///
       2 "Same region but different state (V537 NE V787 but V876 = V877)"  ///
       3 "Different regions (V876 NE V877)"  ///
       9 "NA (V787 or V537 = 99)"

label define V8801L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 1/51 {
    label define V8803L `n' "Actual state (PSID State code)"  , modify
}
label define V8803L       99 "DK; NA"  , modify
label define V8803L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V8804L  ///
       0 "Data suppressed"

label define V8807L  ///
       0 "Buff (Main Family)"  ///
       1 "Lime (Splitoff)"

label define V8818L  ///
       1 "Minor assignment"  ///
       2 "Major assignment"  ///
       3 "Complex property, requiring allocation of house value between dwelling and other purposes of building/land"  ///
       0 "Inap.: no assignment; not a home owner (V8817=000000/V8974=5 or 8)"
forvalues n = 14/97 {
    label define V8961L `n' "Actual age"  , modify
}
label define V8961L       98 "Ninety-eight years of age or older"  , modify
label define V8961L       99 "NA"  , modify

label define V8962L  ///
       1 "Male"  ///
       2 "Female"
forvalues n = 16/97 {
    label define V8963L `n' "Actual age"  , modify
}
label define V8963L       98 "Ninety-eight years of age or older"  , modify
label define V8963L       99 "NA"  , modify
label define V8963L        0 `"Inap.: no Wife/"Wife" in FU:  Head is female (V8962=2) or single male"'  , modify

label define V8964L  ///
       0 "None"  ///
       1 "One person"  ///
       2 "Two people"  ///
       3 "Three people"  ///
       4 "Four people"  ///
       5 "Five people"  ///
       6 "Six people"  ///
       7 "Seven people"  ///
       8 "Eight people"

label define V8974L  ///
       1 "Owns or is buying home, either fully or jointly; mobile home owners who rent lots are included here"  ///
       5 "Pays rent"  ///
       8 "Neither owns nor rents"

label define V8999L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V909L  ///
       0 "Not a splitoff"  ///
       1 "Splitoff"

label define V9290L  ///
       1 "Yes, including housework"  ///
       5 "No"  ///
       9 "NA; DK"
forvalues n = 1/51 {
    label define V93L `n' "Actual state (PSID state code)"  , modify
}
label define V93L       99 "DK; NA"  , modify
label define V93L        0 "Inap.:  U.S. territory or foreign country"  , modify

label define V9309L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 `"Inap.: no Wife/"Wife" in FU (V8963=00); finished more than twelve years of school (V9308=13-17 or 99)"'
label define V9316L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V9316L `n' "Actual number of years"  , modify
}
label define V9316L       98 "Ninety-eight years or more"  , modify
label define V9316L       99 "NA; DK"  , modify
label define V9316L        0 `"Inap.: never worked full time; no Wife/"Wife" in FU (V8963=00); never worked (V9315=00)"'  , modify
label define V9346L        1 "One year or less"  , modify
forvalues n = 2/97 {
    label define V9346L `n' "Actual number of years"  , modify
}
label define V9346L       98 "Ninety-eight years or more"  , modify
label define V9346L       99 "NA; DK"  , modify
label define V9346L        0 "Inap.: never worked full time; never worked (V9345=00)"  , modify

label define V9350L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: finished more than six years of school (V9349=07-17,99)"

label define V9385L  ///
       1 "Same state at both times: V9335 = V8803"  ///
       2 "Same region but different state: V9335 does not equal V8803 but V9381 = V9382"  ///
       3 "Different regions: V9381 does not equal V9382"  ///
       9 "NA: V8803 or V9335 = 99"

label define V9395L  ///
       0 "Cannot read or write, or has trouble reading or writing: V9352 equals 1"  ///
       1 "0-5 grades: V9349 equals 00-05 but V9352 does not equal 1"  ///
       2 `"6-8 grades; "grade school": V9349 equals 06-08"'  ///
       3 "9-11 grades: V9349 equals 09-11"  ///
       4 `"12 grades and no further training; "high school": V9349 equals 12 but V9353 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V9349 equals 12 and V9353 equals 1"  ///
       6 "College but no degree: V9349 equals 13-15 or V9349 equals 16-17 but V9355 does not equal 1"  ///
       7 "College BA but no advanced degree: V9349 equals 16-17 and V9355 equals 1 but V9356 does not equal 1"  ///
       8 "College and advanced or professional degree: V9349 equals 16-17 and V9356 equals 1"  ///
       9 "NA; DK: V9349 equals 99"

label define V9396L  ///
       1 "0-5 grades: V9308 equals 00-05"  ///
       2 `"6-8 grades; "grade school": V9308 equals 06-08"'  ///
       3 "9-11 grades: V9308 equals 09-11"  ///
       4 `"12 grades; "high school": V9308 equals 12 but V9309 does not equal 1"'  ///
       5 "12 grades plus nonacademic training: V9308 equals 12 and V9309 equals 1"  ///
       6 "College but no degree: V9308 equals 13-15 or V9308 equals 16-17 but V9311 does not equal 1"  ///
       7 "College BA but no advanced degree: V9308 equals 16-17 and V9311 equals 1 but V9312 does not equal 1"  ///
       8 "College and advanced or professional degree: V9308 equals 16-17 and V9312 equals 1"  ///
       9 "NA; DK: V9308 equals 99"  ///
       0 `"Inap.: no Wife/"Wife" in FU; V8963=00"'

label define V9399L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V94L  ///
       0 "Data suppressed"

label define V9400L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9401L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9402L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9403L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9404L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9405L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9406L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9407L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine or more"

label define V9408L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"

label define V9419L  ///
       1 `"Married or permanently cohabiting; Wife, "Wife," or Husband is present in the FU"'  ///
       2 `"Single, never legally married and no Wife, "Wife," or Husband is present in the FU"'  ///
       3 `"Widowed and no Wife, "Wife," or Husband is present in the FU"'  ///
       4 `"Divorced and no Wife, "Wife," or Husband is present in the FU"'  ///
       5 `"Separated; legally married but no Wife, "Wife," or Husband is present in the FU (the spouse may be in an institution)"'  ///
       9 "NA; DK"
label define V9433L        0 "No weight"  , modify
forvalues n = 1/94 {
    label define V9433L `n' "Actual family weight"  , modify
}

label values ER2001     ER2001L
label values ER2005F    ER2005FL
label values ER2007     ER2007L
label values ER2008     ER2008L
label values ER2009     ER2009L
label values ER2010     ER2010L
label values ER2032     ER2032L
label values ER2062     ER2062L
label values ER30000    ER30000L
label values ER30003    ER30003L
label values ER30005    ER30005L
label values ER30021    ER30021L
label values ER30022    ER30022L
label values ER30024    ER30024L
label values ER30029    ER30029L
label values ER30030    ER30030L
label values ER30044    ER30044L
label values ER30045    ER30045L
label values ER30047    ER30047L
label values ER30053    ER30053L
label values ER30054    ER30054L
label values ER30068    ER30068L
label values ER30069    ER30069L
label values ER30071    ER30071L
label values ER30077    ER30077L
label values ER30078    ER30078L
label values ER30092    ER30092L
label values ER30093    ER30093L
label values ER30095    ER30095L
label values ER30102    ER30102L
label values ER30103    ER30103L
label values ER30118    ER30118L
label values ER30119    ER30119L
label values ER30121    ER30121L
label values ER30127    ER30127L
label values ER30139    ER30139L
label values ER30140    ER30140L
label values ER30142    ER30142L
label values ER30148    ER30148L
label values ER30161    ER30161L
label values ER30162    ER30162L
label values ER30164    ER30164L
label values ER30189    ER30189L
label values ER30190    ER30190L
label values ER30192    ER30192L
label values ER30198    ER30198L
label values ER30199    ER30199L
label values ER30218    ER30218L
label values ER30219    ER30219L
label values ER30221    ER30221L
label values ER30227    ER30227L
label values ER30228    ER30228L
label values ER30247    ER30247L
label values ER30248    ER30248L
label values ER30250    ER30250L
label values ER30256    ER30256L
label values ER30259    ER30259L
label values ER30284    ER30284L
label values ER30285    ER30285L
label values ER30287    ER30287L
label values ER30291    ER30291L
label values ER30314    ER30314L
label values ER30315    ER30315L
label values ER30317    ER30317L
label values ER30321    ER30321L
label values ER30344    ER30344L
label values ER30345    ER30345L
label values ER30347    ER30347L
label values ER30351    ER30351L
label values ER30374    ER30374L
label values ER30375    ER30375L
label values ER30377    ER30377L
label values ER30400    ER30400L
label values ER30401    ER30401L
label values ER30405    ER30405L
label values ER30409    ER30409L
label values ER30430    ER30430L
label values ER30431    ER30431L
label values ER30435    ER30435L
label values ER30439    ER30439L
label values ER30464    ER30464L
label values ER30465    ER30465L
label values ER30469    ER30469L
label values ER30473    ER30473L
label values ER30499    ER30499L
label values ER30500    ER30500L
label values ER30504    ER30504L
label values ER30508    ER30508L
label values ER30536    ER30536L
label values ER30537    ER30537L
label values ER30541    ER30541L
label values ER30571    ER30571L
label values ER30572    ER30572L
label values ER30576    ER30576L
label values ER30607    ER30607L
label values ER30608    ER30608L
label values ER30612    ER30612L
label values ER30643    ER30643L
label values ER30644    ER30644L
label values ER30648    ER30648L
label values ER30690    ER30690L
label values ER30691    ER30691L
label values ER30695    ER30695L
label values ER30734    ER30734L
label values ER30735    ER30735L
label values ER30739    ER30739L
label values ER30807    ER30807L
label values ER30808    ER30808L
label values ER30812    ER30812L
label values ER33102    ER33102L
label values ER33103    ER33103L
label values ER33107    ER33107L
label values ER33202    ER33202L
label values ER33203    ER33203L
label values ER33207    ER33207L
label values ER3854     ER3854L
label values ER3900     ER3900L
label values ER3916     ER3916L
label values ER3944     ER3944L
label values ER3967     ER3967L
label values ER3986     ER3986L
label values ER4156     ER4156L
label values ER4157D    ER4157DL
label values ER4159A    ER4159AL
label values ER5001     ER5001L
label values ER5005F    ER5005FL
label values ER5006     ER5006L
label values ER5007     ER5007L
label values ER5008     ER5008L
label values ER5009     ER5009L
label values ER5031     ER5031L
label values ER5061     ER5061L
label values ER6724     ER6724L
label values ER6770     ER6770L
label values ER6786     ER6786L
label values ER6814     ER6814L
label values ER6837     ER6837L
label values ER6856     ER6856L
label values ER6996     ER6996L
label values ER6997D    ER6997DL
label values ER6999A    ER6999AL
label values V1         V1L
label values V10001     V10001L
label values V10003     V10003L
label values V10004     V10004L
label values V10007     V10007L
label values V10019     V10019L
label values V1008      V1008L
label values V1010      V1010L
label values V1011      V1011L
label values V1014      V1014L
label values V103       V103L
label values V10419     V10419L
label values V10420     V10420L
label values V10421     V10421L
label values V10422     V10422L
label values V10437     V10437L
label values V10447     V10447L
label values V10879     V10879L
label values V10956     V10956L
label values V10963     V10963L
label values V10993     V10993L
label values V10997     V10997L
label values V1101      V1101L
label values V1103      V1103L
label values V11032     V11032L
label values V1104      V1104L
label values V11042     V11042L
label values V11043     V11043L
label values V11046     V11046L
label values V11047     V11047L
label values V11048     V11048L
label values V11049     V11049L
label values V11050     V11050L
label values V11051     V11051L
label values V11052     V11052L
label values V11053     V11053L
label values V11054     V11054L
label values V11055     V11055L
label values V1106      V1106L
label values V11065     V11065L
label values V11079     V11079L
label values V11101     V11101L
label values V11103     V11103L
label values V11104     V11104L
label values V11107     V11107L
label values V11126     V11126L
label values V1123      V1123L
label values V11606     V11606L
label values V11607     V11607L
label values V11608     V11608L
label values V11609     V11609L
label values V11618     V11618L
label values V11628     V11628L
label values V117       V117L
label values V11740     V11740L
label values V118       V118L
label values V119       V119L
label values V11938     V11938L
label values V11964     V11964L
label values V11993     V11993L
label values V12103     V12103L
label values V12319     V12319L
label values V12386     V12386L
label values V1239      V1239L
label values V1240      V1240L
label values V12400     V12400L
label values V12401     V12401L
label values V12404     V12404L
label values V12405     V12405L
label values V12406     V12406L
label values V12407     V12407L
label values V12408     V12408L
label values V12409     V12409L
label values V1241      V1241L
label values V12410     V12410L
label values V12411     V12411L
label values V12412     V12412L
label values V1242      V1242L
label values V12426     V12426L
label values V12446     V12446L
label values V12501     V12501L
label values V12503     V12503L
label values V12504     V12504L
label values V12507     V12507L
label values V12525     V12525L
label values V1264      V1264L
label values V1274      V1274L
label values V13011     V13011L
label values V13012     V13012L
label values V13013     V13013L
label values V13014     V13014L
label values V13023     V13023L
label values V13037     V13037L
label values V13427     V13427L
label values V13516     V13516L
label values V13532     V13532L
label values V13565     V13565L
label values V13587     V13587L
label values V13606     V13606L
label values V13636     V13636L
label values V13640     V13640L
label values V13641     V13641L
label values V13644     V13644L
label values V13645     V13645L
label values V13646     V13646L
label values V13647     V13647L
label values V13648     V13648L
label values V13649     V13649L
label values V1365      V1365L
label values V13650     V13650L
label values V13651     V13651L
label values V13652     V13652L
label values V13665     V13665L
label values V13701     V13701L
label values V13703     V13703L
label values V13704     V13704L
label values V13707     V13707L
label values V13725     V13725L
label values V1411      V1411L
label values V14114     V14114L
label values V14115     V14115L
label values V14116     V14116L
label values V14117     V14117L
label values V14126     V14126L
label values V14140     V14140L
label values V14515     V14515L
label values V14563     V14563L
label values V14579     V14579L
label values V14612     V14612L
label values V14634     V14634L
label values V14653     V14653L
label values V14683     V14683L
label values V14687     V14687L
label values V14688     V14688L
label values V14691     V14691L
label values V14692     V14692L
label values V14693     V14693L
label values V14694     V14694L
label values V14695     V14695L
label values V14696     V14696L
label values V14697     V14697L
label values V14698     V14698L
label values V14699     V14699L
label values V14712     V14712L
label values V14737     V14737L
label values V14801     V14801L
label values V14803     V14803L
label values V14804     V14804L
label values V14807     V14807L
label values V14825     V14825L
label values V1485      V1485L
label values V1486      V1486L
label values V1490      V1490L
label values V15130     V15130L
label values V15131     V15131L
label values V15132     V15132L
label values V15133     V15133L
label values V15140     V15140L
label values V15148     V15148L
label values V1525      V1525L
label values V1576      V1576L
label values V15994     V15994L
label values V16037     V16037L
label values V16053     V16053L
label values V16086     V16086L
label values V1609      V1609L
label values V16108     V16108L
label values V16127     V16127L
label values V16157     V16157L
label values V16161     V16161L
label values V16162     V16162L
label values V16165     V16165L
label values V16166     V16166L
label values V16167     V16167L
label values V16168     V16168L
label values V16169     V16169L
label values V16170     V16170L
label values V16171     V16171L
label values V16172     V16172L
label values V16173     V16173L
label values V16187     V16187L
label values V16208     V16208L
label values V16301     V16301L
label values V16303     V16303L
label values V16304     V16304L
label values V16307     V16307L
label values V16325     V16325L
label values V16631     V16631L
label values V16632     V16632L
label values V16633     V16633L
label values V16634     V16634L
label values V16641     V16641L
label values V16649     V16649L
label values V17391     V17391L
label values V17434     V17434L
label values V17450     V17450L
label values V17483     V17483L
label values V17505     V17505L
label values V17524     V17524L
label values V17543     V17543L
label values V17545     V17545L
label values V17546     V17546L
label values V17547     V17547L
label values V17548     V17548L
label values V17549     V17549L
label values V17550     V17550L
label values V17551     V17551L
label values V17552     V17552L
label values V17553     V17553L
label values V17554     V17554L
label values V17555     V17555L
label values V17565     V17565L
label values V17701     V17701L
label values V17703     V17703L
label values V17704     V17704L
label values V17707     V17707L
label values V17725     V17725L
label values V1801      V1801L
label values V1803      V1803L
label values V1804      V1804L
label values V18049     V18049L
label values V18050     V18050L
label values V18051     V18051L
label values V18052     V18052L
label values V1806      V1806L
label values V18072     V18072L
label values V18087     V18087L
label values V181       V181L
label values V1824      V1824L
label values V18722     V18722L
label values V18765     V18765L
label values V18781     V18781L
label values V18814     V18814L
label values V18836     V18836L
label values V18855     V18855L
label values V18894     V18894L
label values V18898     V18898L
label values V18899     V18899L
label values V18901     V18901L
label values V18902     V18902L
label values V18903     V18903L
label values V18904     V18904L
label values V18905     V18905L
label values V18906     V18906L
label values V18907     V18907L
label values V18908     V18908L
label values V18909     V18909L
label values V18916     V18916L
label values V19001     V19001L
label values V19003     V19003L
label values V19004     V19004L
label values V19007     V19007L
label values V19025     V19025L
label values V19349     V19349L
label values V19350     V19350L
label values V19351     V19351L
label values V19352     V19352L
label values V19372     V19372L
label values V19387     V19387L
label values V1942      V1942L
label values V1943      V1943L
label values V1944      V1944L
label values V1945      V1945L
label values V1967      V1967L
label values V1979      V1979L
label values V20022     V20022L
label values V20065     V20065L
label values V20081     V20081L
label values V20114     V20114L
label values V20136     V20136L
label values V20155     V20155L
label values V20194     V20194L
label values V20201     V20201L
label values V20202     V20202L
label values V20203     V20203L
label values V20204     V20204L
label values V20205     V20205L
label values V20206     V20206L
label values V20207     V20207L
label values V20208     V20208L
label values V20209     V20209L
label values V20216     V20216L
label values V20301     V20301L
label values V20303     V20303L
label values V20304     V20304L
label values V20307     V20307L
label values V20325     V20325L
label values V20651     V20651L
label values V20652     V20652L
label values V20653     V20653L
label values V20654     V20654L
label values V20672     V20672L
label values V20687     V20687L
label values V2072      V2072L
label values V2123      V2123L
label values V21322     V21322L
label values V21371     V21371L
label values V21387     V21387L
label values V21420     V21420L
label values V21442     V21442L
label values V21461     V21461L
label values V215       V215L
label values V21500     V21500L
label values V21507     V21507L
label values V21508     V21508L
label values V21509     V21509L
label values V21510     V21510L
label values V21511     V21511L
label values V21512     V21512L
label values V21513     V21513L
label values V21514     V21514L
label values V21515     V21515L
label values V21522     V21522L
label values V21601     V21601L
label values V21603     V21603L
label values V21606     V21606L
label values V21611     V21611L
label values V2197      V2197L
label values V2198      V2198L
label values V2202      V2202L
label values V2237      V2237L
label values V22406     V22406L
label values V22407     V22407L
label values V22408     V22408L
label values V22409     V22409L
label values V22427     V22427L
label values V22441     V22441L
label values V2288      V2288L
label values V23181     V23181L
label values V2321      V2321L
label values V23228     V23228L
label values V23244     V23244L
label values V23276     V23276L
label values V23298     V23298L
label values V23317     V23317L
label values V23332     V23332L
label values V23336     V23336L
label values V239       V239L
label values V2401      V2401L
label values V2403      V2403L
label values V2404      V2404L
label values V2407      V2407L
label values V2424      V2424L
label values V246       V246L
label values V2542      V2542L
label values V2543      V2543L
label values V2544      V2544L
label values V2545      V2545L
label values V2566      V2566L
label values V2577      V2577L
label values V261       V261L
label values V2670      V2670L
label values V2687      V2687L
label values V2718      V2718L
label values V2823      V2823L
label values V2824      V2824L
label values V2828      V2828L
label values V2863      V2863L
label values V2915      V2915L
label values V2968      V2968L
label values V3001      V3001L
label values V3003      V3003L
label values V3004      V3004L
label values V3007      V3007L
label values V3022      V3022L
label values V3095      V3095L
label values V3096      V3096L
label values V3097      V3097L
label values V3098      V3098L
label values V3108      V3108L
label values V3110      V3110L
label values V313       V313L
label values V314       V314L
label values V3181      V3181L
label values V3216      V3216L
label values V3241      V3241L
label values V3242      V3242L
label values V3244      V3244L
label values V3267      V3267L
label values V3283      V3283L
label values V3300      V3300L
label values V3301      V3301L
label values V3401      V3401L
label values V3403      V3403L
label values V3404      V3404L
label values V3407      V3407L
label values V3418      V3418L
label values V3508      V3508L
label values V3509      V3509L
label values V3510      V3510L
label values V3511      V3511L
label values V3522      V3522L
label values V3524      V3524L
label values V3598      V3598L
label values V3611      V3611L
label values V3621      V3621L
label values V363       V363L
label values V3638      V3638L
label values V3663      V3663L
label values V3664      V3664L
label values V3666      V3666L
label values V3687      V3687L
label values V3703      V3703L
label values V3720      V3720L
label values V3721      V3721L
label values V3801      V3801L
label values V3803      V3803L
label values V3804      V3804L
label values V3807      V3807L
label values V3818      V3818L
label values V3921      V3921L
label values V3922      V3922L
label values V3923      V3923L
label values V3924      V3924L
label values V3939      V3939L
label values V3941      V3941L
label values V398       V398L
label values V4053      V4053L
label values V4094      V4094L
label values V4103      V4103L
label values V4111      V4111L
label values V4142      V4142L
label values V4145      V4145L
label values V4165      V4165L
label values V4182      V4182L
label values V4198      V4198L
label values V4199      V4199L
label values V4204      V4204L
label values V4207      V4207L
label values V4208      V4208L
label values V4209      V4209L
label values V4210      V4210L
label values V4211      V4211L
label values V4212      V4212L
label values V4213      V4213L
label values V4214      V4214L
label values V4215      V4215L
label values V4224      V4224L
label values V4301      V4301L
label values V4303      V4303L
label values V4304      V4304L
label values V4307      V4307L
label values V4319      V4319L
label values V439       V439L
label values V441       V441L
label values V4436      V4436L
label values V4437      V4437L
label values V4438      V4438L
label values V4439      V4439L
label values V4450      V4450L
label values V4452      V4452L
label values V450       V450L
label values V4603      V4603L
label values V4625      V4625L
label values V4631      V4631L
label values V4685      V4685L
label values V4696      V4696L
label values V4990      V4990L
label values V5041      V5041L
label values V5058      V5058L
label values V5074      V5074L
label values V5075      V5075L
label values V5079      V5079L
label values V5080      V5080L
label values V5081      V5081L
label values V5082      V5082L
label values V5083      V5083L
label values V5084      V5084L
label values V5085      V5085L
label values V5086      V5086L
label values V5087      V5087L
label values V5096      V5096L
label values V5099      V5099L
label values V5201      V5201L
label values V5203      V5203L
label values V5204      V5204L
label values V5207      V5207L
label values V5218      V5218L
label values V5350      V5350L
label values V5351      V5351L
label values V5352      V5352L
label values V5353      V5353L
label values V5364      V5364L
label values V5366      V5366L
label values V537       V537L
label values V550       V550L
label values V5560      V5560L
label values V5568      V5568L
label values V5575      V5575L
label values V5605      V5605L
label values V5609      V5609L
label values V5637      V5637L
label values V5647      V5647L
label values V5648      V5648L
label values V5650      V5650L
label values V5653      V5653L
label values V5654      V5654L
label values V5655      V5655L
label values V5656      V5656L
label values V5657      V5657L
label values V5658      V5658L
label values V5659      V5659L
label values V5660      V5660L
label values V5661      V5661L
label values V5662      V5662L
label values V5665      V5665L
label values V5701      V5701L
label values V5703      V5703L
label values V5704      V5704L
label values V5707      V5707L
label values V5718      V5718L
label values V5850      V5850L
label values V5851      V5851L
label values V5852      V5852L
label values V5853      V5853L
label values V5864      V5864L
label values V5866      V5866L
label values V593       V593L
label values V603       V603L
label values V607       V607L
label values V6102      V6102L
label values V6117      V6117L
label values V6124      V6124L
label values V6154      V6154L
label values V6158      V6158L
label values V6184      V6184L
label values V6194      V6194L
label values V6195      V6195L
label values V6197      V6197L
label values V6200      V6200L
label values V6201      V6201L
label values V6202      V6202L
label values V6203      V6203L
label values V6204      V6204L
label values V6205      V6205L
label values V6206      V6206L
label values V6207      V6207L
label values V6208      V6208L
label values V6209      V6209L
label values V6212      V6212L
label values V6301      V6301L
label values V6303      V6303L
label values V6304      V6304L
label values V6307      V6307L
label values V6320      V6320L
label values V6462      V6462L
label values V6463      V6463L
label values V6464      V6464L
label values V6465      V6465L
label values V6479      V6479L
label values V6484      V6484L
label values V6710      V6710L
label values V6714      V6714L
label values V6721      V6721L
label values V6751      V6751L
label values V6755      V6755L
label values V6777      V6777L
label values V6787      V6787L
label values V6788      V6788L
label values V6790      V6790L
label values V6793      V6793L
label values V6794      V6794L
label values V6795      V6795L
label values V6796      V6796L
label values V6797      V6797L
label values V6798      V6798L
label values V6799      V6799L
label values V6800      V6800L
label values V6801      V6801L
label values V6802      V6802L
label values V6805      V6805L
label values V6901      V6901L
label values V6903      V6903L
label values V6904      V6904L
label values V6907      V6907L
label values V6918      V6918L
label values V7         V7L
label values V7067      V7067L
label values V7068      V7068L
label values V7069      V7069L
label values V7070      V7070L
label values V7084      V7084L
label values V7089      V7089L
label values V709       V709L
label values V7343      V7343L
label values V7347      V7347L
label values V7354      V7354L
label values V7384      V7384L
label values V7388      V7388L
label values V7423      V7423L
label values V7433      V7433L
label values V7434      V7434L
label values V7435      V7435L
label values V7438      V7438L
label values V7439      V7439L
label values V7440      V7440L
label values V7441      V7441L
label values V7442      V7442L
label values V7443      V7443L
label values V7444      V7444L
label values V7445      V7445L
label values V7446      V7446L
label values V7447      V7447L
label values V745       V745L
label values V7451      V7451L
label values V7501      V7501L
label values V7503      V7503L
label values V7504      V7504L
label values V7507      V7507L
label values V7518      V7518L
label values V7658      V7658L
label values V7659      V7659L
label values V7660      V7660L
label values V7661      V7661L
label values V7675      V7675L
label values V7700      V7700L
label values V794       V794L
label values V795       V795L
label values V7974      V7974L
label values V7999      V7999L
label values V8006      V8006L
label values V801       V801L
label values V8036      V8036L
label values V8040      V8040L
label values V8075      V8075L
label values V8085      V8085L
label values V8086      V8086L
label values V8087      V8087L
label values V8090      V8090L
label values V8091      V8091L
label values V8092      V8092L
label values V8093      V8093L
label values V8094      V8094L
label values V8095      V8095L
label values V8096      V8096L
label values V8097      V8097L
label values V8098      V8098L
label values V8099      V8099L
label values V8103      V8103L
label values V8201      V8201L
label values V8203      V8203L
label values V8204      V8204L
label values V8207      V8207L
label values V8218      V8218L
label values V8352      V8352L
label values V8353      V8353L
label values V8354      V8354L
label values V8355      V8355L
label values V8364      V8364L
label values V8369      V8369L
label values V8616      V8616L
label values V8623      V8623L
label values V8630      V8630L
label values V8660      V8660L
label values V8664      V8664L
label values V8699      V8699L
label values V8709      V8709L
label values V8710      V8710L
label values V8711      V8711L
label values V8714      V8714L
label values V8715      V8715L
label values V8716      V8716L
label values V8717      V8717L
label values V8718      V8718L
label values V8719      V8719L
label values V8720      V8720L
label values V8721      V8721L
label values V8722      V8722L
label values V8723      V8723L
label values V8727      V8727L
label values V878       V878L
label values V8801      V8801L
label values V8803      V8803L
label values V8804      V8804L
label values V8807      V8807L
label values V8818      V8818L
label values V8961      V8961L
label values V8962      V8962L
label values V8963      V8963L
label values V8964      V8964L
label values V8974      V8974L
label values V8999      V8999L
label values V909       V909L
label values V9290      V9290L
label values V93        V93L
label values V9309      V9309L
label values V9316      V9316L
label values V9346      V9346L
label values V9350      V9350L
label values V9385      V9385L
label values V9395      V9395L
label values V9396      V9396L
label values V9399      V9399L
label values V94        V94L
label values V9400      V9400L
label values V9401      V9401L
label values V9402      V9402L
label values V9403      V9403L
label values V9404      V9404L
label values V9405      V9405L
label values V9406      V9406L
label values V9407      V9407L
label values V9408      V9408L
label values V9419      V9419L
label values V9433      V9433L
