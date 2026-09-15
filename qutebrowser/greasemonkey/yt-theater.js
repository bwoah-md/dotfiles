// ==UserScript==
// @name         Better Youtube Theatre Mode
// @namespace    http://tampermonkey.net/
// @version      1.8
// @description  Enlarges the media player to fill the entire screen with theatre mode.
// @author       shanish_ @discord
// @match        https://www.youtube.com/*
// @icon         https://www.google.com/s2/favicons?domain=youtube.com
// @grant        none
// @run-at       document-start
// ==/UserScript==

/**
A simple script to fix youtube's CSS to set the containers height to 100vh - navbar height
**/

// Injects CSS into the header of the document.
function addStyle(styleText){
    let s = document.createElement('style')
    s.setAttribute("id", "youtubetheater");
    s.appendChild(document.createTextNode(styleText))
    document.getElementsByTagName('head')[0].appendChild(s)
}

// YouTube is a single page app and may delete the style sheet after it's injected.
// To ensure it stays, this checks every second.
setInterval(loadCss, 1000)

function loadCss() {
    'use strict';
    if(document.getElementById("youtubetheater")){return;}

    addStyle(`

:fullscreen #player-full-bleed-container,:fullscreen #full-bleed-container {
max-height: calc(100vh) !important;
}
:has([is-theater-mode]) #player-full-bleed-container,:has([is-theater-mode]) #full-bleed-container{
    max-height:calc(100vh - 52px)!important;
    height:100vh!important;
}

/* Masthead: hidden off-screen, slides back in only when focused (e.g. via the / shortcut) */
:has([is-theater-mode]) ytd-masthead {
    position: fixed !important;
    top: 0 !important;
    left: 0 !important;
    width: 100% !important;
    z-index: 9999 !important;
    transform: translateY(-100%);
    transition: transform 0.15s ease-out;
}
:has([is-theater-mode]) ytd-masthead:focus-within {
    transform: translateY(0);
}

:has([is-theater-mode]) ytd-page-manager,
:has([is-theater-mode]) #page-manager {
    margin-top: 0 !important;
}
:has([is-theater-mode]) #below,
:has([is-theater-mode]) #secondary,
:has([is-theater-mode]) ytd-comments,
:has([is-theater-mode]) #columns.ytd-watch-flexy {
    display: none !important;
}
:has([is-theater-mode]) ytd-watch-flexy #player-container-outer,
:has([is-theater-mode]) ytd-watch-flexy #player-container-inner,
:has([is-theater-mode]) ytd-watch-flexy #full-bleed-container,
:has([is-theater-mode]) ytd-watch-flexy #player-full-bleed-container {
    height: 100vh !important;
    max-height: 100vh !important;
    width: 100vw !important;
}

   `)
};

// ---- Cap video quality at 1440p (avoids 4K / 1080p Premium bitrate) ----
function selectQuality(){
    const player = document.getElementById('movie_player');
    if(!player) return;
    const settingsButton = player.querySelector('.ytp-settings-button');
    if(!settingsButton) return;

    settingsButton.click(); // opens settings menu

    const menuItems = [...document.querySelectorAll('.ytp-panel-menu .ytp-menuitem')];
    const qualityItem = menuItems.find(item => item.textContent.includes('Quality'));
    if(!qualityItem){ settingsButton.click(); return; } // nothing found, close menu

    qualityItem.click(); // opens quality submenu

    const qualityOptions = [...document.querySelectorAll('.ytp-quality-menu .ytp-menuitem')];
    const target = qualityOptions.find(opt => opt.textContent.includes('1440p'))
                || qualityOptions.find(opt => opt.textContent.includes('1080p') && !opt.textContent.includes('Premium'));

    if(target){
        target.click();
    } else {
        settingsButton.click(); // close without changing anything
    }
}

document.addEventListener('yt-navigate-finish', () => setTimeout(selectQuality, 1500));
window.addEventListener('load', () => setTimeout(selectQuality, 1500));
