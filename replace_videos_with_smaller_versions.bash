find . -type f -name '*.mp4' -exec sh -c '
    for file do
        newfile=$(echo "$file" | sed 's/\.mp4/small.mp4/');
        ffmpeg -loglevel warning -i "$file" -preset veryslow -crf 30 "$newfile" && mv -f "$newfile" "$file" || rm -f "$newfile";
    done
' sh {} +
