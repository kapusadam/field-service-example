#!/bin/bash
export APK=FieldService.Android/FieldService.Android.apk
calabash-android run $APK -p android $1
