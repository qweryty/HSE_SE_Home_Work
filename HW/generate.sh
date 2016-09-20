#!/bin/bash
# Генерирует папку с заданным именем во всех подпапках и создаёт исходник

if [ $# -ne 1 ]; then
	echo "Недостаточно или слишком много параметров."
else
	for i in `find ./* -maxdepth 0 -type d`
	do
		rm -rf "$i/$1"
		mkdir "$i/$1"
		for j in ../tasks/$1/*
		do
			filename=$(basename "$j")
			extension="${filename##*.}"
			filename="${filename%.*}"
			echo -n > "$i/$1/$filename.cpp"
		done
	done
fi
