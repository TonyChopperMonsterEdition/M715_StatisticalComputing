getwd()
dir = list.dirs(path = ".", full.names = TRUE)
files = list.files(path="./M715_Hausarbeit/01_Datenquellen", pattern = "*.csv") # Tests for script only run
# files = list.files(path="./01_Datenquellen", pattern = "*.csv") # Line for run over rmarkdown
files
dir
