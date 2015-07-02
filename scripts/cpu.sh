#!/usr/bin/env bash

arch="$(uname -s)"

if [[ "$arch" = "Linux" ]]; then
  uptime | perl -lne 's/\s+//g; printf "Avg:%s\n",$1 if /averages?:(.*)/'
elif [[ "$arch" = "Darwin" ]]; then
  uptime | perl -lne 's/\s{2,}//g; s/:\s/:/; s/\s/,/g; printf "Avg:%s\n",$1 if /averages:\s?(.*)/'
else
  echo "Unkown platform"
fi
