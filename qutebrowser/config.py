# pylint: disable=C0111

c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103


# =============================================================================
# Noctalia Theming
# =============================================================================

config.load_autoconfig(True)
config.source('noctalia/colors.py')
config.new_instance_open_target = 'tab-silent'


# =============================================================================
# General Browser Behavior
# Session persistence and built-in PDF handling
# =============================================================================

c.auto_save.session = True  # Save tabs on quit/restart
c.content.pdfjs = False  # Use pdf.js for PDF rendering


# =============================================================================
# Tab Appearance, Layout, and Visibility
# =============================================================================

c.tabs.title.format = "{audio}{current_title}"

c.tabs.padding = {
    'top': 5,
    'bottom': 5,
    'left': 9,
    'right': 9,
}

c.tabs.indicator.width = 0  # 0 = no tab indicators
c.tabs.width = '10%'
c.tabs.position = 'top'
c.tabs.title.alignment = 'left'
c.tabs.show = 'multiple'


# =============================================================================
# Scrolling & Completion
# =============================================================================

c.scrolling.smooth = True
c.completion.shrink = True  # Shrink completion menu to fit content


# =============================================================================
# Fonts
# Default UI and webpage font configuration
# =============================================================================

c.fonts.default_family = []
c.fonts.default_size = '10pt'
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13

c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'


# =============================================================================
# Window Title
# =============================================================================

c.window.title_format = '{perc}{current_title}'


# =============================================================================
# Statusbar
# =============================================================================

c.statusbar.show = 'in-mode'


# =============================================================================
# Search & Completion
# Search engine and completion menu configuration
# =============================================================================

c.url.searchengines = {
    'DEFAULT': 'https://start.duckduckgo.com/?q={}',  # Either:'https://search.brave.com/search?q={}' or: 'https://start.duckduckgo.com/?q={}'
}

c.completion.open_categories = [
    'searchengines',
    'quickmarks',
    'bookmarks',
    'history',
    'filesystem',
]


# =============================================================================
# Keybindings
# Navigation, tabs, scrolling, clipboard, media, and utility shortcuts
# =============================================================================

config.bind('=', 'cmd-set-text -s :open')

# config.bind('h', 'history')  # Just use `Sh`

config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')

# config.bind('T', 'hint links tab')

config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')

config.bind(',qm', 'macro-record')

config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gm', 'tab-move')

config.bind(
    'td',
    'config-cycle colors.webpage.darkmode.enabled true false',
)

config.bind('q', 'tab-focus last')  # Go to previously-visited tab
config.bind('a', 'mode-enter passthrough')  # Enter passthrough mode

config.bind('xx', 'tab-close')

config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')

# First / last tab (matches map g1 firstTab / map g0 lastTab)
config.bind('g1', 'tab-focus 1')
config.bind('g0', 'tab-focus -1')

config.bind(
    ',bw',
    'config-cycle content.blocking.enabled true false',
)  # Toggle ad blocking

config.bind('X', 'undo')  # Undo closed tab

# Full-page scroll moved to Ctrl+D / Ctrl+U
# (taking over what Ctrl+F / Ctrl+B do by default)
config.bind('<Ctrl-d>', 'scroll-page 0 1')
config.bind('<Ctrl-u>', 'scroll-page 0 -1')

# Half-page scroll moved to plain d / u
# (taking over what Ctrl+D / Ctrl+U do by default)
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')

config.bind(
    '<Ctrl-b>',
    'open -t https://app.raindrop.io/my/0',
)  # Open Raindrop

config.bind(
    '<Ctrl-Shift-d>',
    'open -t https://app.raindrop.io/add?link={url}&title={title}',
)  # Add current page to Raindrop

config.bind('zo', 'tab-only')  # Close all other tabs
config.bind('ct', 'tab-clone')  # Duplicate current tab

config.bind('yf', 'hint links yank')

# Move tab left/right
config.bind('<', 'tab-move -')
config.bind('>', 'tab-move +')

config.bind('W', 'tab-give')  # Move tab to a new window

config.bind(
    '<Alt-f>',
    'hint links tab-bg --rapid',
)  # Rapid-hint: open each picked link in a background tab, keep hinting


# =============================================================================
# Dark Mode & Webpage Color Scheme
# Webpage dark mode is disabled by default and can be toggled with `td`
# =============================================================================

c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.preferred_color_scheme = 'auto'

config.set(
    'colors.webpage.darkmode.enabled',
    False,
    'file://*',
)


# =============================================================================
# Privacy & Content Settings
# WebGL, canvas, geolocation, WebRTC, and cookie behavior
# =============================================================================

config.set('content.webgl', False, '*')
config.set('content.canvas_reading', False)
config.set('content.geolocation', False)

config.set(
    'content.webrtc_ip_handling_policy',
    'default-public-interface-only',
)

config.set(
    'content.cookies.accept',
    'no-3rdparty',
)

config.set(
    'content.cookies.store',
    True,
)


# =============================================================================
# Ad Blocking
# Filter lists and blocking behavior
# =============================================================================

c.content.blocking.enabled = True
c.content.blocking.method = 'both'

c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://gitlab.com/hagezi/mirror/-/raw/main/dns-blocklists/adblock/ultimate.txt',
    'https://raw.githubusercontent.com/DandelionSprout/adfilt/refs/heads/master/LegitimateURLShortener.txt',
    'https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt',

    # uBlock Origin's own default lists
    # 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt',       # malware/scam domains
    # 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt',      # uBO's core custom rules
    # 'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt',       # extra tracking, complements EasyPrivacy

    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt',  # Site-breakage fixes — read below, this one matters
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt',  # Cookie banners, newsletter popups, social widgets
]


# =============================================================================
# Ad Blocking Whitelist
# =============================================================================

c.content.blocking.whitelist = [
    'https://app.raindrop.io/*',
]


# =============================================================================
# User Agent
# Browser identity presented to websites
# =============================================================================

config.set(
    'content.headers.user_agent',
    'Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0',
)


# =============================================================================
# Custom Stylesheets
# Optional webpage-specific CSS modifications
# =============================================================================

# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]

c.content.user_stylesheets = [
    '~/.config/qutebrowser/styles/hide-scrollbars.css',
]


# =============================================================================
# Media Playback
# Open media directly in mpv
# =============================================================================

config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')


# =============================================================================
# Qt / Wayland
# Prevent QtWebEngine from dropping frames under Wayland
# =============================================================================

c.qt.args = [
    'disable-gpu-compositing',
    'enable-gpu-rasterization',
]


# =============================================================================
# External Tools & Startpage
# Editor integration and custom start/new-tab page
# =============================================================================

# Open config-edit in Helix
c.editor.command = [
    'zeditor',
    '--wait',
    '{file}',
]

# Custom start page / new tab page
c.url.start_pages = 'file:///home/icy/.config/qutebrowser/startpage/index.html'
c.url.default_page = 'file:///home/icy/.config/qutebrowser/startpage/index.html'


# =============================================================================
# Window Transparency
# Real window transparency, for the transparent startpage background to show through
# =============================================================================

c.window.transparent = True

# c.colors.webpage.bg = 'transparent'
