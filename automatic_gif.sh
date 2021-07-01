#!/bin/bash


count=`ls -1 *.mp4 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	mkdir frames
	for i in `ls *.mp4`; do
		name=${i:0:-4}
		ffmpeg -loglevel error -i $i -r 5 ./frames/$name-%03d.jpg && convert -delay 20 -loop 0 frames/$name*.jpg ./$name.gif
	done
	rm -rf frames
	echo Todos os ficheiros foram convertidos
else
	echo Não existe nenhum ficheiro para converter
fi
