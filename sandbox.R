# helper functions
source('util.R')

# setup auth
library(curl)
h <- new_handle()
handle_setheaders(h, "Authorization" = "Basic YW5keWN6ZXJ3b25rYTpwb2xvbmlh")

#player data
players <- read.csv(curl("https://www.mysportsfeeds.com/api/feed/pull/nhl/2016-2017-regular/cumulative_player_stats.csv?playerstats=Pts", handle = h))
players <- subset(
  players[, c(3,4,18,19)], 
  (X.LastName == "McDavid" & X.FirstName == "Connor") | (X.LastName == "Gaudreau" & X.FirstName == "Johnny")
  )
players <- players[order(players$X.LastName, decreasing=TRUE),]

#team data
teams <- read.csv(curl("https://www.mysportsfeeds.com/api/feed/pull/nhl/2016-2017/conference_team_standings.csv", handle = h))
teams <- subset(
  teams[, c(5,6,8,9,10,12,13,25)], 
  X.Team.Name == "Oilers" | X.Team.Name == "Flames"
)
teams <- teams[order(teams$X.Team.Name, decreasing=TRUE),]

# create a new table with Andy & Adam rows
totalPoints <- teams[, 7] + teams[, 8] + players[, 4]
gamesMissed <- teams[, 3] - players[, 3]
betStats <- data.frame(
  Who = c("Andy","Adam"),
  Team  = teams[, 2],
  Team.Games = teams[, 3],
  Team.Record = teamRecord(teams[, 4], teams[, 5], teams[, 6]),
  Team.Points = teams[, 7],
  Team.Goals = teams[, 8],
  Player  = players[, 1],
  Player.Points = players[, 4],
  Games.Missed = gamesMissed,
  Total = totalPoints
  )



