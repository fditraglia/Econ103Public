for filename in *.tex
do 
    pdflatex $filename
    pdflatex $filename
    ThisJob=${filename/.tex/_handout}
    pdflatex -jobname=$ThisJob "\def\ishandout{1}\input{$filename}"
    pdflatex -jobname=$ThisJob "\def\ishandout{1}\input{$filename}"
done
rm *.aux
rm *.log
rm *.nav
rm *.toc
rm *.out
rm *.snm
rm *.vrb
