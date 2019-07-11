<!DOCTYPE html>
<html lang="ru">
<head>
    <title>${title}</title>
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
    <script src="/js/scripts.js" defer></script>
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
        <a class="row font-weight-light" href="/about"><i class="col-1 material-icons">code</i><span
                class="col-9 custom-col-span-category-name">О проекте</span></a>
        <a class="row font-weight-light" href="/feedback"><i class="col-1 material-icons">feedback</i><span
                class="col-9 custom-col-span-category-name">Обратная связь</span></a>
    </div>
</div>
<!-- /Side Bar -->

<!-- Disable JS -->
<noscript>
    <p class="font-weight-light text-center h5 m-4">Ужас! Включите JavaScript!</p>
</noscript>
<!-- Disable JS -->

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

        <#--<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Popover title"-->
        <#--data-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover-->
        <#--</button>-->

            <span data-toggle="popover" data-placement="bottom"
                  title="Ваши сообщения" tabindex="0" data-trigger="focus" data-content="У Вас нет новых сообщений!"
                  class="nav-link alert-btn"><i class="material-icons">notifications_none</i></span>
            <#if alertMassageShow>
            <span data-toggle="popover" data-placement="bottom"
                  title="Ваши сообщения" tabindex="0" data-trigger="focus" data-content="${alertMassage}"
                  class="nav-link alert-btn"><i class="material-icons">notifications_active</i></span>
            </#if>
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
            <div class="alert alert-dismissible fade show" role="alert">
                <strong class="text-muted">Добро пожаловать!</strong>
                <p class="text-muted text-justify">${massage}</p>
                <button type="button" class="close" data-dismiss="alert" onclick="setCookie()" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
    <!-- Users cook alert row -->

    <!-- NULL -->
    <#if postsSize == 0>
        <div class="row">
            <p class="col font-weight-light text-center h3 mt-5">Нет объявлений!</p>
        </div>
        <div class="row">
            <p class="col font-weight-light text-center h5 mt-2">Вы можете это исправить!</p>
        </div>
    </#if>
    <!-- NULL -->

    <!-- Cards row -->
<#--<div class="card-columns">-->
<#--<#if postsSize != 0>-->
<#--<#list posts as post>-->
<#--<div class="card custom-card rounded-0">-->
<#--<#if post.getURL1() != "">-->
<#--<img class="card-img-top rounded-0"-->
<#--src="${post.getURL1()}">-->
<#--</#if>-->
<#--<a class="text-dark card-link" href="${"/post/" + post.getId()}">-->
<#--<div class="card-body">-->
<#--<p class="card-title font-weight-bold">${post.getTitle()}</p>-->
<#--<p class="card-text small text-truncate">${post.getText()}</p>-->
<#--<p class="row card-text">-->
<#--<span class="col-7 font-weight-light">${post.getDate()}</span>-->
<#--<span class="col-4 badge badge-success rounded-0 custom-badge text-uppercase">${post.getType()}</span>-->
<#--</p>-->
<#--</div>-->
<#--</a>-->
<#--</div>-->
<#--</#list>-->
<#--</#if>-->
<#--</div>-->
    <div class="row">
        <#list posts as post>
            <div class="col-lg-3 custom-card-col">
                <div class="card custom-card rounded-0">
                    <a href="${'/post/' + post.getId()}" class="text-dark card-link">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold">${post.getTitle()}</h5>
                            <p class="card-text small text-truncate">${post.getText()}</p>
                            <div class="row card-text badge-cus">
                                <span class="col-7 text-muted font-weight-light">${post.getDate()}</span>
                                <span class="col-5 text-center text-muted font-weight-light text-uppercase">${post.getType()}</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </#list>
    </div>
    <!-- Cards row -->

    <!-- Pagination -->
    <#if postsSize == 36>
    <div class="row pagination-bar">
        <nav class="col small" aria-label="Pagination bar">
            <ul class="pagination justify-content-center">
                 <#list page.items as item>
                     <li class="page-item ${item.current?then("disabled", "")}"><a
                             class="page-link custom-paginaton ${item.current?then('text-success', 'text-dark')} rounded-0"
                             href="${page.url + '?' + 'page=' + (item.number - 1) + '&size=' + page.size}">${item.number}</a>
                     </li>
                 </#list>
            </ul>
        </nav>
    </div>
    </#if>
    <!-- Pagination -->
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
