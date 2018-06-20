for file in $(ls *.mp4); do
    newfile=$(echo $file | sed 's/\.mp4/small.mp4/');
    ffmpeg -i $file -preset veryslow -crf 30 $newfile && mv -f $newfile $file || rm -f $newfile;
done
