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
    --with-datetime)
      WITH_DATETIME=true
      ;;
    --help)
      echo "Usage: $0 [--filename filename] [--with-datetime] [--help]"
      echo "Adds the script required to call the spotify script to your conf."
      echo "--filename: Use parameter to specify the name of the file the code should be added to. Default ~/.tmux.conf."
      echo "--with-datetime: Add datetime info to your statusbar. Default false"
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

tmux_code="set-window-option -g status-right '#($CURRENT_DIR/bin/spotify_artist_and_track.applescript)"

if [ "$WITH_DATETIME" = true ]
then
  datetime="%d/%m/%y %H:%M'"
  tmux_code="$tmux_code $datetime"
else
  tmux_code="$tmux_code'"
fi

echo "Adding code to: $FILENAME"
echo "$tmux_code" >> "$FILENAME"

echo "Sourcing $FILENAME"
tmux source-file "$FILENAME"
