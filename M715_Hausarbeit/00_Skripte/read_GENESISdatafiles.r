#workingDir="./M715_Hausarbeit/01_Datenquellen/" # Tests for script only run
workingDir="./01_Datenquellen/" # Line for run over rmarkdown

#Import Cultural Expenditure --> https://www-genesis.destatis.de/genesis//online?operation=table&code=21621-0003 in Mio. €
expenditure4Culture <- read_csv2(paste0(workingDir,"Cultural_Expenditure_per_state_2014_2020.csv") ,skip=6, na= c("-","NA",""),col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
names(expenditure4Culture) <- c("Year", "FederalState", "Theater_Musik", "Libraries", "Musseeum_Exhibitions", "Protection_CareOfMonuments", "CulturalAffairsAbroad", "PublicArtColleges", "OtherCulturalCare", "Administration4CulturalAffairs", "CulturalTotalExpenditure" )
expenditure4Culture[,3:11]<- expenditure4Culture[,3:11]*(10^6)
expenditure4Culture <- expenditure4Culture[!(is.na(expenditure4Culture$FederalState)),]
expenditure4Culture[,1:2] <- lapply(expenditure4Culture[,1:2], factor)


#GENESIS-Tabelle: 21711-0010
expenditure4Education <- read_csv2(paste0(workingDir,"Education_Expenditure_per_state.csv") ,skip=7, na= c("-","NA",""),col_select=c(1:3,28:29), col_types= "cccnn",col_names= TRUE, show_col_types = FALSE, locale = locale(encoding = 'latin1', decimal_mark=","))
names(expenditure4Education) <- c("Year", "LevelOfAggregation","FederalState", "CulturalTotalExpenditure", "CulturalExpenditurePerInhabitant")
expenditure4Education <- expenditure4Education[!(is.na(expenditure4Education$FederalState)),]

expenditure4Education$CulturalTotalExpenditure<- as.numeric(gsub(",",".",expenditure4Education$CulturalTotalExpenditure))*(10^3)
expenditure4Education[,1:3] <- lapply(expenditure4Education[,1:3], factor)

