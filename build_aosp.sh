#!/bin/bash

# The root folder of your AOSP
android_root_path=/home/khaon/android/rom/aosp_master;
android_out_folder=~/out/aosp_master;
device_lunch_number=25;

# Clean first the out folder
rm -rf $android_out_folder;

#Update our personal projects before repo syncing
sh update_personnal_projects.sh;

cd $android_root_path;

repo sync -j5 --force-sync -f;
. build/envsetup.sh
lunch $device_lunch_number;
make -j$(cat /proc/cpuinfo | grep processor | wc -l) otapackage;