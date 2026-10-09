## please read if you're replicating my firefox setup...

i use [arkenfox-user.js](https://github.com/arkenfox/user.js/) to setup firefox hardening, so you need to put the `user-overrides.js` file in you'r firefox's profile directory.

on the contrary, if you don't want my opinionated setup (which i encourage you that you shouldn't) and rather read and apply `arkenfox` or [betterfox](https://github.com/yokoffing/BetterFox) yourselves, you can just use [Librewolf](https://librewolf.net) (and actually that's what i have been using too because i absolutely hate the new browser redesign for now).

though again, if you're using my `userChrome.css` or `userContent.css`, you won't see the tab bar (neither horizontal, nor vertical), so i advise you to install the [sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/) extension first... and then proceed to put `userChrome.css` and `userContent.css` in their repective directories...

### firefox theming...

- theming of firefox/librewolf is dont through [pywalfox](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/), so install it too...
- how to theme firefox using noctalia - [noctalia/pywalfox](https://docs.noctalia.dev/noctalia/templates/community/firefox/)

### steps to theme firefox

- download `userChrome.css` and `userContent.css` and remember where you downloaded it
- open firefox
- click on URL bar and go to `about:config`
- set these values
  - `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
  - `browser.tabs.closeWindowWithLastTab` to `false`
  - `browser.compactmode.show` to `true` (optional, i like to use compact mode, so [Customize Toolbar](https://support.mozilla.org/en-US/kb/customize-firefox-controls-buttons-and-toolbars) and set `Density` to `Compact`)
- click on URL bar and go to `about:profiles`
- click on first `Open Directory` option, which will open your `Root Directory`
- create a new folder there named `chrome`
- move `userChrome.css` and `userContent.css` which you downloaded, inside this `chrome` folder
- restart firefox

you won't see your tabs anymore, so you'll have to manage your tabs through sidebery, which imo is one of the best ff extensions for managing tabs :)

### steps to replicate my sidebery setup...

#### sidebery settings > styles editor > sidebar

copy and paste this css there, and you're done :)

```css
/* ═══════════════════════════════════════════════════════
   SIDEBERY SIDEBAR CSS — pywalfox-dynamic edition
   Prereq: Settings → Appearance → Color scheme = "Firefox"
   ═══════════════════════════════════════════════════════ */

/* ── 1. DYNAMIC PALETTE ──
   Everything below tracks the live Pywalfox theme.
   Keep the one-liner #root.root format so the Styles
   editor fields stay in sync with this text. */

/* Selection / overlays */
#root.root {--frame-el-overlay-selected-border: var(--toolbar-fg);}
#root.root {--toolbar-el-overlay-hover-bg: color-mix(in srgb, var(--toolbar-fg) 9%, transparent);}
#root.root {--toolbar-el-overlay-clicked-bg: color-mix(in srgb, var(--toolbar-fg) 14%, transparent);}
#root.root {--toolbar-el-overlay-active-bg: color-mix(in srgb, var(--toolbar-fg) 14%, transparent);}
#root.root {--toolbar-el-overlay-selected-bg: color-mix(in srgb, var(--toolbar-fg) 14%, transparent);}
#root.root {--toolbar-el-overlay-active-border: transparent;}
#root.root {--frame-el-overlay-hover-bg: color-mix(in srgb, var(--frame-fg) 9%, transparent);}
#root.root {--frame-el-overlay-clicked-bg: color-mix(in srgb, var(--frame-fg) 14%, transparent);}
#root.root {--frame-el-overlay-selected-bg: color-mix(in srgb, var(--frame-fg) 14%, transparent);}
#root.root {--toolbar-scrollbar-color: color-mix(in srgb, var(--toolbar-fg) 30%, transparent);}
#root.root {--frame-scrollbar-color: color-mix(in srgb, var(--frame-fg) 30%, transparent);}
#root.root {--popup-scrollbar-color: color-mix(in srgb, var(--popup-fg) 30%, transparent);}

/* Nav bar */
#root.root {--nav-btn-fg: var(--toolbar-fg);}
#root.root {--nav-btn-accent: var(--accent);}
#root.root {--nav-btn-active-shadow: inset 0 0 0 1px color-mix(in srgb, var(--toolbar-fg) 15%, transparent);}

/* Tabs */
#root.root {--tabs-normal-fg: var(--frame-fg);}
#root.root {--tabs-activated-fg: var(--active-el-fg);}
#root.root {--tabs-activated-bg: var(--active-el-bg);}
#root.root {--tabs-activated-shadow: var(--active-el-shadow);}
#root.root {--tabs-progress-bg: var(--accent);}
#root.root {--tabs-notification-badge-count-fg: var(--toolbar-bg);}
#root.root {--tabs-notification-badge-count-bg: var(--toolbar-fg);}
#root.root {--tabs-notification-badge-dot-bg: var(--accent);}

/* Bookmarks */
#root.root {--bookmarks-node-activated-fg: var(--active-el-fg);}
#root.root {--bookmarks-expanded-folder-bg: color-mix(in srgb, var(--frame-fg) 6%, transparent);}
#root.root {--bookmarks-expanded-folder-shadow: inset 0 0 0 1px color-mix(in srgb, var(--frame-fg) 10%, transparent);}

/* Context menu / popups / notifications */
#root.root {--ctx-menu-fg: var(--popup-fg);}
#root.root {--ctx-menu-bg: var(--popup-bg);}
#root.root {--ctx-menu-separator: color-mix(in srgb, var(--popup-fg) 15%, transparent);}
#root.root {--ctx-menu-shadow: var(--popup-shadow);}
#root.root {--notification-fg: var(--popup-fg);}
#root.root {--notification-bg: var(--popup-bg);}
#root.root {--search-shadow: var(--popup-shadow);}

/* Scroll / badges / misc */
#root.root {--scroll-color: var(--accent);}
#root.root {--scroll-progress-bg: color-mix(in srgb, var(--accent) 25%, transparent);}
#root.root {--badge-bg: var(--accent);}
#root.root {--badge-fg: var(--frame-bg);}
#root.root {--badge-urgent-bg: var(--status-err);}
#root.root {--windows-popup-window-border: var(--border);}
#root.root {--active-el-overlay-hover-bg: color-mix(in srgb, var(--active-el-fg) 9%, transparent);}
#root.root {--active-el-overlay-clicked-bg: color-mix(in srgb, var(--active-el-fg) 14%, transparent);}

/* Status */
#root.root {--status-active: var(--toolbar-fg);}
#root.root {--status-ok: var(--toolbar-fg);}
#root.root {--status-notice: var(--s-accent, #00e9fb);}
#root.root {--accent: var(--s-accent, var(--status-active));}

/* ── 2. FLAT CORNERS ── */
#root, #root.root {
  --general-border-radius: 0px;
}
#root *, #root *::before, #root *::after {
  border-radius: 0 !important;
}

