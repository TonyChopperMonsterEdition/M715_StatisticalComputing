library(tidyverse)
library(ggplot2)
library(readr)
library(purrr)

### hat nicht wegen der Zahl an erster Stelle funktioniert  
ErsterJanuar_Anzahl_Tage <- 31

### Funktionsname falsch und Vergleich musste mit ==, statt = durchgeführt werden
filter(mpg, cyl ==8)

## Klammern fehlten
getwd()

## Package readr fehlte, Methode falsch geschrieben. Zusätzlich habe ich persönlich für mich das Verzeichnis angepasst, so dass alles in Git abgelegt wird.) 
write_csv(mpg, paste0(getwd(),"/Lerneinheiten/mpg.csv"))

##https://github.com/TonyChopperMonsterEdition/M715_StatisticalComputing