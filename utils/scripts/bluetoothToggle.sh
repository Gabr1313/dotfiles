#!/usr/bin/env bash

STRING=`rfkill | grep "bluetooth"| sed 's/ //g'`

if [[ "$STRING" == *"unblockedun"* ]]
then
  rfkill block 0
else
  rfkill unblock 0
fi
