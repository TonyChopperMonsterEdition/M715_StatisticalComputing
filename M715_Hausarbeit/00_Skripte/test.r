library(dplyr)
library(purrr)
library(tidyverse)
library(ggplot2)
library(knitr)
library(rmarkdown)


setwd("~/RStudio/M715_StatisticalComputing/")
getwd()

ggplot(diamonds, aes(carat, price)) + 
  geom_hex()
getwd()
ggsave("diamonds.png", path = paste(getwd(),'/Lerneinheiten'))

write.csv(diamonds, paste(getwd(),"/Lerneinheiten/diamonds.csv"))
