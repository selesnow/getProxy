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
    
    proxy_list_raw <- try(GET(URL_txt), silent = T)
    proxy_list_raw <- try(content(proxy_list_raw), silent = T)
    proxy_ip_port  <- try(proxy_list_raw$ipPort, silent = T)
    
    if(is.null(proxy_ip_port)|class(proxy_ip_port)=="try-error"){
      
      packageStartupMessage(paste0("Error: ",if(class(proxy_list_raw)=="character") proxy_list_raw else proxy_list_raw$error,", try get proxy from getproxylist.com"), appendLF = T)
      
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
      
      proxy_list_raw <- try(GET(URL_txt), silent = T)
      proxy_list_raw <- try(content(proxy_list_raw), silent = T)
      proxy_ip_port  <- try(proxy_list_raw$ip, silent = T)
      
      proxy_ip_port  <- try(paste0(proxy_list_raw$ip, ":",proxy_list_raw$port))
    }
    
    if(is.null(proxy_ip_port)|class(proxy_ip_port)=="try-error"|proxy_ip_port==":"){
      
      packageStartupMessage(paste0("Error: ",if(class(proxy_list_raw)=="character") proxy_list_raw else proxy_list_raw$error,", try get proxy from getproxylist.com"), appendLF = T)
      
      service_name <- "proxy-list.download"
      
      URL_txt <- paste0("https://api.getproxylist.com/proxy?",
                        gsub("^&|&$", "",
                             gsub("&{2,5}", "&",
                                  paste(if(!is.null(country)) paste0("country=",country),
                                        if(!is.null(notCountry)) paste0("notCountry=",notCountry),
                                        if(isTRUE(supportsHttps))  paste0("allowsHttps=",1),
                                        if(!is.null(port)) paste0("port=",port),
                                        if(!is.null(type)) paste0("protocol=",type),
                                        sep = "&"))))
      
      proxy_list_raw <- try(GET("https://www.proxy-list.download/api/v1/get", 
                                query = list(
                                  type = type,
                                  country = country
                                )), silent = T)
      proxy_list_raw <- try(content(proxy_list_raw), silent = T)
      proxy_list_raw <- try(strsplit(proxy_list_raw, split = '\r\n', fixed = T)[[1]])
      
      if ( is.null(port) ) {
        proxy_ip_port <- head(proxy_list_raw, 1)
      } else {
        proxy_ip_port <- head(proxy_list_raw[grepl(pattern = paste0('.*:', port, "$"), proxy_list_raw)], 1)
      }
      
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
