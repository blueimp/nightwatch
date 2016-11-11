#!/bin/sh
# shellcheck shell=dash

#
# Transcodes the given FLV files to QuickTime compatible MP4 videos.
# Requires ffmpeg.
#
# Usage: ./flv2mp4.sh file1.flv [file2.flv] [...]
#

for file; do
  name=${file%.flv}
  [ "$name" = "$file" ] && break
  [ -f "$name.mp4" ] && continue
  ffmpeg -i "$file" -pix_fmt yuv420p -loglevel error "$name.mp4"
done
