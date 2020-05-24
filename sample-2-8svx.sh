#!/bin/bash
OUTDIR="Converted8SVX"
if [ -d "$OUTDIR" ]; then 
	echo "Folder exists. Proceeding..."
else
	echo "Folder does not exist. Creating..."
	mkdir -p "$OUTDIR"
fi

for f in *.{wav,WAV,mp3,MP3};
do
	echo "Processing file $f..."
	sox --multi-threaded "$f" -D -r16574 -b8 "$OUTDIR/$f".8svx 
done
