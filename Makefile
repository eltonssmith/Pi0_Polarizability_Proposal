TEX_FILES = $(wildcard *.tex)
all: Pi0Polarizability.pdf
.aux_for_bibtex: $(TEX_FILES)
	pdflatex Pi0Polarizability
	date > $@
Pi0Polarizability.bbl: pi0pol.bib .aux_for_bibtex
	bibtex Pi0Polarizability
Pi0Polarizability.pdf: Pi0Polarizability.bbl
	@echo --------first pdflatex run--------------
	pdflatex Pi0Polarizability
	@echo --------second pdflatex run--------------
	pdflatex Pi0Polarizability
test:
	@echo TEX_FILES = $(TEX_FILES)
