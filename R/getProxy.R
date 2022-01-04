# helpers
getGimmeproxy <- function(
  country = NULL, 
  notCountry = NULL, 
  supportsHttps = TRUE, 
  port = NULL, 
  type = "http"
) {
  
  service_name <- "gimmeproxy.com"
  
  cli_alert_info('Try to get proxy from {service_name}')
  
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
  
  if (is.null(proxy_ip_port)) proxy_ip_port <- NA
  
  res <- list(
    proxy = proxy_ip_port,
    service = service_name,
    success = !(is.na(proxy_ip_port)|class(proxy_ip_port)=="try-error"|proxy_ip_port==":"),
    err_msg = proxy_list_raw$error
  )
  
  return(res)
  
}

getProxyList <- function(
  country = NULL, 
  notCountry = NULL, 
  supportsHttps = TRUE, 
  port = NULL, 
  type = "http"
) {
  
  service_name <- "getproxylist.com"
  
  cli_alert_info('Try to get proxy from {service_name}')
  
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
  
  res <- list(
    proxy   = proxy_ip_port,
    service = service_name,
    success = !(is.null(proxy_ip_port)|class(proxy_ip_port)=="try-error"|proxy_ip_port==":"),
    err_msg = proxy_list_raw$error
  )
  
  return(res)
  
}


getProxyList2 <- function(
  country = NULL, 
  notCountry = NULL, 
  supportsHttps = TRUE, 
  port = NULL, 
  type = "http"
){
  
  service_name <- "proxy-list.download"
  
  cli_alert_info('Try to get proxy from {service_name}')
  
  proxy_list_raw <- try(GET("https://www.proxy-list.download/api/v1/get", 
                            query = list(
                              type = type,
                              country = country
                            )), silent = T)
  
  proxy_list_raw <- try(content(proxy_list_raw), silent = T)
  
  proxy_ip_port_all <- try(strsplit(proxy_list_raw, split = '\r\n', fixed = T)[[1]])
  
  if ( !is.null(port) ) {
    proxy_ip_port <- proxy_ip_port_all[grepl(paste0('.*:',port,'$'), proxy_ip_port_all)][1]
  } else {
    proxy_ip_port <- proxy_ip_port_all[1]
  }
  
  if (!all(grepl('\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}:\\d{1,6}', proxy_ip_port))) {
    err_msg <- proxy_ip_port
  } else {
    err_msg <- ""
  }
  
  if (is.na(proxy_ip_port)) {
    err_msg <- "No proxy found for your request, try changing the port"
  }
  
  res <- list(
    proxy   = proxy_ip_port,
    service = service_name,
    success = all(grepl('\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}:\\d{1,6}', proxy_ip_port)),
    err_msg = err_msg
  )
  
  return(res)
  
}

getProxyFunctions <- list(
  getGimmeproxy,
  getProxyList,
  getProxyList2
)

# main
getProxy <- 
  function(country = NULL, 
           notCountry = NULL, 
           supportsHttps = TRUE, 
           port = NULL, 
           type = "http",
           action = "start"){
    
    Sys.unsetenv("https_proxy")
    Sys.unsetenv("http_proxy")
    
    if ( action %in% c("start","get") ){
    
      n_attempt <- 1
      success <- FALSE
      
      while ( !success & n_attempt <= 10 ) {
        
        GPfun <- sample(getProxyFunctions, 1)[[1]]
        proxy <- GPfun(
          country = country,
          notCountry = notCountry,
          supportsHttps = supportsHttps,
          port = port,
          type = type
        )
        
        success <- proxy$success
        
        if (!success) cli_alert_danger(proxy$err_msg)
        
        n_attempt <- n_attempt + 1
        
      }
      
      if (n_attempt == 11 & !success) {
        cli_abort('Some error, see log!')
      } else {
        cli_alert_success('Get {proxy$proxy} from {proxy$service}')
      }
      
      if (action == "start") {
        
      if( isTRUE(supportsHttps) ){
          Sys.setenv(https_proxy=proxy$proxy)
        }else{
          Sys.setenv(http_proxy=proxy$proxy) 
        }
        if (Sys.getenv("https_proxy")!=""|Sys.getenv("http_proxy")!=""){
          cli_alert_success('Set {proxy$proxy} SUCCESS from {proxy$service}')
        }else{
          cli_abort("Some error in proxy start!")
        }
      }
  
      return(proxy$proxy)
    }

    if(action == "stop"){
      
      Sys.unsetenv("https_proxy")
      Sys.unsetenv("http_proxy")
      cli_alert_success("Proxy server STOP")
      
    }
    
}
