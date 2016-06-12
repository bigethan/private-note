#!/usr/bin/env bash

# put this somewhere in your bash setup
# function your-weird-alias() {
#   ~/path/to/this/file.sh $@
#   # delete the command from history
#   history -d $((HISTCMD-1))
# }

# choose your own logfile
LOGFILE=~/.weirdlog

#to prevent accidental exposure
function rot13() {
  tr a-zA-Z n-za-mN-ZA-M
}

if [ $# -ne 0 ]; then
  NOW=`date "+%s | %Y-%m-%d %H:%M:%S |"`
  LOG=`echo $NOW $@ | rot13`
  echo $LOG >> $LOGFILE
  # to vusually hide what was just weirded
  # still in the scrollback
  clear
else
  cat $LOGFILE | rot13
fi
