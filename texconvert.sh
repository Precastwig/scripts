latexmk -pdf $1
pdf=".pdf"
tex=".tex"
if [ -f ${1%$tex}$pdf ]; then
	exec evince ${1%$tex}$pdf &
else
    echo "Compilation error"
fi