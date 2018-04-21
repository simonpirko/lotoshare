<!doctype html>
<html lang="ru" class="uk-background-muted">
<head>
    <title>${title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.40/css/uikit.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body class="uk-background-muted">
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
    <div class="uk-container uk-margin-medium uk-container-small max-width-for-post-and-new">
        <h1 class="uk-heading-divider uk-text-center">Изменить объявление</h1>
        <form class="uk-grid-small" action="/edit/save" enctype="multipart/form-data" method="post">
            <fieldset class="uk-fieldset">
                <input type="hidden" name="description" value="${post.getDescription()}">
                <div class="uk-margin uk-width-1-1@s">
                    <input class="uk-input" type="hidden" value="${post.getTitle()}" placeholder="Название" minlength="5" maxlength="20" name="title"
                           required>
                </div>

                <div class="uk-column-1-3@s">
                    <div class="uk-margin">
                        <input minlength="3" value="${post.getAuthor()}" maxlength="16" class="uk-input" type="hidden" placeholder="Ваше имя"
                               name="author" required>
                    </div>
                    <div class="uk-margin">
                        <input class="uk-input" value="${post.getCity()}" type="hidden" placeholder="Город" minlength="3" maxlength="9" name="city"
                               required>
                    </div>
                    <div class="uk-margin">
                        <input class="uk-input" value="${post.getTelephone()}" type="hidden" placeholder="+375(__)___-__-__" minlength="13" maxlength="13" name="telephone"
                               required>
                    </div>
                </div>

                <div class="uk-column-1-3@s">
                    <div class="uk-margin">
                        <select hidden name="category" class="uk-select">
                            <option value="${post.getCategory()}" selected>${post.getCategory()}</option>
                            <#list categories as category>
                            <option value="${category.getName()}">${category.getRuname()}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="uk-margin">
                        <select hidden name="status" class="uk-select">
                            <option value="${post.getStatus()}" selected>${post.getStatus()}</option>
                            <option value="1 из 10">1 из 10</option>
                            <option value="2 из 10">2 из 10</option>
                            <option value="3 из 10">3 из 10</option>
                            <option value="4 из 10">4 из 10</option>
                            <option value="5 из 10">5 из 10</option>
                            <option value="6 из 10">6 из 10</option>
                            <option value="7 из 10">7 из 10</option>
                            <option value="8 из 10">8 из 10</option>
                            <option value="9 из 10">9 из 10</option>
                            <option value="10 из 10">10 из 10</option>
                        </select>
                    </div>
                    <div class="uk-margin">
                        <select hidden name="type" class="uk-select">
                            <option value="${post.getType()}" selected>${post.getType()}</option>
                            <option value="Отдам">Отдам</option>
                            <option value="Заберу">Заберу</option>
                            <option value="Обмен">Обменяю</option>
                        </select>
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <textarea class="uk-textarea" minlength="31" maxlength="255" name="text" rows="5"
                                  placeholder="Текст объявления..." required>${post.getText()}</textarea>
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <input type="text" value="${post.getURL1()}" name="URL1"
                               class="uk-input"
                               placeholder="Укажите URL адрес изображения(рекомендую http://imgbb.com)">
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <input type="text" value="${post.getURL2()}" name="URL2"
                               class="uk-input"
                               placeholder="Укажите URL адрес изображения(рекомендую http://imgbb.com)">
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <input type="text" value="${post.getURL3()}" name="URL3"
                               class="uk-input"
                               id="FormControlInput1"
                               placeholder="Укажите URL адрес изображения(рекомендую http://imgbb.com)">
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <input type="text" value="${post.getURL4()}" name="URL4"
                               class="uk-input"
                               placeholder="Укажите URL адрес изображения(рекомендую http://imgbb.com)">
                    </div>
                </div>
                <div class="uk-column-1-1">
                    <div class="uk-margin">
                        <input type="text" value="${post.getURL5()}" name="URL5"
                               class="uk-input"
                               placeholder="Укажите URL адрес изображения(рекомендую http://imgbb.com)">
                    </div>
                </div>
                <button type="submit" class="uk-button uk-button-default btn-top">Изменить
                </button>
            </fieldset>
        </form>
    </div>
    <!-- /Container -->
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