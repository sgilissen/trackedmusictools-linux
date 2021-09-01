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
	xmp $f -m -c | ffmpeg -f s16le -i pipe: -c:a flac -af loudnorm=I=-16:dual_mono=true:TP=-1.5:LRA=11:print_format=summary $OUTDIR/$f.flac
done
