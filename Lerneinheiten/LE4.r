install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggrepel")
install.packages("viridis")
library(tidyverse)
library(dplyr)

?mpg ## Displays information about the Dataset
ggplot(data = mpg) + ##erstellt ein Kordinatensystem für das Tibble
  geom_point(mapping = aes(x = displ, y = hwy)) ## Grafikebene von Bildpunkten wird hinzugefügt, basierend auf die ausgewählten Variablen des Tibbles

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))##color ändert die Farbe der Bildpunkte orientiert an der Vorgabe einer nominalen Variable

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = displ))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = displ))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = displ))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cyl ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype=class))+
  facet_wrap(~class)

### Statistische Transformation
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

?stat_summary()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop), group=1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

smaller <- diamonds %>% filter(carat < 3)
ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)


ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) ### Mit Neusortierung

diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))


ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

# install.packages("hexbin")
ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))


library(modelr)


###Modellierung vornehmen
mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(mpg,aes(displ, cty)) + geom_point()
ggplot(data = diamonds2) + 
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = mpg, mapping = aes(x = manufacturer, fill = class)) + 
  geom_bar(alpha = 0.3, position = "dodge")

ggplot(economics,aes(date,unemploy)) + 
  line()

ggplot(economics,aes(date,unemploy)) + geom_line()
