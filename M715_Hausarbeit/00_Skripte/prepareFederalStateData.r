# pivot long population_per_FederalState_headerAdjusted => Year-Header to Yearly Observations and number of inhabitants
tidyTable_of_population<- population_per_FederalState_headerAdjusted %>% pivot_longer(c(as.character(2014:2020)), names_to = "Year", values_to="Population")

## Change Names of Federal States with vowel ü and change the Datatype of each variable
tidyTable_of_population <- tidyTable_of_population %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
tidyTable_of_population <- tidyTable_of_population %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
tidyTable_of_population$Population <- as.numeric(tidyTable_of_population$Population)
tidyTable_of_population$Year <- as.numeric(tidyTable_of_population$Year)
tidyTable_of_population$FederalState <- as.factor(tidyTable_of_population$FederalState)

### Join Dataset the thefts x and the population y by Federal State and Year
joined_Thefts_Population<- inner_join(x=thefts_allYears_tidy, y=tidyTable_of_population, by=c("FederalState", "Year"), keep=FALSE)

######################################################################################################################
# pivot long gdp_atMarketPrice => Year-Header to Yearly Observations and  GDP
tidyTable_of_gdp<- gdp_atMarketPrice %>% pivot_longer(c(as.character(2014:2020)), names_to = "Year", values_to="GDP")

## Change Names of Federal States with vowel ü,  change the Datatype of each variable, remove the observation for germany in total
tidyTable_of_gdp <- tidyTable_of_gdp %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
tidyTable_of_gdp <- tidyTable_of_gdp %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
tidyTable_of_gdp <- tidyTable_of_gdp[!(tidyTable_of_gdp$FederalState == "Deutschland"),]
tidyTable_of_gdp$GDP <- as.numeric(tidyTable_of_gdp$GDP)
tidyTable_of_gdp$Year <- as.numeric(tidyTable_of_gdp$Year)
tidyTable_of_gdp$FederalState <- as.factor(tidyTable_of_gdp$FederalState)

### Join Dataset the joined_Thefts_Population and gdp y by Federal State and Year
joined_Thefts_Population_GDP<- inner_join(x=joined_Thefts_Population, y=tidyTable_of_gdp, by=c("FederalState", "Year"), keep=FALSE)
summary(joined_Thefts_Population_GDP, maxsum = 20)

######################################################################################################################
# pivot long gdp_atMarketPrice => Year-Header to Yearly Observations and  GDP
tidyTable_of_unemployed<- jobless_people[,1:17] %>% pivot_longer(names(jobless_people[,2:17]), names_to = "FederalState", values_to="AmountOfUnemployedPeople")

## Change Names of Federal States with vowel ü,  change the Datatype of each variable, reduce to 2014 - 2020
tidyTable_of_unemployed$AmountOfUnemployedPeople <- as.numeric(tidyTable_of_unemployed$AmountOfUnemployedPeople)
tidyTable_of_unemployed$Year <- droplevels(tidyTable_of_unemployed$Year)
tidyTable_of_unemployed$Year <- as.numeric(as.character(tidyTable_of_unemployed$Year))
tidyTable_of_unemployed <- tidyTable_of_unemployed %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
tidyTable_of_unemployed <- tidyTable_of_unemployed %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
tidyTable_of_unemployed$FederalState <- as.factor(tidyTable_of_unemployed$FederalState)
tidyTable_of_unemployed <- tidyTable_of_unemployed[tidyTable_of_unemployed$Year %in% c(2014:2020),]


### Join Dataset the joined_Thefts_Population_GDP and Amount Of Unemployees y by Federal State and Year
joined_Thefts_Population_GDP_Unemployed<- inner_join(x=joined_Thefts_Population_GDP, y=tidyTable_of_unemployed, by=c("FederalState", "Year"), keep=FALSE)

# Extract 2014-2020 and only the whole expenditure for education for each federal state
tidyTable_of_expendEdu <- expenditure4Education[expenditure4Education$LevelOfSeparation == "Insgesamt" & expenditure4Education$Year %in% c(2014:2020) ,c(1,3:4)]

##Change Names of Federal States with vowel ü,  change the Datatype of each variable, reduce to 2014 - 2020
tidyTable_of_expendEdu <- tidyTable_of_expendEdu %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
tidyTable_of_expendEdu <- tidyTable_of_expendEdu %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
tidyTable_of_expendEdu$FederalState <- as.factor(tidyTable_of_expendEdu$FederalState)
tidyTable_of_expendEdu$Year <- droplevels(tidyTable_of_expendEdu$Year)
tidyTable_of_expendEdu$Year <- as.numeric(as.character(tidyTable_of_expendEdu$Year))

###Join Dataset the joined_Thefts_Population_GDP and Expenditure for Education y by Federal State and Year
joined_Thefts_Population_GDP_Unemployed_expendEdu<- inner_join(x=joined_Thefts_Population_GDP_Unemployed, y=tidyTable_of_expendEdu, by=c("FederalState", "Year"), keep=FALSE)


# Extract 2014-2020 and only the whole expenditure for culture for each federal state
tidyTable_of_expendCult <- expenditure4Culture[expenditure4Culture$Year %in% c(2014:2020), c("Year", "FederalState", "CulturalTotalExpenditure")]

##Change Names of Federal States with vowel ü,  change the Datatype of each variable, reduce to 2014 - 2020
tidyTable_of_expendCult  <- tidyTable_of_expendCult  %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
tidyTable_of_expendCult  <- tidyTable_of_expendCult  %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
tidyTable_of_expendCult $FederalState <- as.factor(tidyTable_of_expendCult$FederalState)
tidyTable_of_expendCult $Year <- droplevels(tidyTable_of_expendCult$Year)
tidyTable_of_expendCult $Year <- as.numeric(as.character(tidyTable_of_expendCult$Year))

###Join Dataset the joined_Thefts_Population_GDP_Unemployed_expendEdu and Expenditure for Culture y by Federal State and Year
joined_Thefts_Population_GDP_Unemployed_expendEdu_expendCult<- inner_join(x=joined_Thefts_Population_GDP_Unemployed_expendEdu, y=tidyTable_of_expendCult , by=c("FederalState", "Year"), keep=FALSE)
mergedData4regression <- joined_Thefts_Population_GDP_Unemployed_expendEdu_expendCult
