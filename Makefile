# Get kernel path

KERNEL_VERSION := $(shell uname -r)
KERNEL_PATH := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)/build

# Get the drivers location and give the module name

INCLUDES += drivers/hid/hid-ids.h
CFILES += drivers/hid/hid-sony.c
OBJECTS += hid-sony.o

all: modules

modules:
	mkdir -p build
	cp -v  $(CFILES) $(INCLUDES) build
	echo "obj-m = $(OBJECTS)" > build/Makefile
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install

clean:
	rm -rfv build
