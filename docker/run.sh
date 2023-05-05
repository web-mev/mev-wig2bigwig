#!/bin/bash

INPUT_FILE=$1
ORGANISM=$2

case $ORGANISM in

    "Human(Ensembl)")
        CHR_SZ="/opt/software/resources/grch38_chr_sizes.txt"
        ;;
    "Mouse(Ensembl)")
        CHR_SZ="/opt/software/resources/grcm39_chr_sizes.txt"
        ;;
    "Human(UCSC)")
        CHR_SZ="/opt/software/resources/hg38_chr_sizes.txt"
        ;;
    "Mouse(UCSC)")
        CHR_SZ="/opt/software/resources/mm39_chr_sizes.txt"
        ;;
    *)
        echo "Not a valid choice"
        exit 1;
esac


OUTPUT="${INPUT_FILE%.*}"
/opt/software/wigToBigWig $INPUT_FILE $CHR_SZ $OUTPUT.bw

if [ $? == 0 ]
then
    BN=$(dirname $INPUT_FILE)
    echo "{\"bw_file\": \"$OUTPUT.bw\"}" > $BN/outputs.json
else
    exit 1
fi
