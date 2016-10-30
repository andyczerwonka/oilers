
setwd("~/work/oilers")

#player data
playersRaw <- read.csv("./data/playerstats.csv")
players <- subset(
  playersRaw[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )
players <- players[order(players$X.LastName, decreasing=TRUE),]

#team data
teamsRaw <- read.csv("./data/teamstats.csv")
teams <- subset(
  teamsRaw[, c(5,6,8,13,25)], 
  X.Team.Name == "Oilers" | X.Team.Name == "Flames"
)
teams <- teams[order(teams$X.Team.Name, decreasing=TRUE),]


# create a new table with Andy & Adam rows
totalPoints <- teams[, 4] + teams[, 5] + players[, 4]
gamesMissed <- teams[, 3] - players[, 3]
betStats <- data.frame(
  Who = c("Andy","Adam"),
  Team  = teams[, 2],
  Team.Games = teams[, 3],
  Team.Points = teams[, 4],
  Team.Goals = teams[, 5],
  Player  = players[, 1],
  Player.Points = players[, 4],
  Games.Missed = gamesMissed,
  Total = totalPoints
  )

library(ggplot2)

g <- ggplot(data=betStats, aes(x=Team, y=Team.Points, fill=Team)) +  geom_bar(stat="identity")
print(g)






