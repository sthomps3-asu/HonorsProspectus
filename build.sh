#! /bin/bash
if which pdflatex
then
    DOCNAME=HonorsProspectus
    TEXMAINFILE=main.tex
    PASSES=1
    OUTPUT_DIR=output
    mkdir -p ${OUTPUT_DIR}
    for ((i=0; i<${PASSES}; i++))
    do
        pdflatex -halt-on-error -file-line-error -interaction nonstopmode -jobname=${DOCNAME} -output-directory=${OUTPUT_DIR} ${TEXMAINFILE}
        if [ $? ]
        then
            break
        fi
    done
else
    echo "pdflatex compiler not supported on machine. Install pdflatex to build document."
fi