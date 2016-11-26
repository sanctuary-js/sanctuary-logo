CONVERT = rsvg-convert
FONT = AvenirNext-Medium.ttf


.PHONY: all
all: sanctuary-logo.png sanctuary-logo.svg

sanctuary-logo.png: scripts/generate-svg $(FONT)
	'$<' 200.0 '$(FONT)' | $(CONVERT) >'$@'

sanctuary-logo.svg: scripts/generate-svg $(FONT)
	'$<' 100.0 '$(FONT)' >'$@'

$(FONT):
	curl --location 'https://github.com/mimetic/fontmetrics/blob/master/fonts/Avenir%20Next%20Medium.ttf?raw=true' >'$@'


.PHONY: setup
setup:
	npm install
