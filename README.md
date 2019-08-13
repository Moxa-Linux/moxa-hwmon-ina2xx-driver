# moxa-hwmon-ina2xx-driver

This ina2xx hwmon driver source is based on [linux-source-4.9(4.9.168-1+deb9u4)](https://packages.debian.org/stretch/linux-source-4.9).

### Compile & install the driver

#### Install build-essential packages
```
$ apt-get update
$ apt-get install build-essential linux-headers-`uname -r`
```

#### Compile the driver
```
$ make
```

#### Compile and install the driver
```
$ make install
```

#### Load the hwmon driver
```
$ modprobe ina2xx
```

### Test the hwmon driver
```
# to find hid device location
$ cat /sys/bus/i2c/devices/i2c-1/name
CP2112 SMBus Bridge on hiddev0

# add device to SMBus Bridge (e.g. i2c address = 0x41)
$ echo "ina219 0x41" > /sys/bus/i2c/devices/i2c-1/new_device

# remove device from SMBus Bridge
$ echo "0x41" > /sys/bus/i2c/devices/i2c-1/delete_device
```
