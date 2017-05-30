\name{getProxy}
\alias{getProxy}
\title{Function get ip and port by free proxy, start ans stop internet connection over free proxy server.}
\description{
This function get IP and Port from one of service gimmeproxy.com or getproxylist.com, and return him in your R environment.
Also this function can start and stop proxy seting in R.
}
\usage{
getProxy( country = NULL, notCountry = NULL, supportsHttps = TRUE, port = NULL, type = "http", action = "start")
}

\arguments{
  \item{country}{Character, country code in ISO 3166-1 alpha-2, for more ditail go - https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes}
  \item{notCountry}{Character, country code in ISO 3166-1 alpha-2, for more ditail go - https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes}
  \item{supportsHttps}{Logical, TRUE of FALSE supports HTTPS requests}
  \item{port}{Character, Port available on}
  \item{type}{Character, Proxy protocol, one of "http", "socks4", "socks5"}
  \item{action}{Character, wath do with proxy, one of "get" for get IP and PORT, "start" for get IP and PORT and start proxy settings, "stop" for stop proxy settings}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Alexey Seleznev
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#For get IP and PORT in R object
prox_ip_and_port <- getProxy(service = "getproxylist.com", port = "3128", country = "RU", action = "get")

#For get ans start proxy settings 
prox_ip_and_port <- getProxy(service = "getproxylist.com", port = "3128", country = "RU", action = "start")

#For stop proxy
getProxy(action = "stop")
}
