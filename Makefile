CC="D:\AndroidCLI\android-ndk-r19\toolchains\llvm\prebuilt\windows-x86_64\bin\x86_64-linux-android21-clang.cmd"
CCFLAGS_NOTE=-v -static-libstdc++ 
CCFLAGS=-v -static-libstdc++

SRCS = intstr test1

OUTS := $(patsubst %,out/%,$(SRCS))

all: $(SRCS)

$(SRCS): %: src/%.cpp
	@echo $< $@
	if not exist out\NUL md out
	$(CC) $(CCFLAGS) -o out/$@ $<

emu:
	emulator -avd google_apis_21 -port 5554

define adbpush
	adb -s emulator-5554 push out/$(1) /data/local/tmp
	adb -s emulator-5554 shell "chmod 777 /data/local/tmp/$(1)"

endef

push:
	$(foreach var, $(SRCS), $(call adbpush,$(var)) )

# make shell RUN=intstr
shell:
	adb -s emulator-5554 shell "LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/$(RUN)"

clean:
	if exist out\NUL del /q out\*

cleanadb:
	adb -s emulator-5554 shell "rm /data/local/tmp/*"