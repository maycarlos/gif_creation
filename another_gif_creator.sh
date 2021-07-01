#!/bin/bash

count=`ls -1 *.mp4 2>/dev/null | wc -l`

if [ $count != 0 ]; then
	for i in `ls *.mp4`; do
		ffmpeg -loglevel error -i "$i" ./${i:0:-4}.gif
	done
	echo The deed is done
else
	echo Não tem nada aqui para converter
fi
