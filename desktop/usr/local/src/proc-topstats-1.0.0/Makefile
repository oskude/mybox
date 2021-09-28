obj-m += proc-topstats.o
KBDIR ?= /lib/modules/`uname -r`/build

default:
	make -C $(KBDIR) M=$(PWD) modules

clean:
	make -C $(KBDIR) M=$(PWD) clean

test:
	insmod proc-topstats.ko
	cat /proc/topstats/cpu
	cat /proc/topstats/mem
	rmmod proc-topstats.ko
