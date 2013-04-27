#!/bin/bash
export APK=FieldService.Android/FieldService.Android.apk
calabash-android console $APK -p android features/login.feature
