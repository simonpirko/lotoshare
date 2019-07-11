<!DOCTYPE html>
<html lang="ru">
<head>
<#--<title>${title}</title>-->
    <!-- Required meta tags and links -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Google Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/css/sidebar.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <!-- JS -->
    <script async="" src="/js/scripts.js"></script>
</head>
<body>

<!-- Side Bar -->
<div id="sidenav" class="sidenav border-right">
    <div class="container">
        <a class="row font-weight-light" href="/new"><i class="col-1 material-icons">create</i><span
                class="col-9 custom-col-span-category-name">Создать объявление</span></a>
        <a class="row font-weight-light" href="/viewpost/${userCook}"><i
                class="col-1 material-icons">business_center</i><span
                class="col-9 custom-col-span-category-name">Ваши объявления</span></a>
        <div class="dropdown-divider"></div>
        <#list categories as category>
        <a class="row font-weight-light" href="/sort/${category.getName()}"><i
                class="col-1 material-icons">list</i><span
                class="col-9 custom-col-span-category-name">${category.getRuname()}</span></a>
        </#list>
        <div class="dropdown-divider"></div>
        <a class="font-weight-light" href="/about"><i class="material-icons">code</i><span
                class="col-9 custom-col-span-category-nam">О проекте</span></a>
        <a class="font-weight-light" href="/feedback"><i class="material-icons">feedback</i><span
                class="col-9 custom-col-span-category-name">Обратная связь</span></a>
    </div>
</div>
<!-- /Side Bar -->

<!-- Nav Bar -->
<nav id="navbar" class="navbar navbar-custom sticky-top">
    <ul class="navbar-nav">
        <li class="nav-item">
            <span id="openNavButton" class="nav-link open-btn menu" onclick="openNav()"><i
                    class="material-icons">menu</i></span>
            <span id="closeNavButton" class="nav-link close-btn menu" onclick="closeNav()"><i class="material-icons">first_page</i></span>
        </li>
        <li class="nav-item">
            <span id="openSearchBar" class="nav-link search-btn" onclick="openSearchBar()"><i
                    class="material-icons">search</i></span>
            <span id="closeSearchBar" class="nav-link search-btn close-search" onclick="closeSearchBar()"><i
                    class="material-icons">youtube_searched_for</i></span>
            <form action="/search">
                <input id="search-bar" class="search-bar" placeholder="Что ищем?" aria-label="Search" name="q"
                       type="search">
                <button id="search-btn-s" class="search-btn-s" type="submit"><i class="material-icons for-search-icon">search</i>
                </button>
            </form>
        </li>
    </ul>
    <ul class="navbar-nav">
        <li class="nav-item">
                <span id="brand" class="brand"><a href="/">
                    <img height="40px"
                         src="http://www.seochat.com/wp-content/uploads/2016/09/branding.jpg" alt="">
                </a></span>
        </li>
    </ul>
    <ul class="navbar-nav">
        <li class="nav-item">
            <span data-toggle="tooltip" data-placement="bottom"
                  title="У Вас нет новых сообщений!" class="nav-link alert-btn"><i class="material-icons">notifications_none</i></span>
        <#--<#if alertMassageShow>-->
        <#--<span data-toggle="tooltip" data-placement="bottom"-->
        <#--title="${alertMassage}" class="nav-link alert-btn"><i class="material-icons">notifications_active</i></span>-->
        <#--</#if>-->
        </li>
        <li class="nav-item">
            <span data-toggle="tooltip" data-placement="bottom"
                  title="Приветствую, Гость!"
                  class="nav-link user-btn user"><i class="material-icons">person_outline</i></span>
        <#--<#if user != "guest">-->
        <#--<span data-toggle="tooltip" data-placement="bottom"-->
        <#--title="Приветствую, ${user}!"-->
        <#--class="nav-link user-btn user"><i class="material-icons">person_outline</i></span>-->
        <#--</#if>-->
        </li>
    </ul>
</nav>
<!-- /Nav Bar -->

<!-- Container -->
<div id="container" class="container custom-container">

    <!-- Users cook alert row -->
    <div class="row">
        <div id="showAlert" class="col cooks-alert">
        </div>
    </div>
    <!-- Users cook alert row -->

    <!-- Post content rows -->
    <div class="row justify-content-center mt-3">
        <p class="text-center font-weight-light h1">${post.getTitle()}</p>
    </div>
    <div class="row justify-content-center mt-1">
        <p class="text-center font-weight-light text-muted h6">${post.getType() + ", " + post.getDate()}</p>
    </div>
    <div class="row justify-content-left custom-text-description mt-5">
        <p class="font-weight-light text-justify h5">${post.getText()}</p>
    </div>
    <div class="row justify-content-left custom-text-description mt-3">
        <p class="font-weight-light text-muted h6">${'Автор: ' + post.getAuthor()}</p>
    </div>
    <div class="row justify-content-left custom-text-description">
        <p class="font-weight-light text-muted h6">${'Город: ' + post.getCity()}</p>
    </div>
    <div class="row justify-content-left custom-text-description">
        <p class="font-weight-light text-muted h6">${'Состояние: ' + post.getStatus()}</p>
    </div>
    <div class="row justify-content-left custom-text-description">
        <p class="font-weight-light text-muted h6">${'Телефон: ' + post.getTelephone()}</p>
    </div>
    <!-- Post content rows -->

</div>
<!-- /Container -->
<!-- Yandex.Metrika counter -->
<#--<script type="text/javascript">-->
<#--(function (d, w, c) {-->
<#--(w[c] = w[c] || []).push(function () {-->
<#--try {-->
<#--w.yaCounter47933708 = new Ya.Metrika({-->
<#--id: 47933708,-->
<#--clickmap: true,-->
<#--trackLinks: true,-->
<#--accurateTrackBounce: true-->
<#--});-->
<#--} catch (e) {-->
<#--}-->
<#--});-->

<#--var n = d.getElementsByTagName("script")[0],-->
<#--s = d.createElement("script"),-->
<#--f = function () {-->
<#--n.parentNode.insertBefore(s, n);-->
<#--};-->
<#--s.type = "text/javascript";-->
<#--s.async = true;-->
<#--s.src = "https://mc.yandex.ru/metrika/watch.js";-->

<#--if (w.opera == "[object Opera]") {-->
<#--d.addEventListener("DOMContentLoaded", f, false);-->
<#--} else {-->
<#--f();-->
<#--}-->
<#--})(document, window, "yandex_metrika_callbacks");-->
<#--</script>-->
<#--<noscript>-->
<#--<div><img src="https://mc.yandex.ru/watch/47933708" style="position:absolute; left:-9999px;" alt=""/></div>-->
<#--</noscript>-->
<!-- /Yandex.Metrika counter -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>