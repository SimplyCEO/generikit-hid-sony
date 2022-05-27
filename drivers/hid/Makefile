
KVER := $(shell uname -r)
KP := /lib/modules/$(KVER)/build
MODULE_DIR := $(shell pwd)

all: modules

modules:
	make -C $(KP) M=$(MODULE_DIR) modules

install:
	make -C $(KP) M=$(MODULE_DIR) modules_install

