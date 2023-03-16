#!/bin/bash

CURRENT_DIR=$(pwd)
DEFAULT_FILENAME="$HOME/.tmux.conf"

while [ "$#" -gt 0 ]
do
  case "$1" in
    --filename)
      shift
      FILENAME="$1"
      ;;
    --help)
      echo "Usage: $0 [--filename filename] [--help]"
      echo "Adds the script required to call the spotify script to your conf."
      echo "By default ~/.tmux.conf is used, use --filename for custom files"
      exit 0
      ;;
    *)
      echo "Error: invalid argument. Use --help for usage information."
      exit 1
      ;;
  esac
  shift
done

if [ -z "$FILENAME" ]
then
  FILENAME="$DEFAULT_FILENAME"
fi

tmux_code="set-window-option -g status-right '\
#($CURRENT_DIR/bin/spotify_artist_and_track.applescript)\
  %d/%m/%y %H:%M\
'"

echo "Adding code to: $FILENAME"
echo "$tmux_code" >> "$FILENAME"

echo "Sourcing $FILENAME"
tmux source-file "$FILENAME"
