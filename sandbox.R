
setwd("~/work/oilers")

# options(stringsAsFactors = F) 

#player data
playerstats <- read.csv("./data/playerstats.csv")
players <- subset(
  playerstats[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )
names(players) <- c("Lastname", "Firstname", "Games", "Points")
players <- players[order(players$Lastname, decreasing=TRUE),]

#team data
teamstats <- read.csv("./data/teamstats.csv")
teams <- subset(
  teamstats[, c(5,6,8,13,25)], 
  X.Team.Name == "Oilers" | X.Team.Name == "Flames"
)
names(teams) <- c("City", "Team", "Games", "Points", "Goals")
teams <- teams[order(teams$Team, decreasing=TRUE),]


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




