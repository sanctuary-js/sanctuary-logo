CONVERT = rsvg-convert
FONT = AvenirNext-Medium.ttf
XYZ = node_modules/.bin/xyz --repo git@github.com:sanctuary-js/sanctuary-logo.git --script scripts/prepublish


.PHONY: all
all: LICENSE sanctuary-favicon.png sanctuary-logo.png sanctuary-logo.svg sanctuary-mask-icon.svg

.PHONY: LICENSE
LICENSE:
	cp -- '$@' '$@.orig'
	sed 's/Copyright (c) .* Sanctuary/Copyright (c) $(shell git log --date=short --pretty=format:%ad | sort -r | head -n 1 | cut -d - -f 1) Sanctuary/' '$@.orig' >'$@'
	rm -- '$@.orig'

sanctuary-favicon.png: scripts/generate-svg $(FONT)
	'$<' '#080' '$(FONT)' 32 | $(CONVERT) >'$@'

sanctuary-logo.png: scripts/generate-svg $(FONT)
	'$<' '#080' '$(FONT)' 200 | $(CONVERT) >'$@'

sanctuary-logo.svg: scripts/generate-svg $(FONT)
	'$<' '#080' '$(FONT)' 100 >'$@'

sanctuary-mask-icon.svg: scripts/generate-svg $(FONT)
	'$<' '#000' '$(FONT)' 16 viewBox="0 0 16 16" >'$@'

$(FONT):
	curl --location 'https://github.com/mimetic/fontmetrics/blob/master/fonts/Avenir%20Next%20Medium.ttf?raw=true' >'$@'


.PHONY: release-major release-minor release-patch
release-major release-minor release-patch:
	@$(XYZ) --increment $(@:release-%=%)


.PHONY: setup
setup:
	npm install
