TARGET = handbook
DEPS = handbook.tex introduction.tex presentation.tex finalreport.tex allocation.tex progress.tex assessment.tex

all: $(TARGET).ps $(TARGET).pdf

%.dvi : %.tex $(DEPS)
	@for X in 1 2 3 ; do \
        ( echo "---------------- Latex ($$X) ----------------" && latex $<) \
	done

%.pdf : %.dvi
	@echo "---------------- dvipdf ----------------" && dvipdfm -p a4 $<

%.ps : %.dvi
	@echo "---------------- dvips ----------------" && dvips -t a4 -f < $< > $@

clean:
	rm *.bbl *.aux *.dvi *.log *.ps *.pdf *~ *.blg *.bak
