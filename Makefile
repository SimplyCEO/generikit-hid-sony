# Get kernel path

KERNEL_VERSION := $(shell uname -r)
KERNEL_PATH := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)/build
EXTRA := #skip

# Get the drivers location and give the module name

FILES += dependencies \
		 dependencies.txt \
		 drivers/hid/hid-sony.c
OBJECTS += hid-sony.o
MODULES += hid-sony
OLD_MODULES += $(KERNEL_PATH)/kernel/drivers/hid/hid-sony*

all: modules

modules:
	sudo rmmod $(MODULES) || true
	mkdir -pv build
	mkdir -pv backup
	cp -v $(FILES) build
	cp -v $(OLD_MODULES) backup || true
	sudo rm -fv $(OLD_MODULES)
	printf "obj-m = $(OBJECTS)\n" > build/Makefile
	cd build && $(SHELL) dependencies $(EXTRA)
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install
	sudo modprobe $(MODULES)

clean:
	rm -rfv build