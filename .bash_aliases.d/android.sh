# ADB shortcuts
alias adb-restart='adb kill-server && adb start-server'
alias adb-devices='adb devices -l'
alias adb-log='adb logcat'
alias adb-install='adb install'
alias adb-uninstall='adb uninstall'
alias adb-push='adb push'
alias adb-pull='adb pull'
alias adb-shell='adb shell'
alias adb-reboot='adb reboot'
alias adb-screenshot='adb exec-out screencap -p > screenshot.png'
alias adb-screen-record='adb shell screenrecord /sdcard/screen.mp4'
alias adb-pull-record='adb pull /sdcard/screen.mp4'

# Emulator shortcuts
alias emulator-start='emulator -avd'
alias emulator-list='$ANDROID_HOME/tools/bin/avdmanager list avd'

# Gradle shortcuts
alias gradle-clean='./gradlew clean'
alias gradle-build='./gradlew assembleDebug'
alias gradle-release='./gradlew assembleRelease'
alias gradle-install='./gradlew installDebug'
alias gradle-run='./gradlew installDebug && adb shell am start -n'

# APK handling
alias apk-sign='jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore'
alias apk-align='zipalign -v 4'
alias apk-info='aapt dump badging'
alias android-clean='find . -name build -type d -exec rm -rf {} +'
alias install-apk='adb install -r app/build/outputs/apk/debug/app-debug.apk'
