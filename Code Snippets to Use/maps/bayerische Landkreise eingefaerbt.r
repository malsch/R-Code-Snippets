library("sp")
library("vcd")
# library("data.table")
# library("RODBC")

## Laden der rdata file f?r ganz deutschland http://www.gadm.org/download
load("DEU_adm3.RData") ## liste m?st hat level3 geladen, ich wei? aber nicht was du brauchst

## only Bavaria
bayern_PID <- gadm@data$PID[gadm@data$NAME_1 == "Bayern"]
gadm_bayern <- subset(gadm, gadm@data$PID %in% bayern_PID)


# plot(gadm_bayern) 

# Procedure: draw a map of Bavaria first, Assign to each numeric value some color and plot this color into the districts.

# bring data in correct order
data <- data.frame(loc = gadm_bayern@data$NAME_3, val = sample(1:100,96))
ind <- match(gadm_bayern@data$NAME_3, data$loc)
SPRs <- data$val[ind]


## Farben
### Kategorien für pred
#SPRs <- daten_sorted$SPRs_2009
# steps <- (max(SPRs) - min(SPRs))/10
# i <- 1:10
# brk <- rep(min(SPRs), 11) + c(-1,steps * i)
# define breakpoints
# ceiled_max <- ceiling(max(SPRs)) 
# if (ceiled_max <= 8) brk <- seq(0, ceiled_max, by=0.5)
# else brk <- seq(0, ceiled_max, by=1)
maxVal <- 11 # max(10, round(max(SPRs) + 1)) # what shall be the maximum value?
brk <- c(seq(0, maxVal, length=25), 30) # where to set the breaks
cf <- as.integer(cut(SPRs, brk))

# choose colors
# cols <- rev(sequential_hcl(length(brk), h = 30, c.=c(400,50),c(10,90), power = 1))
cols <- c("#00000000", heat.colors(20)[1:16], rev(terrain.colors(20))[11:20])
# pal(c("#00000000", heat.colors(20)[1:16], rev(terrain.colors(20))[11:20]))
##Farbenvektor initialisieren
hcols <- rep("#00000000", length(SPRs))

### richtige Farbe fuer jeden Punkt
for (i in 1:length(SPRs))
  hcols[i] <- cols[cf[i]]

# plot map
par(pin=c(6,6))
layout(matrix(c(1,2), 2, 1, byrow = TRUE), widths=rep(1,2), heights=c(0.7,0.1))
plot.title <- paste("Anteil der gemeldeten Eintragungen (in %), Stand: 29.1.2013")
plot(gadm_bayern, col = hcols)
mtext(plot.title, side = 1, cex = 1.2)

# what is this supposed to do?
par(pin=c(6,0.5))
plot(1:length(brk), rep(0, length(brk)), ylim = c(0,1), type = "n", axes = FALSE,
     ylab = "", xlab = "")

# plot legend
rect(1:(length(brk) - 1), 0, 2:length(brk), 0.5, col = cols)
w <- c(round(brk, digits = 1)[-26], ">11") #round(brk/1000, digits = 1) 
ind <- seq(1, 26, by=5)
# text(c(1.2, (2:length(brk)-1)[ind]), rep(0.75, length(brk))[ind], w[ind], cex = 0.95)
text((1:length(brk))[ind], rep(0.75, length(brk))[ind], w[ind], cex = 0.95)