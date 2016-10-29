# playing with R

setwd("~/work/oilers")
playerstats <- read.csv("./data/playerstats.csv")

players <- subset(
  playerstats[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )



