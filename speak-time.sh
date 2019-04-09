#!/bin/bash
#
# SPEAK TIME
#
# Inspired by the OS X feature that speaks the time every hour

hour() {
  echo `date +%H`
}

say_pico() {
  pico2wave -w tmp.wav "$1"
  play tmp.wav treble 24 gain -10
  sleep 2
  rm -rf tmp.wav
}

say_pico "It is now `hour` o'clock"
