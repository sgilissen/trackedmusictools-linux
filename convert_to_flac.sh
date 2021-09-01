#!/bin/bash
OUTDIR="FLAC"
if [ -d "$OUTDIR" ]; then 
	echo "Folder exists. Proceeding..."
else
	echo "Folder does not exist. Creating..."
	mkdir -p "$OUTDIR"
fi
for f in *.{mod,MOD,xm,XM,it,IT,s3m,S3M};
do
	echo "Processing file $f..."
	xmp $f -m -c | ffmpeg -f s16le -i pipe: -c:a flac $OUTDIR/$f.flac
done
