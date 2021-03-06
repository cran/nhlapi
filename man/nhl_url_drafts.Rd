% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nhl_drafts.R
\name{nhl_url_drafts}
\alias{nhl_url_drafts}
\title{Create an NHL API URL for drafts}
\usage{
nhl_url_drafts(draftYears = NULL)
}
\arguments{
\item{draftYears}{\code{integer()}, vector of one or more years in
\code{YYYY} format or \code{NULL} (default) for the current year's draft.
Also accepts a character vector of years in \code{YYYY} format.}
}
\value{
\code{character()}, API URLs, same length as \code{draftYears} or
length \code{1} if \code{draftYears} is \code{NULL}.
}
\description{
Create an NHL API URL for drafts
}
\examples{
  nhlapi:::nhl_url_drafts()
  nhlapi:::nhl_url_drafts(2015:2017)

}
