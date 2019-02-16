CC="D:\AndroidCLI\android-ndk-r19\toolchains\llvm\prebuilt\windows-x86_64\bin\x86_64-linux-android28-clang.cmd"
CCFLAGS_NOTE=-v -static-libstdc++ 
CCFLAGS=-v -static-libstdc++

SRCS = intstr test1

OUTS := $(patsubst %,output/%,$(SRCS))

all: $(OUTS) $(SRCS)

$(SRCS): %: src/%.cpp
	@echo $< $@

$(OUTS): $(SRCS)
	$(CC) $(CCFLAGS) -o $@ src/$<.cpp

# push:
# 	pushall.bat

clean:
	del /q output\*

