#!/bin/bash
#
# Time Delta
#
# Runs given arguments and prints the time spent on the execution.
#
# Usage:
#    ./time-delta.sh $ARGUMENTS
#
# Hint:
#    $ARGUMENTS can be any command including it's parameters as you'd type it into your shell 
#
# Examples:
#    ./time-delta.sh nmap -sP 192.168.178.1/24
#    ./time-delta.sh rsync -avzr --stats --progress --ignore-existing /some/local/folder user@192.168.178.12:/some/remote/folder

timeDelta() {
  # save start time
  START=$(date +"%s")

  # ececute all given arguments 
  $*

  # save time after executing
  END=$(date +"%s")

  # calculate time difference
  DELTA=$((END - START))

  printf "_____________________\n"
  printf "\nThe execution took:\n"
  parseSeconds "$DELTA"
  printf "\n_____________________"
}

parseSeconds () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

timeDelta "$*"
