#!/usr/bin/env bash
# otimiza.sh
#
# Otimiza os documentos em PDF, reduzindo a qualidade das imagens com
# o GhostScript
# 
# Caio Cesar, 2018
# Contribuiu Phantom X (indicação de flags do GhostScript)
#
for pdf in `echo *pdf | sed 's/\_otimizado//g' | tr " " "\n" | uniq | xargs`
do gs \
	-sDEVICE=pdfwrite \
	-dCompatibilityLevel=1.4 \
	-dPDFSETTINGS=/prepress \
	-dNOPAUSE \
	-dBATCH \
	-dQUIET \
	-sProcessColorModel=DeviceCMYK \
	-sOutputFile="${pdf%.pdf}_otimizado.pdf" $pdf
done
