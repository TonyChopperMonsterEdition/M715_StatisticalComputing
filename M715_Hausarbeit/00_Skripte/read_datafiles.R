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
  assign(caseNumbers[i], read_csv2(caseNumbers_FileLocation[i],skip=1, na= c("","NA"),col_names= TRUE, col_select=(2:5), show_col_types = FALSE, locale = locale(encoding = 'latin1')))
}

### Renames the necessary columns from german to english names
for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  colnames(var)[1:3]=c("Crimetype",  "FederalState", "Casenumbers")
  assign(caseNumbers[x],var)
  
  if (identical(var,caseNumbers_2016))
  {
    colnames(caseNumbers_2016)[3:4] <- colnames(caseNumbers_2016)[2:3]
    caseNumbers_2016 <- caseNumbers_2016[,-2]
  }
  else
  {
    var <- var[,-4]
    assign(caseNumbers[x],var)
  }
}

#var=get(caseNumbers[1])
#var <- var[,-4]
