/*** [SECTION: PERSONAL OVERRIDES] ***/
user_pref("identity.fxaccounts.enabled", true);
user_pref("signon.rememberSignons", false);
user_pref("extensions.update.enabled", true);
user_pref("middlemouse.paste", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("network.dns.disableIPv6", false);
user_pref("webgl.disabled", false);

/*** [SECTION: SESSION & HISTORY] ***/
user_pref("browser.startup.page", 3);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.newtabpage.enabled", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
user_pref("browser.search.separatePrivateDefault", false);
user_pref("browser.search.separatePrivateDefault.ui.enabled", false);

/*** [SECTION: DNS OVER HTTPS] ***/
user_pref("network.trr.mode", 3);
user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");
user_pref("network.trr.custom_uri", "https://mozilla.cloudflare-dns.com/dns-query");
