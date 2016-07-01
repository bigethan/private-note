#!/usr/bin/env bash

# put this somewhere in your bash setup
# function your-weird-alias() {
#   ~/path/to/this/file.sh $@
#   # delete the command from history
#   history -d $((HISTCMD-1))
# }

# choose your own logfile if you want
LOGFILE=~/.weirdlog
TEMPFILE=~/.weirdtmp

#to prevent accidental exposure
function rot13() {
  tr a-zA-Z n-za-mN-ZA-M
}

if [ "$1" = "done" ] && [ "$2" != "" ]; then
  grep -v "^$2 |" $LOGFILE > $TEMPFILE && mv $TEMPFILE $LOGFILE
elif [ $# -ne 0 ]; then
  ID=`grep -o "^[0-9]\{1,\}" $LOGFILE| tail -1`
  NOW=`date "+ | %Y-%m-%d %H:%M:%S |"`
  LOG=`echo $(($ID + 1)) $NOW $@ | rot13`
  echo $LOG >> $LOGFILE
  # to _visually_ hide what was just entered
  clear
else
  cat $LOGFILE | rot13
fi
