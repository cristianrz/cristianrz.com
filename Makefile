#!/bin/sh

all: index.html

index.html: src/index.md
	echo > index.tmp
	echo '<!DOCTYPE html>' >> index.tmp
	echo '<html>'>> index.tmp
	echo '<head>'>> index.tmp
	echo '<meta charset="UTF-8">'>> index.tmp
	echo "<title>Cristian Ariza</title>">> index.tmp
	echo '<link rel="stylesheet" href="styles.css">'>> index.tmp
	echo '</head>'>> index.tmp
	echo '<body>'>> index.tmp
	markdown src/index.md >> index.tmp
	echo '</body>'>> index.tmp
	echo '</html>'>> index.tmp
	cp index.tmp index.html
	rm index.tmp

clean:
	rm -f index.html
