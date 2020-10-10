#!/bin/bash

#
# Download and extract the audio from a Youtube video.
#
# By default this script embeds the default thubmnail of the video to the
# downloaded audio. You can get the thumbnail separately from
# "https://img.youtube.com/vi/$vid/hqdefault.jpg" where $vid is the video ID.
#

# First check if "youtube-dl" is available in the OS.
if [[ ! `which youtube-dl` ]]; then
    echo "Please download youtube-dl before executing this script."
    exit
fi

#
# Print usage information and exit.
#
usage() {
    echo "Usage: $0 <args>"
    echo
    echo "  @first_arg                 - url of the Youtube video"
    echo "  @second_arg (optional)     - audio format. By default it is mp3."
    echo "  @third_arg  (optional)     - audito quality. By default it is 0."
    echo "  -h or --hellp   - Print the usage."
    echo
    echo -n "For more information about the available audio format and audio quality, "
    echo "see \"youtube-dl -h\""
}

if [[ $1 == "-h" || $1 == "--help" ]]; then
    usage
    exit
fi

QUALIFTY="--audio-quality "
FORMAT="mp3"

# User-selected audio format.
if [[ $# -ge 2 ]]; then
    format=$2
    echo "format: $format"
fi

# User-selected audio quality.
if [[ $# == 3 ]]; then
    quality="$quality $3"
else
    quality="$quality 0"
fi


# command
cmd="youtube-dl -x --extract-audio
                   --audio-format "$FORMAT"
                   "$QUALIFTY"
                   --embed-thumbnail
                   $1"
echo $cmd
$cmd

