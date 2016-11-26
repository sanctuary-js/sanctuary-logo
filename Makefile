CONVERT = rsvg-convert
FONT = AvenirNext-Medium.ttf


.PHONY: all
all: sanctuary-favicon.png sanctuary-logo.png sanctuary-logo.svg

sanctuary-favicon.png: scripts/generate-svg $(FONT)
	'$<' 32.0 '$(FONT)' | $(CONVERT) >'$@'

sanctuary-logo.png: scripts/generate-svg $(FONT)
	'$<' 200.0 '$(FONT)' | $(CONVERT) >'$@'

sanctuary-logo.svg: scripts/generate-svg $(FONT)
	'$<' 100.0 '$(FONT)' >'$@'

$(FONT):
	curl --location 'https://github.com/akella/fonts/raw/master/Avenir%20Next/$(FONT)' >'$@'


.PHONY: setup
setup:
	npm install
