%.md: %.q 
	qnote $< | sed 's/q)//' | tail +4 |tr -d '\r' > $@
watch:
	fswatch *.q|xargs -n1 basename|sed -u 's/.q/.md/'|xargs -n1 make
