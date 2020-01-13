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
c.colors.completion.category.fg = pyColors["color1"]
c.colors.completion.even.bg = pyColors["color1"]
c.colors.completion.odd.bg = pyColors["color2"]
c.colors.completion.item.selected.fg = WHITE
c.colors.completion.item.selected.bg = pyColors["color4"]

c.colors.completion.item.selected.bg


config.load_autoconfig()

# bindings
config.bind(',v', 'hint links spawn mpv {hint-url}')
config.bind(',o', 'open -t https://outline.com/{hint-url}')
