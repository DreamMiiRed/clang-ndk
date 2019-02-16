FOR %%I IN (output\*) do ( 
    adb -s emulator-5554 push %%I /data/local/tmp/output
    adb -s emulator-5554 shell "chmod +x /data/local/tmp/"%%I
)