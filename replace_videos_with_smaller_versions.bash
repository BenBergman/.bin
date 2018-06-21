#!/bin/bash

find . -type f -name '*.mp4' -exec sh -c '
    for file do
        printf "Processing $file   "
        orig_size=$(stat -f%z "$file")
        newfile=$(echo "$file" | sed 's/\.mp4/small.mp4/');
        ffmpeg -loglevel warning -i "$file" -preset veryslow -crf 30 "$newfile" && mv -f "$newfile" "$file" || rm -f "$newfile";
        new_size=$(stat -f%z "$file")
        echo "before: $orig_size  after: $new_size  saved: $(expr $orig_size - $new_size)"
    done
' sh {} +
