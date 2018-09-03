getProxy <-
function(country = NULL, 
         notCountry = NULL, 
         supportsHttps = TRUE, 
         port = NULL, 
         type = "http",
         action = "start"){
  

  Sys.unsetenv("https_proxy")
  Sys.unsetenv("http_proxy")
  

  if(action %in% c("start","get")){
    service_name <- "gimmeproxy.com"

      packageStartupMessage("Ger proxy from gimmeproxy.com", appendLF = T)

      URL_txt <- paste0("https://gimmeproxy.com/api/getProxy?",
                        gsub("^&|&$", "",
                        gsub("^&|&$|&{2,5}", "&",
                        paste(if(!is.null(country)) paste0("country=",country),
                              if(!is.null(notCountry)) paste0("notCountry=",notCountry),
                              if(isTRUE(supportsHttps)) {paste0("supportsHttps=","true")}else{paste0("supportsHttps=","false")},
                              if(!is.null(port)) paste0("port=",port),
                              if(!is.null(type)) paste0("protocol=",type),
                              sep = "&"))))

      proxy_list_raw <- try(getURL(URL_txt))

      proxy_ip_port <- try(fromJSON(proxy_list_raw)$ipPort, silent = T)
      

      if(is.null(proxy_ip_port)|class(proxy_ip_port)=="try-error"){
        packageStartupMessage(paste0("Error: ",if(class(proxy_list_raw)=="character") proxy_list_raw else fromJSON(proxy_list_raw)$error,", try get proxy from getproxylist.com"), appendLF = T)

        service_name <- "getproxylist.com"
        URL_txt <- paste0("https://api.getproxylist.com/proxy?",
                          gsub("^&|&$", "",
                               gsub("&{2,5}", "&",
                                    paste(if(!is.null(country)) paste0("country=",country),
                                          if(!is.null(notCountry)) paste0("notCountry=",notCountry),
                                          if(isTRUE(supportsHttps))  paste0("allowsHttps=",1),
                                          if(!is.null(port)) paste0("port=",port),
                                          if(!is.null(type)) paste0("protocol=",type),
                                          sep = "&"))))

        proxy_list_raw <- getURL(URL_txt)

        proxy_ip_port <- paste0(fromJSON(proxy_list_raw)$ip, ":",fromJSON(proxy_list_raw)$port)
      }
      

      if(is.null(proxy_ip_port)){
        stop("Sorry, some error in both services API, try later.")
      }else{
      packageStartupMessage(paste0("Ger proxy from ",service_name," SUCCESS"), appendLF = T)
      packageStartupMessage(paste0("IP port: ", proxy_ip_port), appendLF = T)
      }
      

    if(action == "start"){

        if(isTRUE(supportsHttps)){
          Sys.setenv(https_proxy=proxy_ip_port)
            }else{
          Sys.setenv(http_proxy=proxy_ip_port) 
        }
        if(Sys.getenv("https_proxy")!=""|Sys.getenv("http_proxy")!=""){
          packageStartupMessage("Proxy server connection SUCCES", appendLF = T)
        }else{
          stop("Some error in proxy start!")
        }
    }
    return(proxy_ip_port)
  }
  
  if(action == "stop"){

    Sys.unsetenv("https_proxy")
    Sys.unsetenv("http_proxy")
    packageStartupMessage("Proxy server STOP", appendLF = T)
    }
}
