#!/bin/bash

uptime | perl -lne 's/\s+//g; printf "Avg:%s\n",$1 if /averages?:(.*)/'

