library(dplyr)
library(purrr)
library(tidyverse)
library(ggplot2)
library(knitr)
library(rmarkdown)
library(magrittr)


setwd("~/RStudio/M715_StatisticalComputing/")
getwd()

ggplot(diamonds, aes(carat, price)) + 
  geom_hex()
WorkingDir<-getwd()
ggsave("diamonds.png", path = paste0(WorkingDir,'/Lerneinheiten'))

write.csv(diamonds, paste0(WorkingDir,"/Lerneinheiten/diamonds.csv"))
paste0(WorkingDir,"/Lerneinheiten/diamonds.csv")