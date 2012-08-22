# Variables

filename=modelo-dissertacao
ERROR_MSG="a problem occurred. please check 'output.log' for more info"

all: $(filename).tex references.bib
	@echo -n "  COMPILING\t"
	@pdflatex -halt-on-error $(filename).tex 2>&1 > output.log || { echo "#1 - "$(ERROR_MSG); exit 1; } 
	@bibtex $(filename) 2>&1 >> output.log || { echo "#2 - "$(ERROR_MSG) && cd .. && exit 1; }
	@makeglossaries $(filename) 2>&1 >> output.log || { echo "#2 - "$(ERROR_MSG) && cd .. && exit 1; }
	@makeindex  -s "modelo-dissertacao.ist" -t "modelo-dissertacao.alg" -o "modelo-dissertacao.acr" "modelo-dissertacao.acn" 2>> output.log >>output.log || { echo "#3 - "$(ERROR_MSG) && cd .. && exit 1; }
	@pdflatex -halt-on-error $(filename).tex 2>&1 > output.log || { echo "#1 - "$(ERROR_MSG); exit 1; }
	@pdflatex -halt-on-error $(filename).tex 2>&1 > output.log || { echo "#1 - "$(ERROR_MSG); exit 1; }
	@echo "OK"

clean:
	@echo -n "  CLEAN\t"
	@rm -f *.out *.aux *.alg *.acr *.dvi *.gls *.log *.bbl *.blg *.ntn *.not *.lof *.lot *.toc *.loa *.lsg *.nlo *.nls *.ilg *.ind *.ist *.glg *.glo *.xdy *.acn *~ output.log
	@rm -f $(filename).pdf 
	@echo "OK"
