%.md: %.q
	qnote $<|sed 's/q)~~~q/~~~q\nq)/'|sed 's/q)~~~/~~~\n/'|tail +4|tr -d '\r'|sed 's/^q)$$//'|sed 's|q)/|/|'|sed '/qnote.q/d' > $@
watch:
	fswatch *.q|xargs -n1 basename|sed -u 's/.q/.md/'|xargs -n1 make

