# Select Observation for Thefts as described in Section 2.1
thefts_allYears <- caseNumbers_allYears[ caseNumbers_allYears$Crimetype %like% "Diebstahl insgesamt und zwar:" | caseNumbers_allYears$CrimeKey %like% "\\*\\*\\*\\*00" ,]

### Drop Column CrimeKey, Crimetype and all Observation for the whole BRD --> Select only FederalState, Year and Casenumbers
thefts_allYears_tidy <- thefts_allYears[!(thefts_allYears$FederalState %like% "Bund"),3:5]
thefts_allYears_tidy$FederalState <- droplevels(thefts_allYears_tidy$FederalState)

### Rename Casenumbers to TheftAmount
colnames(thefts_allYears_tidy)=c(names(thefts_allYears_tidy[,1:2]), "TheftAmount")

## Rename Baden-Württemberg and Thüringen
thefts_allYears_tidy <- thefts_allYears_tidy %>% mutate(FederalState = str_replace(FederalState, "Baden-Württemberg", "Baden-Wuerttemberg"))
thefts_allYears_tidy <- thefts_allYears_tidy %>% mutate(FederalState = str_replace(FederalState, "Thüringen", "Thueringen"))
thefts_allYears_tidy$FederalState <- as.factor(thefts_allYears_tidy$FederalState)


## Create new Column Areasize
thefts_allYears_tidy <- add_column(thefts_allYears_tidy, Areasize = "")

## Grouping of Federal States
bigArea = c("Bayern", "Baden-Wuerttemberg", "Nordrhein-Westfalen", "Niedersachsen")
mediumArea = c("Brandenburg", "Hessen", "Sachsen-Anhalt", "Mecklenburg-Vorpommern")
smallArea = c("Sachsen", "Rheinland-Pfalz", "Thueringen", "Schleswig-Holstein")
verySmallArea = c("Saarland", "Bremen", "Hamburg", "Berlin")


### Group the observation by the areasize of each federal state based on Wikipedia https://de.wikipedia.org/wiki/Liste_der_Deutschen_Bundesl%C3%A4nder_nach_Fl%C3%A4che

thefts_allYears_tidy$Areasize[thefts_allYears_tidy$FederalState %in% bigArea] <- "big"
thefts_allYears_tidy$Areasize[thefts_allYears_tidy$FederalState %in% mediumArea] <- "medium"
thefts_allYears_tidy$Areasize[thefts_allYears_tidy$FederalState %in% smallArea] <- "small"
thefts_allYears_tidy$Areasize[thefts_allYears_tidy$FederalState %in% verySmallArea] <- "very small"
thefts_allYears_tidy$Areasize <- as.factor(thefts_allYears_tidy$Areasize)

# Creates a special variable for a better summary 
thefts_allYears_transformed4Summary <- thefts_allYears_tidy %>% transform(Year = as.factor(Year))
