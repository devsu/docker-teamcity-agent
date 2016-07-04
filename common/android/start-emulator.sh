#!/bin/bash

# Modified script, based on: https://raw.githubusercontent.com/travis-ci/travis-cookbooks/master/ci_environment/android-sdk/files/default/android-wait-for-emulator

set +e

bootanim=""
failcounter=0
timeout_in_sec=360

# The device with the following name, and with the proper params should already have to be created with the 'android create avd' command

DEVICE_ID="myandroid-23-nexus5-x86"

bootanim=`adb -e shell getprop init.svc.bootanim 2>&1 &`
if [[ "$bootanim" =~ "error: no emulators found" ]]; then
  echo "Starting the emulator"
  emulator64-x86 -avd $DEVICE_ID -noskin -no-audio -no-window -gpu off -qemu -m 1024 -enable-kvm > /dev/null 2>&1 &
  sleep 5
else
  echo "There should be already an emulator running"
fi

# Wait until started
until [[ "$bootanim" =~ "stopped" ]]; do
  bootanim=`adb -e shell getprop init.svc.bootanim 2>&1 &`
  if [[ "$bootanim" =~ "device '(null)' not found" || "$bootanim" =~ "device not found"
    || "$bootanim" =~ "device offline" || "$bootanim" =~ "running" ]]; then
    let "failcounter += 1"
    echo "Waiting for emulator to start"
    if [[ $failcounter -gt timeout_in_sec ]]; then
      echo "Timeout ($timeout_in_sec seconds) reached; failed to start emulator"
      exit 1
    fi
  fi
  sleep 1
done

echo "Emulator is ready"

