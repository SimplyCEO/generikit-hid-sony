# Get kernel path

KERNEL_VERSION := $(shell uname -r)
KERNEL_PATH := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)

obj-m := src/generikit-hid-sony.o

all:
	make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install: # Run as root
	make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install

clean:
	@rm -v .*.cmd *.symvers *.order 2>/dev/null || true
	@rm -v src/.*.cmd src/*.o src/*.ko src/*.cmd src/*.mod src/*.mod.c 2>/dev/null || true
