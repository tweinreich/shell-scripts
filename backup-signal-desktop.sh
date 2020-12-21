#!/bin/bash

# Credits
#
# Useful information as a base for this script was found here:
# - https://unix.stackexchange.com/a/505009
# - https://www.reddit.com/r/signal/comments/buoq6r/can_signal_desktop_be_backed_up/epggq9o#t1_epggq9o
#
# Usage
#
# MacOS
# - install jq: brew install jq
# - install sqlcipher: brew install sqlcipher
#
# Linux
# - install jq and sqlcipher with your favorite packaging tool
# - change the path config below
#
# When you want to open the CSV remember setting the delimiter to '|'

# MacOS Config
db_path="$(echo $HOME)/Library/Application Support/Signal/sql/db.sqlite"
config_path="$(echo $HOME)/Library/Application Support/Signal/config.json"

# Linux Config
# db_path="$(echo $HOME)/.config/Signal/sql/db.sqlite"
# config_path="$(echo $HOME)/.config/Signal/config.json"

# Obtain key
key=$(jq -r '."key"' "$config_path")

# Copy database to local folder
cp "$db_path" ./

# Extract Messages and write to backup file
sqlcipher -header -list "$db_path" "PRAGMA key = \"x'"$key"'\";select * from messages order by conversationId, sent_at;" > "./backup.csv";
