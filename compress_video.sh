#!/bin/bash

while getopts ":i:o:" opt; do
  case $opt in
    i) INPUT="$OPTARG"
    ;;
    o) OUTPUT="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

ffmpeg  -i "$INPUT" \
        -vf scale=1920:1080 \
        -c:v libx264 \
        -preset medium \
        -crf 23 \
        -c:a aac \
        -b:a 256k \
        "$OUTPUT"
