//COOKIES
function getCookie(agree) {
    var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + agree.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function setCookie() {
    document.cookie = ('agree = yes');
}

if (getCookie('agree') === 'yes') document.getElementById('showAlert').style.display = 'none';

// function getShowAlertMassage(bool) {
//     if (bool === 'false') document.getElementById('alertMassage').style.display = 'none';
// }

//COOKIES

//SIDEBAR
function getSizeWindow() {
    return window.innerWidth;
}

function setWidthSideNav(getSizeWindow) {
    if (getSizeWindow < 584) {
        document.getElementById("container").style.display = "none";
        document.getElementById("sidenav").style.width = "100%";
    }
}

function setWidthSearchBar(getSizeWindow) {
    if (getSizeWindow < 548) {
        document.getElementById("search-btn-s").style.display = "none";
    }
}

function setDisplayBadgeClose(getSizeWindow) {
    if (getSizeWindow >= 992) {
        var x = document.createElement("STYLE");
        var t = document.createTextNode(".badge-cus {display: none;}");
        x.appendChild(t);
        document.head.appendChild(x);
    }
}

function setDisplayBadgeShow() {
    var x = document.createElement("STYLE");
    var t = document.createTextNode(".badge-cus {display: block;}");
    x.appendChild(t);
    document.head.appendChild(x);
}

// function autoOpenSideBar(getSizeWindow) {
//     if (getSizeWindow > 980) {
//         openNav();
//     }
// }

// autoOpenSideBar(getSizeWindow());

function openNav() {
    document.getElementById("sidenav").style.width = "270px";
    document.getElementById("sidenav").style.display = "block";
    document.getElementById("openNavButton").style.display = "none";
    document.getElementById("closeNavButton").style.display = "block";
    document.getElementById("container").style.marginLeft = "18rem";
    document.getElementById("container").style.width = "auto";
    document.getElementById("container").style.marginRight = "1rem";
    setWidthSideNav(getSizeWindow());
    // setDisplayBadgeClose(getSizeWindow());
}

function closeNav() {
    document.getElementById("sidenav").style.width = "0";
    document.getElementById("sidenav").style.display = "none";
    document.getElementById("openNavButton").style.display = "block";
    document.getElementById("closeNavButton").style.display = "none";
    document.getElementById("container").style.marginLeft = "auto";
    document.getElementById("container").style.marginRight = "auto";
    document.getElementById("container").style.display = "block";
    document.getElementById("badge-card").style.display = "block";
    // setDisplayBadgeShow();
}

function openSearchBar() {
    document.getElementById("search-bar").style.display = "block";
    document.getElementById("openSearchBar").style.display = "none";
    document.getElementById("closeSearchBar").style.display = "block";
    document.getElementById("search-btn-s").style.display = "block";
    setWidthSearchBar(getSizeWindow());
}

function closeSearchBar() {
    document.getElementById("search-bar").style.display = "none";
    document.getElementById("openSearchBar").style.display = "block";
    document.getElementById("closeSearchBar").style.display = "none";
    document.getElementById("search-btn-s").style.display = "none";
}

//SIDEBAR

//User Tooltip TODO Переработать User и Massage, изменить на popover.
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
});
$(function () {
    $('[data-toggle="popover"]').popover()
});
$('.popover-dismiss').popover({
    trigger: 'focus'
});
// /User Tooltip
