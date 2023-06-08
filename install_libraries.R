
### Bitte lesen ###

# Sehr geehrte Teilnehmer,
# mit diesem Script installieren Sie alle R Pakete die wir im
# Data Science Kurs nutzen. Dazu tun Sie bitte folgendes:

# 1. Stellen Sie sicher dass sie R von http://cran.rstudio.com
# und RStudio von http://www.rstudio.com geladen und installiert haben

# 1. Markieren Sie bitte den gesamten Code in diesem Fenster.
# 2. Dann klicken Sie oben rechts auf "Run"
# oder Sie drücken alternativ auf STRG + ENTER
# Nun sollte der Code starten und die R Pakete installiert werden.


list_of_packages <- c(
    "tidyverse",
    #"forcats", # already included in tidyverse
    #"rvest", # already included in tidyverse
    #"readxl", # already included in tidyverse
    #"rstudioapi", # already included in tidyverse
    "nycflights13", 
    "gapminder", 
    "Lahman",
    "rmarkdown",
    "knitr",
    "class",
    "ElemStatLearn",
    "feather",
    "GGally",
    "knitr",
    "nnet",
    "rpart",
    "party",
    "partykit",
    "plotly",
    "rmarkdown",
    "scales",
    "facetscales",
    "hrbrthemes",
    "GGally",
    "plot3D",
    "readr",
    "magrittr"
)

new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages) > 0) install.packages(new_packages)
    
           
