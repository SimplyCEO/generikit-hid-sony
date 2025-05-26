# Essential variables definition

# Defaults to: GCC (mostly used by kernels)
ifndef CC
	CC := gcc
endif

# Defaults to: DEBUG compiler values
ifndef CFLAGS
	CFLAGS := -g3 -ggdb -Wall
endif

# Initial variables

CONFIG_MODULE_SIG   := n

#HID_SONY_MAINSTREAM := https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/hid/hid-sony.c
#HID_SONY_PATCH      := src/generikit-hid-sony.patch

# Kernel variables

MODULE_NAME     := generikit-hid-sony
KERNEL_VERSION  := $(shell uname -r)
KERNEL_PATH     := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD    := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)
obj-m           := src/$(MODULE_NAME).o

#patch:
#	curl -S $(HID_SONY_MAINSTREAM) --output src/hid-sony.c
#	@patch src/hid-sony.c < $(HID_SONY_PATCH)
#	@mv src/hid-sony.c src/generikit-hid-sony.c
#	@make compile

compile:
	$(MAKE) -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) CFLAGS_MODULE="$(CFLAGS)" CC=$(CC) modules
	@cp src/$(MODULE_NAME).ko .

install: # Run as root
	$(MAKE) -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) CFLAGS_MODULE="$(CFLAGS)" CC=$(CC) modules_install
#	@mv src/generikit-hid-sony.c src/hid-sony.c

clean:
	@rm -v *.ko 2>/dev/null || true
	@rm -v .*.cmd *.symvers *.order 2>/dev/null || true
	@rm -v src/.*.cmd src/*.o src/*.ko src/*.cmd src/*.mod src/*.mod.c 2>/dev/null || true
