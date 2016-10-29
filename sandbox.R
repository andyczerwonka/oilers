
setwd("~/work/oilers")

# options(stringsAsFactors = F) 

#player data
playerstats <- read.csv("./data/playerstats.csv")
players <- subset(
  playerstats[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )
names(players) <- c("Lastname", "Firstname", "Games", "Points")

#team data
teamstats <- read.csv("./data/teamstats.csv")
teams <- subset(
  teamstats[, c(5,6,8,16,28)], 
  X.Team.Name == "Oilers" | X.Team.Name == "Flames"
)
names(teams) <- c("City", "Team", "Games", "Points", "Goals")
sortedTeam <- teams[order(teams$Team),]
wombat <- with(teams, teams[-order(Team),])


# create a new table with Andy & Adam rows
betFrame <- data.frame(
  Who = c("Andy","Adam"),
  Team  = teams[, 2],
  Player  = players[, 1],
  Games = teams[, 3],
  Player.Points = players[, 4],
  Team.Points = teams[, 4],
  Team.Goals = teams[, 5]
  )




