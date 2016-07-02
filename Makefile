

DIST_CD=jos.iso

all: $(DIST_CD)

$(DIST_CD):
	make -C kernel 
	qemu-system-x86_64 -kernel kernel/jos.kernel

clean:
	make -C kernel clean
