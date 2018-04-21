<!doctype html>
<html lang="ru" class="uk-background-muted">
<head>
    <title>Ваши объявления на LOTOSHARE.BY</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.40/css/uikit.min.css"/>
</head>
<body>
<div class="uk-offcanvas-content">
    <!-- Header -->
    <div uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky">
        <nav class="uk-navbar uk-background-default uk-box-shadow-small" uk-navbar>
            <div class="nav-overlay uk-navbar-left">
                <ul class="uk-navbar-nav">
                    <li class="uk-parent"><a uk-toggle="target: #offcanvas" class="uk-navbar-toggle"><span
                            uk-navbar-toggle-icon></span> <span class="uk-margin-small-left uk-button-text">Меню</span></a>
                    </li>
                    <li class="uk-parent"><a class="uk-navbar-toggle"
                                             uk-toggle="target: .nav-overlay; animation: uk-animation-fade"><span
                            uk-search-icon></span> <span class="uk-margin-small-left uk-button-text">Поиск</span></a>
                    </li>
                </ul>
            </div>
            <div class="nav-overlay uk-navbar-right uk-flex-1" hidden>
                <div class="uk-navbar-item uk-width-expand">
                    <form action="/search" class="uk-search uk-search-navbar uk-width-1-1">
                        <input class="uk-search-input" name="q" type="search" placeholder="Что ищем?" autofocus>
                    </form>
                </div>
                <a class="uk-navbar-toggle" uk-close uk-toggle="target: .nav-overlay; animation: uk-animation-fade"></a>
            </div>

        </nav>
    </div>
    <!-- /Header -->
    <!-- Offcanvas -->
    <div id="offcanvas" uk-offcanvas="mode: push; overlay: true" uk-offcanvas>
        <div class="uk-offcanvas-bar">
            <a class="uk-offcanvas-close" type="button" uk-close></a>
            <ul class="uk-nav uk-nav-default">
                <div class="uk-navbar-item uk-logo">
                    <img src="/img/iconbrand.png" class="uk-navbar-item uk-logo"/>
                </div>
                <a href="/" class="uk-navbar-item uk-logo">LOTOSHARE</a>
                <li class="uk-nav-header">Объявление</li>
                <li><a href="/new"><span class="uk-margin-small-right" uk-icon="file-edit"></span>Создать
                    объявление</a></li>
                <li><a href="/viewpost/${userCook}"><span class="uk-margin-small-right" uk-icon="copy"></span>Ваши
                    объявления</a>
                </li>
                <li class="uk-nav-divider"></li>
                <li class="uk-nav-header">Категории</li>
                <#list categories as category>
                <li class="uk-nav-item"><a href="/sort/${category.getName()}"><span class="uk-margin-small-right"
                                                                                    uk-icon="album"></span>${category.getRuname()}
                </a></li>
                </#list>
                <li class="uk-nav-divider"></li>
                <li class="uk-nav-header">Информация</li>
                <li><a href="/about"><span class="uk-margin-small-right" uk-icon="code"></span>О проекте</a></li>
                <li><a href="/feedback"><span class="uk-margin-small-right" uk-icon="mail"></span>Обратная связь</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /Offcanvas -->
    <!-- Container -->
    <div class="uk-container uk-container-small uk-margin-medium">
        <h1 class="uk-heading-line uk-text-center"><span>Ваши объявления</span></h1>
        <#if postsSize == 0>
            <h1 class="uk-text-center"><span>У Вас нет объявлений!</span></h1>
        </#if>
        <#if postsSize != 0>
        <table class="uk-table uk-table-middle uk-table-divider uk-table-responsive">
            <thead>
            <tr>
                <th class="uk-width-small">Название</th>
                <th>Состояние объявления</th>
            </tr>
            </thead>
            <tbody>
            <#list posts as post>
            <tr>
                <td>${post.getTitle()}</td>
                <td><#if post.getShowPost() == "true">Опубликовано<#else>Идет проверка...</#if></td>
                <td>
                    <a href="/post/${post.getId()}" class="uk-button uk-button-default" type="button">Открыть</a>
                </td>
                <td>
                    <a href="/edit/${post.getId()}" class="uk-button uk-button-default" type="button">Редактировать</a>
                </td>
                <td>
                    <a href="/edit/delete/${post.getId()}" class="uk-button uk-button-default" type="button">Удалить</a>
                </td>
            </tr>
            </#list>
            </tbody>
        </table>
        </#if>
    </div>
    <!-- /Container -->
    <!-- Pagination -->
    <#if postsSize == 15>
    <div>
        <ul class="uk-pagination uk-flex-center" uk-margin>
            <#list page.items as item>
                <li class="${item.current?then('uk-disabled', 'uk-active')}"><a
                        href="${page.url + '?' + 'page=' + (item.number - 1) + '&size=' + page.size}"><span>${item.number}</span></a>
                </li>
            </#list>
        </ul>
    </div>
    </#if>
    <!-- /Pagination -->
</div>


<!-- My scripts -->
<script src="/js/scripts.js"></script>
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function () {
            try {
                w.yaCounter47933708 = new Ya.Metrika({
                    id: 47933708,
                    clickmap: true,
                    trackLinks: true,
                    accurateTrackBounce: true
                });
            } catch (e) {
            }
        });

        var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () {
                    n.parentNode.insertBefore(s, n);
                };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else {
            f();
        }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript>
    <div><img src="https://mc.yandex.ru/watch/47933708" style="position:absolute; left:-9999px;" alt=""/></div>
</noscript>
<!-- /Yandex.Metrika counter -->
<!-- UIkit JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.40/js/uikit.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.40/js/uikit-icons.min.js"></script>
</body>
</html>