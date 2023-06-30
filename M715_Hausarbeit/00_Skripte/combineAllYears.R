### Adds column year to the dataset
for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  assign(caseNumbers[x],add_column(var, Year=2013+x, .before="Casenumbers"))
}


### Combines all dataset to one
caseNumbers_allYears <- tibble()
assign(caseNumbers[x],add_column(var, Year=2013+x, .before="Casenumbers"))

caseNumbers_allYears <- tibble()
check_length = 0


for(x in seq_along(caseNumbers)){
  var=get(caseNumbers[x])
  check_length <- check_length + nrow(var)
  caseNumbers_allYears <- var %>% add_row(caseNumbers_allYears)
}
# Verfication if all DataSets has been combined
length_verification_caseNumbers_allYear <- check_length == nrow(caseNumbers_allYears)

# Creates a special variable for a better summary 
caseNumbers_allYears_transformed4Summary <- transform(caseNumbers_allYears, Year = as.factor(Year), Crimetype = as.factor(Crimetype), CrimeKey = as.factor(CrimeKey))
