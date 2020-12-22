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

### Speak Time
* Dependencies: `libttspico-utils` (*includes pico2wave for speech synthesis*)
* Usage:
  - Add `@hourly /home/prometheus/shellscripts/speak-time.sh >/dev/null 2>&1` to your crontab (*edit it with* `crontab -e`)
  - Add `XDG_RUNTIME_DIR=/run/user/1000` to your crontab with __your user ID__ (*get your user id with* `id` *and substitute the '1000' with it*)
* Result: The hour of the current time is spoken every hour

### My Public IP
* Usage:
  - rename the file and remove the `.py` file extension
  - make the file executable (by using `chmod +x my-public-ip`)
  - get your public ip's by running `./my-public-ip`
* Result: Your public ipv4 and ipv6 are printed to STDOUT

### Backup Signal Desktop
Since Signal Desktop does not provide an export I created this script for archiving your Signal messages. 
* Result: Backup of your Signal database as `sqlite` and `csv`
* Hint: Only the messages synchronized with your desktop client can be exported
