\name{getProxy}
\alias{getProxy}
\title{Get ip and port by free proxy, start ans stop internet connection over free proxy server.}
\description{
Get IP and Port from one of service gimmeproxy.com or getproxylist.com, and return him in your R environment.
Also this function can start and stop proxy seting in R.
}
\usage{
getProxy( country = NULL, notCountry = NULL, 
    supportsHttps = TRUE, port = NULL, 
	type = "http", action = "start")
}

\arguments{
  \item{country}{Character, country code in ISO 3166-1 alpha-2, for more ditail go \href{https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes}{link}}
  \item{notCountry}{Character, country code in ISO 3166-1 alpha-2, for more ditail go - \href{https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes}{link}}
  \item{supportsHttps}{Logical, TRUE of FALSE supports HTTPS requests}
  \item{port}{Character, Port available on}
  \item{type}{Character, Proxy protocol, one of "http", "socks4", "socks5"}
  \item{action}{Character, wath do with proxy, one of "get" for get IP and PORT, "start" for get IP and PORT and start proxy settings, "stop" for stop proxy settings}
}
\details{
You can use getProxy when you needed get data from blocked on you country internet source.
}
\references{
Package use three services \href{http://gimmeproxy.com/}{gimmeproxy}, \href{https://www.proxy-list.download/}{proxy-list.download} and \href{https://getproxylist.com/}{getproxylist}.
}
\author{
Alexey Seleznev
}
\examples{
\dontrun{
#For get IP and PORT in R object
prox_ip_and_port <- getProxy(port = "3128", 
							 country = "RU", 
							 action = "get")

#For get and start proxy settings 
prox_ip_and_port <- getProxy(port = "3128", 
							 country = "RU", 
							 action = "start")

#For stop proxy
getProxy(action = "stop")
}
}
