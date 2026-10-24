#!/bin/sh
# Собирает site/index.html для GitHub Pages из index.html (тот же код, что в артефакте) + шапка для «экрана Домой».
cd "$(dirname "$0")"
{
cat <<'HEAD'
<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="apple-mobile-web-app-title" content="Футбол">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="mobile-web-app-capable" content="yes">
<meta name="theme-color" content="#EEF2EE">
<link rel="apple-touch-icon" href="icon-180.png">
<link rel="icon" href="icon-180.png">
<link rel="manifest" href="manifest.json">
<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>
HEAD
cat index.html
printf '\n</html>\n'
} > site/index.html
cat > site/manifest.json <<'JSON'
{"name":"Футбол трёх команд","short_name":"Футбол","start_url":".","display":"standalone","background_color":"#EEF2EE","theme_color":"#EEF2EE","icons":[{"src":"icon-180.png","sizes":"180x180","type":"image/png"},{"src":"icon-512.png","sizes":"512x512","type":"image/png"}]}
JSON
