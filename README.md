# shell-scripts
Basic scripts I found or wrote to utilize the shell's wonderful capabilities

## Hints
* scripts that use the `beep` command need the pc-speaker to work - in ubuntu that means you have to `sudo modprobe pcspkr` first
* to execute them you may have to make them executable by `sudo chmod +x $FILENAME`
* if you include the functions into your *.bashrc*, *.zshrc*, *.foorc* you can omit the *#!/bin/bash* at the beginning and the call of the functions itself at the end of the scripts
* rename the "main"-functions or alias them to use your own command that you can remember ;-)

## Inventory

### Timer
* Usage `timer $x` (*$x = seconds to count down from*)
* Result: A countdown of the given number of seconds will be executed. When it's finished an alarm sound will be played.

### Weather
* Usage: `weather $x` (*$x = location to show weather forecast for*)
* Result: [wttr.in](http://wttr.in/) will be asked for the weather forecast of the given location. The forecast is printed to the console.

### Time Delta
* Usage: `timeDelta $x` (*$x = any shell command including parameters to measure execution time for*)
* Result: The provided shell command is executed and the time it took is printed to the console.
