#!/usr/bin/env bash

case "$(uname -s)" in
  Linux)
    uptime | perl -lne 's/\s+//g; printf "LA:%s\n",$1 if /averages?:(.*)/'
    ;;
  Darwin)
    uptime | perl -lne 's/\s{2,}//g; s/:\s/:/; s/\s/,/g; printf "LA:%s\n",$1 if /averages:\s?(.*)/'
    ;;
  *)
    echo "NaN"
    ;;
esac
