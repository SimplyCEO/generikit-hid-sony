# Get kernel path

KERNEL_VERSION=$(shell uname -r)
KERNEL_PATH=/lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD=$(KERNEL_PATH)/build
BUILD_DIRECTORY=$(shell pwd)/build
EXTRA=#skip

all:
	gcc -o generikit build.c
	@./generikit --help

generikit-hid-sony:
	@printf "\e[1;32mAdded generikit-hid-sony: to the recipe.\e[0m\n"
	@mkdir -pv $(BUILD_DIRECTORY)
	@cp -v drivers/hid/generikit-hid-sony.c drivers/hid/generikit-hid-ids.h $(BUILD_DIRECTORY)
	@printf "obj-m = generikit-hid-sony.o\n" > $(BUILD_DIRECTORY)/Makefile
	@printf "hid-sony\n" >> $(BUILD_DIRECTORY)/old_modules
	@printf "generikit-hid-sony\n" >> $(BUILD_DIRECTORY)/new_modules

modules:
	@mkdir -pv $(BUILD_DIRECTORY)
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules

install:
	@for x in $(shell cat $(BUILD_DIRECTORY)/old_modules | wc -l); do rmmod $(shell cat $(BUILD_DIRECTORY)/old_modules | sed -n $(x)p) || true; done
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do rmmod $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done
	@for x in $(shell cat $(BUILD_DIRECTORY)/old_modules | wc -l); do printf "blacklist $(shell cat $(BUILD_DIRECTORY)/old_modules | sed -n $(x)p)\n" | tee /etc/modprobe.d/generikit.conf || true; done
	@cd $(BUILD_DIRECTORY) && make -C $(KERNEL_BUILD) M=$(BUILD_DIRECTORY) modules_install
	@sleep 1
	@for x in $(shell cat $(BUILD_DIRECTORY)/new_modules | wc -l); do modprobe -v $(shell cat $(BUILD_DIRECTORY)/new_modules | sed -n $(x)p) || true; done

clean:
	@rm -rv $(BUILD_DIRECTORY) 2&>/dev/null || true
	@rm -v generikit 2&>/dev/null || true
