# Get kernel path

KERNEL_VERSION := $(shell uname -r)
KERNEL_PATH := /lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD := $(KERNEL_PATH)/build
BUILD_DIRECTORY := $(shell pwd)/build
EXTRA := #skip

# Set the drivers and modules variable
#
# DO NOT define any optional file in the variables

DRIVERS =
OBJECTS =
OLD_MODULES =
NEW_MODULES =

all:
	@printf "Choose the module(s) to compile\n\
	\thid-sony - Support for generic PlayStation 3 controller.\n"

hid-sony:
	@printf "\e[1;32mAdded hid-sony to the recipe.\e[0m\n"
	@mkdir -pv $(BUILD_DIRECTORY)
	@cp -v drivers/hid/generikit-hid-sony.c drivers/hid/hid-ids.h $(BUILD_DIRECTORY)
	@printf "obj-m = generikit-hid-sony.o\n" > $(BUILD_DIRECTORY)/Makefile
	@printf "hid-sony\n" >> $(BUILD_DIRECTORY)/old_modules
	@printf "generikit-hid-sony\n" >> $(BUILD_DIRECTORY)/new_modules

modules:
	@mkdir -pv $(BUILD_DIRECTORY)
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	@for x in $(shell cat $(BUILD_DIRECTORY)/old_modules | wc -l); do rmmod $(shell cat $(BUILD_DIRECTORY)/old_modules | sed -n $(x)p) || true; done
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do rmmod $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install
	@sleep 1
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do modprobe -v $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done

clean:
	@rm -rfv $(BUILD_DIRECTORY)
