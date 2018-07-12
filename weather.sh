#!/bin/bash
#
#WEATHER (retrieve weather for given city)
#
#USAGE: 
# ./weather.sh nuremberg (retrieves weather forecast for nuremberg)
#
#HINT: You can also includ these functions in your .bashrc to make the "weather" command available
#      on all your shell sessions without the need to call the shellscript itself.

weather() {
	curl "wttr.in/$1"
}

weather "$1"
