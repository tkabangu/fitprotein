(window.webpackJsonp=window.webpackJsonp||[]).push([["app"],{ldto:function(e,t,n){},ng4s:function(e,t,n){"use strict";n.r(t);n("QWBl"),n("07d7"),n("5s+n"),n("FZtP"),n("ldto");console.log("Hello Webpack Encore! Edit me in assets/js/app.js");var o=n("EVdn");n("SYky"),o(document).ready((function(){o('[data-toggle="popover"]').popover()})),document.querySelectorAll("[data-delete]").forEach((function(e){e.addEventListener("click",(function(t){t.preventDefault(),fetch(e.getAttribute("href"),{method:"DELETE",headers:{"X-Requested-With":"XMLHttpRequest","Content-Type":"application/json"},body:JSON.stringify({_token:e.dataset.token})}).then((function(e){return e.json()})).then((function(t){t.success?e.parentNode.parentNode.removeChild(e.parentNode):alert(t.error)})).catch((function(e){return alert(e)}))}))}))}},[["ng4s","runtime",0]]]);