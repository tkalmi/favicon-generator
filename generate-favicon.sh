#!/usr/bin/env bash
usage() { echo "Usage: $0 -i ROOT_IMG_NAME [-o OUTPUT_DIR]" 1>&2; exit 1; }

OUTDIR=\.\/

while getopts "i:o:" opt; do
    case $opt in
        i) ORIGIN_IMAGE=$OPTARG;;
        o) OUTDIR=$OPTARG;;
        h | *) # Display help.
            usage
            exit 0
            ;;
    esac
done

echo ${OUTDIR}

# Create OUTDIR if it doesn't exist yet
if [ -d OUTDIR ]
    then
        echo "Directory ${OUTDIR} exists"
    else
        `mkdir ${OUTDIR}`
        echo "Directory ${OUTDIR} created"
fi


for size in 32 120 128 144 152 180 192 196 270 512; do
    file="favicon-${size}.png"
    convert ${ORIGIN_IMAGE} -resize ${size}x${size} ${OUTDIR}/${file}
    imagemin --plugin=pngquant --out-dir=${OUTDIR} ${OUTDIR}/${file}
done;

for size in 120 152 167 180; do
    file="apple-touch-icon-${size}.png"
    convert ${ORIGIN_IMAGE} -resize ${size}x${size} ${OUTDIR}/${file}
    imagemin --plugin=pngquant --out-dir=${OUTDIR} ${OUTDIR}/${file}
done;

sed "s/{OUTDIR}/${OUTDIR}/g" favicon-template.html > ${OUTDIR}/favicon.html
sed "s/{OUTDIR}/${OUTDIR}/g" manifest-template.json > ${OUTDIR}/manifest.json