\name{getProxy-package}
\alias{getProxy-package}
\docType{package}
\title{
\packageTitle{getProxy}
}
\description{
\packageDescription{getProxy}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{getProxy}
\packageIndices{getProxy}
}
\author{
\packageAuthor{getProxy}

Maintainer: \packageMaintainer{getProxy}
}

\examples{
\dontrun{
library(getProxy)
#For get ans start proxy settings 
prox_ip_and_port <- getProxy(port    = "3128", 
							 country = "RU", 
							 action  = "start")

# This put you code for get data 
# from blocked source

#For stop proxy
getProxy(action = "stop")
}
}
