% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nhl_plot_utils.R
\name{nhl_plot_rink}
\alias{nhl_plot_rink}
\title{Plot an NHL rink}
\usage{
nhl_plot_rink()
}
\description{
Initialize a plot in base graphics with
a to-scale NHL rink as the background
}
\details{
The placement of rink features & their sizes
are exact according to the NHL rule book; see citation.
}
\examples{
\dontrun{
  # Retrieve some game feed data
  gameFeeds <- lapply(
   2019010001:2019010010,
   nhlapi::nhl_games_feed
  )

  # Create a data.frame with plays
  getPlaysDf <- function(gm) {
    playsRes <- try(gm[[1L]][["liveData"]][["plays"]][["allPlays"]])
    if (inherits(playsRes, "try-error")) data.frame() else playsRes
  }
  plays <- lapply(gameFeeds, getPlaysDf)
  plays <- nhlapi:::util_rbindlist(plays)
  plays <- plays[!is.na(plays$coordinates.x), ]

  # Move the coordinates to non-negative values before plotting
  plays$coordx <- plays$coordinates.x + abs(min(plays$coordinates.x))
  plays$coordy <- plays$coordinates.y + abs(min(plays$coordinates.y))

  # Select goals only
  goals <- plays[plays$result.event == "Goal", ]

  # Create the plot and add goals
  nhlapi::plot_rink()
  points(goals$coordinates.x, goals$coordinates.y)
}
}
