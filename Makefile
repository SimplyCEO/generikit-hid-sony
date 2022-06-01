# Get kernel path

KERNEL_VERSION := $(shell uname -r)
KERNEL_PATH := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)/build
EXTRA := #skip

# Get the drivers location and give the module name

FILES += dependencies \
		 dependencies.txt \
		 drivers/hid/generic-hid-sony.c \
		 drivers/hid/hid-ids.h

OBJECTS += generic-hid-sony.o

NEW_MODULES += generic-hid-sony

OLD_MODULES += hid-sony

all: modules

modules:
	sudo rmmod $(OLD_MODULES) || true
	mkdir -pv build
	cp -v $(FILES) build
	printf "obj-m = $(OBJECTS)\n" > build/Makefile
	cd build && $(SHELL) dependencies $(EXTRA)
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	cd build && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install
	sudo modprobe $(NEW_MODULES)
	printf "$(OLD_MODULES)\n" | tee /etc/modprobe.d/generikit.conf

clean:
	rm -rfv build
