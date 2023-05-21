install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggrepel")
install.packages("viridis")
library(tidyverse)
library(dplyr)
library(ggrepel)
library(viridis)
library(tibble)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(title = "Fuel efficiency generally decreases with engine size")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(shape = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    shape = "Car type"
  )
?quote
?plotmath 

df <- tibble(
  x = runif(10),
  y = runif(10)
)
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(integral(x^2*dx, a, b))
  )

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(aes(label = model, color = class), data = best_in_class)


label <- mpg %>%
  summarise(
    displ = max(displ),
    hwy = max(hwy),
    label = "Increasing engine size is \nrelated to decreasing fuel economy."
  )

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right", nudge_x=-1.15)

?geom_text

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  annotate(geom="text",x=6.5 , y = 42.5, label = "Ein Text der \ninteressant ist")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)+
  annotate(geom="text",x=6.5 , y = 42.5, label = "Ein Text der \ninteressant ist")
?geom_label

#### Guides Funktionsweise
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 2, override.aes = list(size = 10)))
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv, shape = drv)) +
  scale_colour_brewer(palette = "Dark2")

presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_colour_manual(values = c(Republican = "red", Democratic = "blue"))

## Einzelne Observation Farblich hervorheben
getwd()

presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id, colour = name)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_colour_manual(values = c(Obama = "#0FFF2F"))+
  ggsave(paste0(getwd(),"/Lerneinheiten/obama.png"))

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  theme_light()
