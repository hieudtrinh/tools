#!/bin/bash

if [ $# -lt 4 ]; then
        echo "Usage: $0 <youtube's URL> <HH:mm:ss.milisecs from time> <HH:mm:ss.milisecs to time> <output_file_name>"
        echo "e.g.:"
        echo "$0 https://youtu.be/XEFMgap6Ptg 00:33:00 00:35:00 output.mp4"
        exit 1
fi

from_command=${2}
to_command=${3}
echo "processing..."

command="ffmpeg "

# example: ./youtube_dl_v2.sh https://youtu.be/XEFMgap6Ptg 00:33:00 00:35:00 output.mp4

command+="-ss $from_command -to $to_command -i "
command+="\"\$(youtube-dl -f best --get-url '$1')\" "
command+="-c:v copy -c:a copy $4"
echo "downloading with the following command:"
echo "$command"
eval $command
