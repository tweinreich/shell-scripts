#!/bin/bash
#
#TIMER (e.g. for boiling eggs)
#
#USAGE: 
# ./timer.sh 10 (counts down 10 seconds and plays alarm sound)
#
#HINT: You can also includ these functions in your .bashrc to make the "timer" command available
#      on all your shell sessions without the need to call the shellscript itself.

timer() {
        echo "Timer set to $1 seconds..."
        tmp=$1
        while [ "$tmp" -gt 0 ]
                do      
                        echo "$tmp seconds remaining..."
                        sleep 1
                        tmp=`expr $tmp - 1`
                done
        if [ "$tmp"=0 ]
                then alarm
        fi      
}

alarm() {
for n in 1 2 3; do
    for f in 1 2 1 2 1 2 1 2 1 2 ;    
        do beep -f ${f}000 -l 20
    done
done
}

timer "$1"
