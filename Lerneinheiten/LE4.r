install.packages("tidyverse")
library(tidyverse)

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