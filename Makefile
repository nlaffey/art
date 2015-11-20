css/critical.css:
	phantomjs node_modules/penthouse/penthouse.js \
		http://localhost:1314 \
		css/main.css \
	> css/critical.css
	phantomjs node_modules/penthouse/penthouse.js \
		http://localhost:1314 \
		mdl/mdl-theme.css \
	>> css/critical.css
	./node_modules/clean-css/bin/cleancss < css/critical.css | sponge css/critical.css

target = staging

build: css/critical.css
	npm run build
	sassc -lm sass/main.scss css/main.css
	scp index.html bundle.js $(target):/var/www/art/
	scp css/main.css css/critical.css $(target):/var/www/art/css/