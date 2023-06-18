caseNumbers <- c()
caseNumbers_FileLocation <- c()
#workingDir="./M715_Hausarbeit/01_Datenquellen/" # Tests for script only run
workingDir="./01_Datenquellen/" # Line for run over rmarkdown


for(i in 14:20) {
  ############################ozone####################################
  caseNumbers_FileLocation <- c(caseNumbers_FileLocation, paste0(workingDir,paste0(paste0("Casenumbers_States_20",i), ".csv")))
  caseNumbers <- c(caseNumbers, paste0("caseNumbers_20", i))
}

length(caseNumbers)
seq_along(caseNumbers)


###########################Extract#####################################

for(i in seq_along(caseNumbers)){
  # reads the tables and also the case numbers as character. Especially the Casenumbers has to be read as characters to prevent that r appends  zero at the end of some numbers
  # in a preversion of this script, importing the tables causes that at the end of numbers of 3 digit size additional zeros was added, while comma was interpreted as decimal instead of bigmark.
  assign(caseNumbers[i], read_csv2(caseNumbers_FileLocation[i],skip=1, col_types= "ccccc", na= c("","NA"),col_names= TRUE, col_select=(1:5), show_col_types = FALSE, trim_ws=TRUE, locale = locale(encoding = 'latin1', decimal_mark=",")))
  #assign(caseNumbers[i], read_delim(caseNumbers_FileLocation[i],skip=1, , delim= ";", na= c("","NA"),col_names= TRUE, col_select=(1:5), show_col_types = FALSE, trim_ws=TRUE, locale = locale(encoding = 'latin1', decimal_mark=",")))
  #assign(caseNumbers[i], as_tibble(read.csv2(caseNumbers_FileLocation[i],skip=1, sep =";", na.strings= c("","NA"),header= TRUE, encoding = 'latin1', dec="."))[1:5])
  }

### Renames the necessary columns from german to english names
for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  colnames(var)[1:4]=c("CrimeKey","Crimetype",  "FederalState", "Casenumbers")
  assign(caseNumbers[x],var)
  
  
  if (identical(var,caseNumbers_2016))
  {
    colnames(caseNumbers_2016)[4:5] <- colnames(caseNumbers_2016)[3:4]
    caseNumbers_2016 <- caseNumbers_2016[,-3]
  }
  else
  {
    var <- var[,-5]
    assign(caseNumbers[x],var)
  }
}
## needed to format the Casenumbers from string to numeric data type
for(x in seq_along(caseNumbers)){
 var=get(caseNumbers[x])
 var$Casenumbers = gsub(",","",var$Casenumbers)
 var$Casenumbers = as.numeric(var$Casenumbers)
 var$FederalState = as.factor(var$FederalState)
 assign(caseNumbers[x],var)
}
#var=get(caseNumbers[1])
#var <- var[,-4]

## Calculation of total amount of observations
totalAmount_CrimeCasesObservations=0

for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  totalAmount_CrimeCasesObservations= totalAmount_CrimeCasesObservations + nrow(var)
}
