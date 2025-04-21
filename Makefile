.PHONY render clean

# render your website, make sure .nojekyll file exists
render:
	quarto render
	touch docs/.nojekyll

clean:
	rm -rf _site
	rm -rf docs