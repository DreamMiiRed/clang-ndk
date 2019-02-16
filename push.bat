adb -s emulator-5554 push %1 /data/local/tmp
adb -s emulator-5554 shell "chmod +x /data/local/tmp/%1"
