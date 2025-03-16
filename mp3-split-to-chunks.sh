#!/bin/bash
# split one mp3 file to many files (chunks) with predefined duration

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg could not be found. Please install ffmpeg to use this script."
    exit
fi

# Check if input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <inputfile.mp3>  <duration(in sec)=600>"
    exit 1
fi

# Check if duration is provided
if [ -z "$2" ]; then
    echo "Default duration is 600 seconds"
    duration=600 # 10 minutes in seconds    
else
    duration=$2
fi

# inputfile=video_240p.mp4.mp3
# outputfile_prefix="$inputfile"
inputfile=$1
outputfile_prefix="$1"

file_duration=$(ffmpeg -i "$inputfile" 2>&1 | grep "Duration" | awk '{print $2}' | tr -d , | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }' | awk -F '.' '{print $1}')
echo "file duration: ${file_duration}"

# Split the file into chunks
for ((i=0; i<file_duration; i+=duration)); do
    start_time=$(printf "%02d:%02d:%02d" $((i/3600)) $(((i/60)%60)) $((i%60)))
    outputfile="${outputfile_prefix}-$(printf "%03d" $((i/duration))).mp3"
    echo "$start_time   -> $outputfile"
    ffmpeg -i "$inputfile" -ss "$start_time" -t $duration -c copy "$outputfile"
done

echo "Splitting complete!"