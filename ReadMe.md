<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# getProxy<a href='https://selesnow.github.io/getProxy/'><img src='https://raw.githubusercontent.com/selesnow/getProxy/master/inst/logo/getProxy.png' align="right" height="139" /></a>

## Описание пакета getProxy.
Пакет getProxy предназначен для работы с бесплатными прокси серверами из R.

## CRAN
[![Rdoc](http://www.rdocumentation.org/badges/version/getProxy)](https://www.rdocumentation.org/packages/getProxy)
[![rpackages.io rank](http://www.rpackages.io/badge/getProxy.svg)](http://www.rpackages.io/package/getProxy)
[![](https://cranlogs.r-pkg.org/badges/getProxy)](https://cran.r-project.org/package=getProxy)

## Подробное описание.
Для упрощения задачи при работе с бесплатными API сервисами предоставляющими IP и порт прокси серверов был разработан пакет getProxy с помощью которого вы одной строкой кода, без особого труда можете автоматически запрашивать IP адрес и порт прокси сервера, применять к запросу фильтры по порту, странам и типу прокси, а так же сразу применять полученные настройки.
 
На  данный момент пакет содержит всего одну функцию getProxy, данная функция в своей работе использует 2 бесплатных API сервиса gimmeproxy.com и getproxylist.com, обращаясь к ним за IP и портом публично доступных и бесплатных прокси серверов.
 
## Установка пакета getProxy:
Устанавливать пакет как из CRAN так и из репозитория на GitHub, для этого вам потребуется пакет devtools, для установки воспользуйтесь приведённым ниже кодом.

```
install.packages("getProxy")
```

```
if(!"devtools"" %in% installed.packages()[,1]){install.packages("devtools")}
library(devtools)
install_github("selesnow/getProxy")
```

## Аргументы функции getProxy:

**country** - Текстовое значение, код страны в которой вы хотите запросить настройки прокси сервера, в формате ISO 3166-1 alpha-2, коды всех стран можно найти [тут](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes).

**notCountry** - Код страны по которой не надо запрашивать настройки прокси сервера, в формате ISO 3166-1 alpha-2, коды всех стран можно найти [тут](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes).

**supportsHttps** - Логическое значение TRUE или FALSE, используется для фильтрации прокси серверов по поддержке протокола https. 

**port** - Номер порта для фильтрации прокси серверов.

**type** - Тип протокола прокси сервера, поддерживает возможные значения "http", "socks4", "socks5". 

**action** - Действие которое необходимо сделать, "start" для того, чтобы получить и сразу направить интернет соединение через прокси сервер, "get" в случае если вы хотите просто получить IP адрес и порт прокси сервера, но не применять эти настройки, "stop" если вы хотите отключится от прокси сервера.
 
## Пример использования функции getProxy.

Для того, чтобы автоматизировать процесс получения IP адреса и порта прокси сервера, и созранения его в объект без перенаправления интернет соединения достаточно в аргументе action установить значение “get”.
 
`prox_ip_and_port <- getProxy(port = "3128", country = "RU", action = "get")`
 
Если помимо того, что вы хотите получить IP адрес и порт прокси сервера вы одновременно хотите применить полученные настройки в аргумент action передайте значение “start”.
 
`prox_ip_and_port <- getProxy(port = "3128", country = "RU", supportsHttps = TRUE, action = "start")`
 
Если вам необходимо отключится от прокси сервера достаточно передать в аргумент action значение “stop”.
 
`getProxy(action = "stop")`
 
## Пример обращения к API Яндекс.Директ через прокси сервер с помощью пакета getProxy.

Перед запуском приведённого ниже кода у вас уже должны быть установлены пакеты ryandexdirect и getProxy, процесс установки данныъ пакетов описан в предыдущих пунктах статьи.
 
```
#Подключаем пакеты
library(ryandexdirect)
library(getProxy)
 
#Запрашиваем IP адрес и порт и применяем полученные настройки
getProxy(port = "3128", country = "RU", supportsHttps = TRUE, action = "start")
 
#Получаем API токен
myToken <- yadirGetToken()
 
#Обращаемся к API Яндекс Директ
My_report <- yadirGetReport(ReportType = "CAMPAIGN_PERFORMANCE_REPORT", 
                            DateRangeType = "CUSTOM_DATE", 
                            DateFrom = '2017-01-01', 
                            DateTo = '2017-01-31', 
                            FieldNames = c("CampaignName","Impressions","Clicks"), 
                            FilterList = c("Clicks GREATER_THAN 49","Impressions LESS_THAN 1001"), 
                            Login = <YourLogin>, 
                            Token = myToken)
 
#Отключаемся от прокси сервера
getProxy(action = "stop")
```
 
Приведённый выше код при каждом запуске  будет автоматически запрашивать настройки доступного прокси сервера и применять их.

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://www.facebook.com/selesnow)
<Br>linkedin: [linkedin.com/in/selesnow](https://www.linkedin.com/in/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
  
<p align="center">
<img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" data-canonical-src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png?w=300" style="max-width:100%;">
</p>
