SOURCE:=report.md
TARGET:=report.pdf
all:
	pandoc -s -N --toc  --listings -H listings-setup.tex --template=report.latex -V linkcolor="uclmidgreen" -V --number-section ${SOURCE} -o ${TARGET}
