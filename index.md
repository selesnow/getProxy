<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
<head>
<link rel="shortcut icon" type="image/x-icon" href="as.ico">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114798296-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-114798296-1');
</script>
</head>
</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

<table>
    <tr>
      <td>
        <a href="https://selesnow.github.io/ryandexdirect/">ryandexdirect</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/rfacebookstat/">rfacebookstat</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/rvkstat/">rvkstat</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/rmytarget/">rmytarget</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/rmixpanel/">rmixpanel</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/getProxy/">getProxy</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/rGitHub/">rGitHub</a>
      </td>
      <td>
        <a href="https://selesnow.github.io/news/">NEWS</a>
      </td>
    </tr>
</table>

<center>
<script>
  (function() {
    var cx = '002735389418227325972:fdikniadyig';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
</center>

## Описание пакета getProxy.
Пакет getProxy предназначен для работы с бесплатными прокси серверами из R.

## Подробное описание.
Для упрощения задачи при работе с бесплатными API сервисами предоставляющими IP и порт прокси серверов был разработан пакет getProxy с помощью которого вы одной строкой кода, без особого труда можете автоматически запрашивать IP адрес и порт прокси сервера, применять к запросу фильтры по порту, странам и типу прокси, а так же сразу применять полученные настройки.
 
На  данный момент пакет содержит всего одну функцию getProxy, данная функция в своей работе использует 2 бесплатных API сервиса gimmeproxy.com и getproxylist.com, обращаясь к ним за IP и портом публично доступных и бесплатных прокси серверов.
 
## Установка пакета getProxy:
Устанавливать пакет необходимо из репозитория GitHub, для этого вам потребуется пакет devtools, для установки воспользуйтесь приведённым ниже кодом.
 
```r
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
 
```r
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

---

## *Автор пакета: Алексей Селезнёв, Head of Analytics Dept. at Netpeak*
<table>
    <tr>
      <td>
      <img align="right" src="https://lh3.googleusercontent.com/R-0jgJSxIIhpag2L6YCIhJVIcIWx6-Jt5UCTRJjWzJewo47u2QBnik5CRF2dNB79jmsN_BFRjVOAYfvCqFcn3UNS_thGbbxF-99c9lwBWWlFI7JCWE43K5Yk9HnIW8i8YpTDx3l28IuYswaI-qc9QosHT1lPCsVilTfXTyV2empF4S74daOJ6x5QHYRWumT_2MhUS0hPqUsKVtOoveqDnGf3cF_VsN-RfOAwG9uCeGOgNRgv_fhSr41rw4LBND4gf05nO8zMp4TZMrrcUjKvvx6qNgYDor5LFOHiRmfKISYRVkWYe4wLyGO1FgkgTDjg0300lcur2t3txVwZUgROLZdaxOLx4owa8Rc8B8VKwd3vHxjov_aVfNPT4xf9jSFBBEOI-mfYpa55ejKDw-rqTQ6miFRFWpp_hjrk9KbGyB-Z6iZvYL-2dZ6mzgpUfs2I0tEAGsV07yTzboJ0RNCByC2-U-ZVjWdp2_9Au3FFoUcdQUAmPYOVqOv4r3oLbkkJKLj2A5jp7vf4IAoExLIfJuqEf7XN7fFcv4geib029qJjBt28wnqSO6TKEwB2fesR3uPHvGB6_6NHD70UDH-aCRCK4UBeoajtU0Y8Ks8Vwxo0oZBwmoEu8gudTFBF6mDT7GjLoGLDeNxE-TG7OtWUdxsJk7yzXGW3hE-VxsMD9g=s351-no?w=100" height="150">
      </td>
      <td>
        <b>Контакты</b>
        <br>email: selesnow@gmail.com
        <br>skype: selesnow
        <br>telegram: @AlexeySeleznev
      </td>
    </tr>
    <tr>
     <table>
    <tr>
      <td>
        <a href="https://facebook.com/selesnow/">Facebook</a>
      </td>
      <td>
        <a href="https://vk.com/selesnow">Vkontakte</a>
      </td>
      <td>
        <a href="https://linkedin.com/in/selesnow">Linkedin</a>
      </td>
      <td>
        <a href="https://alexeyseleznev.wordpress.com/">Blog</a>
      </td>
      <td>
        <a href="https://github.com/selesnow/">GitHub</a>
      </td>
      <td>
        <a href="https://stepik.org/users/792428">Stepic</a>
      </td>
    </tr>
</table>
    </tr>
</table>
