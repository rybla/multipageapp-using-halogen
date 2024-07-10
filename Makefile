.PHONY: all

%.page.js:
	pnpm spago run --main App.Static.GenerateHtmlFile -- $@ ./docs
	pnpm esbuild $@ --bundle --minify --outfile=./docs/$@

serve: $(wildcard *.page.js)
	pnpm esbuild Root.page.js --bundle --minify --outfile=./docs/Root.page.js --servedir=./docs --watch
