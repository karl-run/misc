#!/bin/bash

INTERNAL="eDP-1-1"
EXT1="DP-1-8"
EXT2="DP-1-8-1"

function usage() {
  echo "Usage:"
  echo "scr --inton"
  echo "scr --intoff"
  echo "scr --dpon"
  echo "scr --dpoff"
}

while [ "$1" != "" ]; do
  PARAM=$(echo $1 | awk -F= '{print $1}')
  VALUE=$(echo $1 | awk -F= '{print $2}')
  case $PARAM in
  --inton)
    echo "Enabling internal display"
    xrandr --output $INTERNAL --auto
    exit
    ;;
  --intoff)
    echo "Disabling internal display"
    xrandr --output $INTERNAL --off
    exit
    ;;
  --dpon)
    echo "Enabling DP display"
    xrandr --output $EXT1 --auto
    exit
    ;;
  --dpoff)
    echo "Disabling DP display"
    xrandr --output $EXT1 --off
    exit
    ;;
  --help)
    usage
    exit
    ;;
  *)
    echo "ERROR: unknown parameter \"$PARAM\""
    usage
    exit 1
    ;;
  esac
  shift
done

usage
