TARGET	:= ina2xx
KRELEASE ?= $(shell uname -r)
KBUILD ?= /lib/modules/$(KRELEASE)/build
obj-m := ina2xx.o

modules:
	@echo "Making modules $(TARGET) ..."
	$(MAKE) -C $(KBUILD) M=$(PWD) modules

install: modules
	/usr/bin/install -m 644 -D $(TARGET).ko /lib/modules/$(KRELEASE)/kernel/drivers/hwmon/$(TARGET).ko
	/usr/bin/install -m 644 -D $(TARGET).conf /usr/lib/modules-load.d/$(TARGET).conf

clean:
	$(MAKE) -C $(KBUILD) M=$(PWD) clean
