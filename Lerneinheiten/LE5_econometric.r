install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggrepel")
install.packages("viridis")
install.packages("AER")
install.packages("stargazer")
install.packages("plm")
install.packages("mvtnorm")
library(AER)
library(stargazer)

library(tidyverse)
library(dplyr)
library(ggrepel)
library(viridis)
library(tibble)

# prepare the data
data(CASchools)
CASchools$size <- CASchools$students/CASchools$teachers
CASchools$score <- (CASchools$read + CASchools$math) / 2

# fit a simple linear model
linear_model<- lm(score ~ income, data = CASchools)
coeftest(linear_model, vcov. = vcovHC, type = "HC1")
summary_lm <- summary(quadratic_model)

# fit the quadratic Model
quadratic_model <- lm(score ~ income + I(income^2), data = CASchools)

# obtain the model summary
coeftest(quadratic_model, vcov. = vcovHC, type = "HC1")
summary_qm <- summary(quadratic_model)
