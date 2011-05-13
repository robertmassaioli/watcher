#!/bin/bash

# This shell script is supposed to keep track of what you have watched already and let you then
# watch whatever you like. It should have the following commands:
#  watcher watched <video> - Set the video to watched
#  watcher watch <video> - Watches the video with your default command
#  watcher count <video> - Displays the number of times the video has been watched

set -e

DEFAULT_PLAYBACK='mplayer'
DEFAULT_SAVE_FILE=".watched_videos"

USAGE="Usage: $0 (watch|watched|count) [video]"

# Functions

function watch_video {
   lines=`grep "^$1|" "$DEFAULT_SAVE_FILE" | wc -l`
   case $lines in
      '0')
         echo "$1|1" >> "$DEFAULT_SAVE_FILE"
         echo "Watched this video 1 time now."
         ;;
      *)
         # note that we have to take into account somebody doing it wrong and eliminate
         # duplicate lines
         count=1 # start at one for the current view
         for next in `grep "^$1|" "$DEFAULT_SAVE_FILE" | cut -d\| -f2`
         do
            count=`expr $next + $count`
         done
         echo "Watched this video $count times now."

         temp=`tempfile`
         grep -v "^$1|" "$DEFAULT_SAVE_FILE" > "$temp" || true # ignore the result of grep
         echo "${1}|${count}" >> "$temp"
         mv "$temp" "$DEFAULT_SAVE_FILE"
         ;;
   esac
}

# check if the default save file even exists, do not create it if it does not, only create it when
# it is actually required

case $1 in
   'watched')
      if [ "x" == "x$2" ]
      then
         # Just print what has been watched in highest order
         sort -r -t "|" -k 2 "$DEFAULT_SAVE_FILE"
      else
         if [ -w "$DEFAULT_SAVE_FILE" ]
         then
            watch_video "$2"
         fi
      fi
      ;;

   'watch')
      if which "$DEFAULT_PLAYBACK"
      then
         # Check if the default playback module even works
         if [ "x" == "x$2" ]
         then
            echo "If you want to watch a video you have to tell us which one."
            echo "$USAGE"
         else
            echo "Starting playback of '$2'."
            if $DEFAULT_PLAYBACK "$2"
            then
               watch_video "$2"
               echo "Finished playback of '$2'."
            else
               echo "There was an error playing the video file. No watch recorded."
            fi
         fi
      else
         echo "We could not find your default player: $DEFAULT_PLAYBACK"
         echo "We cannot play the video until that occurs. You can set the DEFAULT_PLAYBACK"
         echo "environment variable in order to change it."
      fi
      ;;

   'count')
      echo "counting not implemented yet"
      sort -r -t "|" -k 2 "$DEFAULT_SAVE_FILE"
      ;;

   *)
      echo "$USAGE"
      ;;
esac
