default: pdf

pdf: gensvg
	pdflatex -jobname=slides -interaction=nonstopmode '\input{slides.tex}'
	make clean_latex;

handout: gensvg
	pdflatex -jobname=handouts -interaction=nonstopmode '\input{slides.tex}'
	make clean_latex;

clean: clean_latex
	rm imgs/generated/*

clean_latex:
	rm slides*.aux slides*.toc slides*.fls slides*.nav slides*.snm slides*.out slides*.log slides*.toc 2> /dev/null; true
	rm handouts*.aux handouts*.toc handouts*.fls handouts*.nav handouts*.snm handouts*.out handouts*.log handouts*.toc 2> /dev/null; true

rebuild: clean gensvg pdf

gensvg: 
	ruby ./theme/gen.rb