/* keep loading indicators round */
#root [class*="load" i],
#root [class*="load" i]::before,
#root [class*="load" i]::after,
#root [class*="spin" i],
#root [class*="spin" i]::before,
#root [class*="spin" i]::after,
#root [class*="progress" i],
#root [class*="progress" i]::before,
#root [class*="progress" i]::after,
#root [data-loading="true"] .fav *,
#root [data-loading="true"] .fav *::before,
#root [data-loading="true"] .fav *::after {
  border-radius: 50% !important;
}

/* ── 3. CONTAINER TABS — boxy frame in the container's colour ── */
#root.root {
  --tabs-color-layer-opacity: 0.06;
  --tabs-activated-color-layer-opacity: 0.12;
}

.Tab .body {
  position: relative;
}
.Tab .ctx {
  position: absolute !important;
  inset: 0 !important;
  width: auto !important;
  height: auto !important;
  box-sizing: border-box !important;
  padding: 1px !important;
  opacity: 0.45 !important;
  pointer-events: none !important;
  z-index: 5 !important;
  -webkit-mask: linear-gradient(#000 0 0) content-box, linear-gradient(#000 0 0);
  -webkit-mask-composite: xor;
  mask: linear-gradient(#000 0 0) content-box exclude, linear-gradient(#000 0 0);
}
.Tab[data-active="true"] .ctx {
  padding: 2px !important;
  opacity: 0.75 !important;
}

/* ── 4. NAV BAR / PINNED TABS FIXES ── */
.NavigationBar {
  box-shadow: none;
}
.NavigationBar,
.NavigationBar.-vert,
.NavigationBar .main-items,
.NavigationBar .nav-item,
.PinnedTabsBar {
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
  outline: none !important;
}
.NavigationBar .nav-item[data-active="true"] {
  background: color-mix(in srgb, var(--toolbar-fg, #fff) 12%, transparent) !important;
}
.NavigationBar.-vert {
  padding: var(--nav-btn-margin) 0 0;
}
#root[data-pinned-tabs-position="left"]:not([data-nav-layout="horizontal"]) .PinnedTabsBar,
#root[data-pinned-tabs-position="right"]:not([data-nav-layout="horizontal"]) .PinnedTabsBar {
  padding: var(--general-margin) 0 calc(var(--tabs-margin) * 2);
}
#root[data-pinned-tabs-position="left"][data-nav-layout="left"][data-drag="true"] .PinnedTabsBar,
#root[data-pinned-tabs-position="right"][data-nav-layout="right"][data-drag="true"] .PinnedTabsBar {
  padding: var(--general-margin) 0 16px;
}

/* full-width pinned tabs — tints now follow the theme instead of #fff2 */
#root.root {--tabs-pinned-height: 32px;}
#root.root {--tabs-pinned-width: 36px;}
#root.root .PinnedTabsBar .tab-wrapper {
  width: auto;
  flex-grow: 1;
}
#root.root .PinnedTabsBar .tab-wrapper .Tab {
  --tabs-activated-shadow: inset 0 0 0 1px color-mix(in srgb, var(--toolbar-fg) 12%, transparent);
  --tabs-activated-bg: color-mix(in srgb, var(--toolbar-fg) 12%, transparent);
  width: 100%;
  min-width: var(--tabs-pinned-width);
}
#root.root .PinnedTabsBar .tab-wrapper .Tab .body {
  --tabs-normal-bg: color-mix(in srgb, var(--toolbar-fg) 6%, transparent);
}
#root.root .PinnedTabsBar .tab-wrapper .Tab[data-discarded="true"] .body {
  --tabs-normal-bg: color-mix(in srgb, var(--toolbar-fg) 2.5%, transparent);
}

/* ── 5. TOPBORDER FALLBACK (keep commented unless userChrome line misaligns) ── */
/* .main-box { border-top: 1px solid color-mix(in srgb, var(--toolbar-fg) 20%, transparent); } */
```
