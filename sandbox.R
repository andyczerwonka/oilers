
setwd("~/work/oilers")

# options(stringsAsFactors = F) 

#player data
playerstats <- read.csv("./data/playerstats.csv")
players <- subset(
  playerstats[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )
names(players) <- c("Lastname", "Firstname", "Games", "Points")
sortedPlayers <- players[order(players$Lastname, decreasing=TRUE),]

#team data
teamstats <- read.csv("./data/teamstats.csv")
teams <- subset(
  teamstats[, c(5,6,8,13,25)], 
  X.Team.Name == "Oilers" | X.Team.Name == "Flames"
)
names(teams) <- c("City", "Team", "Games", "Points", "Goals")
sortedTeams <- teams[order(teams$Team, decreasing=TRUE),]


# create a new table with Andy & Adam rows
betFrame <- data.frame(
  Who = c("Andy","Adam"),
  Team  = sortedTeams[, 2],
  Team.Games = sortedTeams[, 3],
  Team.Points = sortedTeams[, 4],
  Team.Goals = sortedTeams[, 5],
  Player  = sortedPlayers[, 1],
  Player.Points = sortedPlayers[, 4],
  Games.Missed = sortedTeams[, 3] - sortedPlayers[, 3]
  )




