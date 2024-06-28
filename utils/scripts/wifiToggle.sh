#!/usr/bin/env bash
STRING=`rfkill | grep "wlan" | sed 's/ //g'`

if [[ "$STRING" == *"unblockedun"* ]]
then
  rfkill block 1
else
  rfkill unblock 1
fi
