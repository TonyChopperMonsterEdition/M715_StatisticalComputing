#workingDir="./M715_Hausarbeit/01_Datenquellen/" # Tests for script only run
workingDir="./01_Datenquellen/" # Line for run over rmarkdown

#Genesis-Tabelle: 21621-0003 import Cultural Expenditure --> https://www-genesis.destatis.de/genesis//online?operation=table&code=21621-0003 in Mio. €  
expenditure4Culture <- read_csv2(paste0(workingDir,"Cultural_Expenditure_per_state_2014_2020.csv") ,skip=6, na= c("-","NA",""),col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
names(expenditure4Culture) <- c("Year", "FederalState", "Theater_Music", "Libraries", "Musseum_Exhibitions", "Protection_CareOfMonuments", "CulturalAffairsAbroad", "PublicArtColleges", "OtherCulturalCare", "Administration4CulturalAffairs", "CulturalTotalExpenditure" )
expenditure4Culture[,3:11]<- expenditure4Culture[,3:11]*(10^6)
expenditure4Culture <- expenditure4Culture[!(is.na(expenditure4Culture$FederalState)),]
expenditure4Culture <- expenditure4Culture[!(expenditure4Culture$FederalState=="Insgesamt"),]
expenditure4Culture[,1:2] <- lapply(expenditure4Culture[,1:2], factor)

# GENESIS-Tabelle: 21711-0010 import of expenditure for education
expenditure4Education <- read_csv2(paste0(workingDir,"Education_Expenditure_per_state.csv") ,skip=7, na= c("-","NA",""),col_select=c(1:3,28:29), col_types= "cccnn",col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
names(expenditure4Education) <- c("Year", "LevelOfSeparation","FederalState", "TotalExpenditure4Education", "ExpenditurePerInhabitant4Education")
expenditure4Education <- expenditure4Education[!(is.na(expenditure4Education$FederalState)),]

expenditure4Education$TotalExpenditure4Education<- as.double(gsub(",",".",expenditure4Education$TotalExpenditure4Education))
expenditure4Education[,1:3] <- lapply(expenditure4Education[,1:3], factor)
expenditure4Education[,4] <- expenditure4Education[,4]*10^3

# GENESIS-Tabelle: 82111-0001 import of gross domestic product at Market Price --> Umgewandelt zu €
gdp_atMarketPrice <- read_csv2(paste0(workingDir,"GDP_at_market_prices_perState.csv") ,skip=6, na= c("-","NA",""),col_select=c(1:8), col_types= "fnnnnnnn",col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
names(gdp_atMarketPrice) <- c("FederalState", names(gdp_atMarketPrice)[2:8])
gdp_atMarketPrice <- gdp_atMarketPrice[!(is.na(gdp_atMarketPrice[,2])),]
gdp_atMarketPrice[,2:8] <- gdp_atMarketPrice[,2:8]*10^6

# GENESIS-Tabelle: 12411-0010 import of number of inhabitants /population
population_per_FederalState <- read_csv2(paste0(workingDir,"Population_of_states_2012_2021.csv") ,skip=5, na= c("-","NA",""),col_select=c(1:9, -2), col_types= "fnnnnnnnnn",col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
population_per_FederalState <- population_per_FederalState[!(is.na(population_per_FederalState[,2])),]
population_per_FederalState_headerAdjusted <- population_per_FederalState
names(population_per_FederalState_headerAdjusted) <- c("FederalState", 2014:2020)

# GENESIS-Tabelle: 13211-0009 - Arbeitslose https://www-genesis.destatis.de/genesis/online?operation=abruftabelleBearbeiten&levelindex=1&levelid=1687213229471&auswahloperation=abruftabelleAuspraegungAuswaehlen&auswahlverzeichnis=ordnungsstruktur&auswahlziel=werteabruf&code=13211-0009&auswahltext=&werteabruf=Werteabruf#abreadcrumb
jobless_people <- read_csv2(paste0(workingDir,"AmountOfJoblessPeople.csv"), skip=3, na= c("-","NA",""),col_select=c(1,3,5:20), col_types= "fffnnnnnnnnnnnnnnnn",col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
jobless_people <- jobless_people[!(is.na(jobless_people[,2])),]
names(jobless_people) <- c( "Year","Gender", names(jobless_people)[3:18])
jobless_people <- jobless_people[jobless_people$Gender %like% "Insgesamt", c(1,3:18)]