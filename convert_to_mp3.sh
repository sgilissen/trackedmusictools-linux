#!/bin/bash
OUTDIR="MP3"
if [ -d "$OUTDIR" ]; then 
	echo "Folder exists. Proceeding..."
else
	echo "Folder does not exist. Creating..."
	mkdir -p "$OUTDIR"
fi
for f in *.{mod,MOD,xm,XM,it,IT,s3m,S3M};
do
	echo "Processing file $f..."
	xmp $f -m -c | ffmpeg -f s16le -i pipe: -b:a 192k $OUTDIR/$f.mp3
done
