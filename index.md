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

<style type="text/css">

ul.nm_ul {
  list-style: none; /*убираем маркеры списка*/
  margin: 0; /*убираем отступы*/
  padding-left: 0; /*убираем отступы*/
  margin-top:25px; /*делаем отступ сверху*/
  background:#DCDCDC; /*добавляем фон всему меню*/
  height: 30px; /*задаем высоту*/
}
a.nm_a {
  text-decoration: none; /*убираем подчеркивание текста ссылок*/
  background:#696969; /*добавляем фон к пункту меню*/
  color:#fff; /*меняем цвет ссылок*/
  padding:0px 7px; /*добавляем отступ*/
  font-family: arial; /*меняем шрифт*/
  line-height:30px; /*ровняем меню по вертикали*/
  display: block; 
  border-right: 1px solid #677B27; /*добавляем бордюр справа*/
  -moz-transition: all 0.3s 0.01s ease; /*делаем плавный переход*/
  -o-transition: all 0.3s 0.01s ease;
  -webkit-transition: all 0.3s 0.01s ease;
}
a.nm_a:hover {
  background:#FF8C00;/*добавляем эффект при наведении*/
}
li.nm_li {
  float:left; /*Размещаем список горизонтально для реализации меню*/
  position:relative; /*задаем позицию для позиционирования*/
}
     
    /*Стили для скрытого выпадающего меню*/
    li.nm_li > ul.nm_ul {
        position:absolute;
        top:5px;
        display:none;   
    }
     
    /*Делаем скрытую часть видимой*/
    li.nm_li:hover > ul.nm_ul {
        display:block; 
        width:280px;  /*Задаем ширину выпадающего меню*/      
    }
   li.nm_li:hover > ul.nm_ul > li.nm_li {
        float:none; /*Убираем горизонтальное позиционирование*/
    }
</style>

<h2>Menu:</h2>
<center>
<ul class="nm_ul">
    <li class="nm_li"><a href="/" class="nm_a">Main</a></li>
    <li class="nm_li"><a href="/" class="nm_a">R Packages</a>
        <ul class="nm_ul">
            <li class="nm_li"><a href="/ryandexdirect" class="nm_a">ryandexdirect</a></li>
            <li class="nm_li"><a href="/rym" class="nm_a">rym</a></li>
            <li class="nm_li"><a href="/rfacebookstat" class="nm_a">rfacebookstat</a></li>
			<li class="nm_li"><a href="/rvkstat" class="nm_a">rvkstat</a></li>
			<li class="nm_li"><a href="/rmytarget" class="nm_a">rmytarget</a></li>
			<li class="nm_li"><a href="/rmixpanel" class="nm_a">rmixpanel</a></li>
			<li class="nm_li"><a href="/rGitHub" class="nm_a">rGitHub</a></li>
			<li class="nm_li"><a href="/getProxy" class="nm_a">getProxy</a></li>
        </ul>
    </li>
	<li class="nm_li"><a href="#" class="nm_a">Онлайн Книги</a>
	    <ul class="nm_ul">
            <li class="nm_li"><a href="https://r-for-marketing.netpeak.net/" class="nm_a">Язык R в Интернет Маркетинге</a></li>
            <li class="nm_li"><a href="https://netpeak.net/files/whitepapers/10-fishek-web-analitiki.pdf" class="nm_a">10 фишек Google Analytics</a></li>
        </ul>
	</li>
	<li class="nm_li"><a href="#" class="nm_a">Онлайн Курсы</a>
	    <ul class="nm_ul">
            <li class="nm_li"><a href="https://learn.needfordata.ru/r" class="nm_a">Язык R в Интернет Маркетинге</a></li>
        </ul>
    </li>
    <li class="nm_li"><a href="/library" class="nm_a">Статьи</a></li>
    <li class="nm_li"><a href="https://alexeyseleznev.wordpress.com/" class="nm_a">Блог</a></li>
    <li class="nm_li"><a href="/news" class="nm_a">Новости</a></li>
    <li class="nm_li"><a href="/publications" class="nm_a">Архив</a></li>
</ul>
</center>
<Br>
<h2>Search:</h2>
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
<Br>

## Описание пакета getProxy.
Пакет getProxy предназначен для работы с бесплатными прокси серверами из R.

## Ссылки
* [Документация](https://selesnow.github.io/getProxy/)
* [Отчёт об ошибках и доработках](https://github.com/selesnow/getProxy/issues)
* [Список релизов](https://github.com/selesnow/getProxy/releases)
* [Страница на rdocumetations]()
* [Группа в Вконтакте](https://vk.com/data_club)

## CRAN
[![Rdoc](http://www.rdocumentation.org/badges/version/getProxy)](http://www.rdocumentation.org/packages/getProxy)
[![rpackages.io rank](http://www.rpackages.io/badge/getProxy.svg)](http://www.rpackages.io/package/getProxy)

## Подробное описание.
Для упрощения задачи при работе с бесплатными API сервисами предоставляющими IP и порт прокси серверов был разработан пакет getProxy с помощью которого вы одной строкой кода, без особого труда можете автоматически запрашивать IP адрес и порт прокси сервера, применять к запросу фильтры по порту, странам и типу прокси, а так же сразу применять полученные настройки.
 
На  данный момент пакет содержит всего одну функцию getProxy, данная функция в своей работе использует 2 бесплатных API сервиса gimmeproxy.com и getproxylist.com, обращаясь к ним за IP и портом публично доступных и бесплатных прокси серверов.

## Видео мануал
<iframe width="560" height="315" src="https://www.youtube.com/embed/3onMs_YoAmA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Установка пакета getProxy:
Устанавливать пакет можно либо из основного репозитория для хранения пакетов в R - CRAN, либо необходимо из моего репозитория на GitHub, но для этого вам потребуется пакет devtools, для установки воспользуйтесь приведённым ниже кодом.

### Установка из CRAN
```r
install.packages("getProxy")
```
### Установка из GitHub
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
