library(dplyr)
library(purrr)
library(tidyverse)
library(ggplot2)
library(knitr)
library(rmarkdown)
library(magrittr)

getwd()
setwd("~/RStudio/M715_StatisticalComputing/")


ggplot(diamonds, aes(carat, price)) + 
  geom_hex()
WorkingDir<-getwd()
ggsave("diamonds.png", path = paste0(WorkingDir,'/Lerneinheiten'))

write.csv(diamonds, paste0(WorkingDir,"/Lerneinheiten/diamonds.csv"))
paste0(WorkingDir,"/Lerneinheiten/diamonds.csv")

x <- 4

x <- x-2

y <- 8

z <- x/y

x <- x+2

z <- z*x*y