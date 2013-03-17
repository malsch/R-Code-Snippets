# standard graphic system

par(xpd=TRUE) # Auch außerhalb des Zeichenfensters malen
rug(vector) # zeichnet Punkte auf x-Achse
curve(sin, -2*pi, 2*pi, xname = "t")

# lattice
library(lattice)

# ggplot(2?)
