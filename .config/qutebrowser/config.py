#!/usr/bin/env python

# imports
import yaml

# constants
WHITE = "#FFFFFF"

# load pywal theme and set
pywalPath = "/home/jesse/.cache/wal/colors.yml"
with open(pywalPath) as stream:
    pywalData = yaml.load(stream) # extract color data

pyColors = pywalData["colors"]

c.colors.completion.category.bg = pyColors["color0"]
c.colors.completion.category.fg = WHITE
c.colors.completion.category.border.bottom = pyColors["color0"]
c.colors.completion.category.fg = pyColors["color1"]
c.colors.completion.even.bg = pyColors["color1"]
c.colors.completion.odd.bg = pyColors["color2"]

c.colors.completion.item.selected.fg = WHITE
c.colors.completion.item.selected.bg = pyColors["color4"]
c.colors.completion.item.selected.border.top = pyColors["color4"]
c.colors.completion.item.selected.border.bottom = pyColors["color4"]

c.colors.statusbar.url.error.fg = pyColors["color2"]
c.colors.statusbar.url.success.https.fg = pyColors["color2"]
c.colors.statusbar.url.success.http.fg = pyColors["color2"]
c.colors.statusbar.url.warn.fg = pyColors["color2"]
c.colors.statusbar.url.hover.fg = pyColors["color2"]

c.colors.hints.bg = pyColors["color1"]
c.colors.hints.fg = WHITE
c.colors.hints.match.fg = pyColors["color1"]

c.colors.completion.match.fg = pyColors["color6"]

c.colors.downloads.start.bg = pyColors["color1"]
c.colors.downloads.start.fg = WHITE
c.colors.downloads.stop.bg = pyColors["color2"]
c.colors.downloads.stop.fg = WHITE

c.colors.messages.info.bg = pyColors["color1"]
c.colors.messages.info.fg = WHITE
c.colors.messages.error.bg = pyColors["color1"]
c.colors.messages.error.fg = WHITE
c.colors.messages.warning.bg = pyColors["color1"]
c.colors.messages.warning.fg = WHITE

config.load_autoconfig()

# bindings
config.bind(',v', 'hint links spawn mpv {hint-url}')
config.bind(',o', 'open -t https://outline.com/{url}')
