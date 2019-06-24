#!/bin/bash
for f in *.{mod,MOD,xm,XM,it,IT,s3m,S3M};
do
	echo "Processing file $f..."
	xmp $f -m -c | ffmpeg -f s16le -i pipe: -b:a 192k $f.mp3
done
