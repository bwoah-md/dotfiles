// ==UserScript==
// @name         Hide Brave Search elements
// @match        https://search.brave.com/*
// @grant        GM_addStyle
// ==/UserScript==

GM_addStyle(`
  .download-cta { display: none !important; }
  footer { display: none !important; }
`);
