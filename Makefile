%.md: %.q 
	qnote $< | sed 's/q)//' | tail +4 > $@
watch:
	fswatch -o README.q| xargs -n1 -I{} make README.md 
