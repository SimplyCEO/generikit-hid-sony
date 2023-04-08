# Get kernel path

KERNEL_VERSION=$(shell uname -r)
KERNEL_PATH=/lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD=$(KERNEL_PATH)/build
BUILD_DIRECTORY=$(shell pwd)/build
EXTRA=#skip

all:
	@mkdir -p $(BUILD_DIRECTORY)
	@cp src/generikit-hid-sony.c include/hid-ids.h $(BUILD_DIRECTORY)
	@printf "obj-m = generikit-hid-sony.o\n" > $(BUILD_DIRECTORY)/Makefile
	@printf "hid-sony\n" >> $(BUILD_DIRECTORY)/old_modules
	@printf "generikit-hid-sony\n" >> $(BUILD_DIRECTORY)/new_modules
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	@for x in $(shell cat $(BUILD_DIRECTORY)/old_modules | wc -l); do modprobe -r $(shell cat $(BUILD_DIRECTORY)/old_modules | sed -n $(x)p) || true; done
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do modprobe -r $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done
	@for x in $(shell cat $(BUILD_DIRECTORY)/old_modules | wc -l); do printf "blacklist $(shell cat $(BUILD_DIRECTORY)/old_modules | sed -n $(x)p)\n" > /etc/modprobe.d/generikit.conf || true; done
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install
	@sleep 1
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do modprobe -v $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done

clean:
	@rm -r $(BUILD_DIRECTORY) 2&>/dev/null || true
	@rm generikit 2&>/dev/null || true
