# helper functions
source('util.R')

# setup auth
library(curl)
h <- new_handle()
handle_setheaders(h, "Authorization" = "Basic YW5keWN6ZXJ3b25rYTpwb2xvbmlh")

#team data
teams <-
    read.csv(
        curl(
            "https://www.mysportsfeeds.com/api/feed/pull/nhl/2016-2017/conference_team_standings.csv",
            handle = h
        )
    )
teams <- subset(teams[, c(5, 6, 8, 9, 10, 12, 13, 25)],
                X.Team.Name == "Oilers" | X.Team.Name == "Flames")
teams <- teams[order(teams$X.Team.Name, decreasing = TRUE),]

# create a new table with Andy & Adam rows
totalPoints <- teams[, 7] + teams[, 8]
betStats <- data.frame(
    Who = c("Andy", "Adam"),
    Team  = teams[, 2],
    Team.Games = teams[, 3],
    Team.Record = teamRecord(teams[, 4], teams[, 5], teams[, 6]),
    Team.Points = teams[, 7],
    Team.Goals = teams[, 8],
    Total = totalPoints
)
