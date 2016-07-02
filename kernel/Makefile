# Set the compiler variables
CC=i686-elf-gcc
NASM=nasm
LD=i686-elf-ld
TARGET=$(shell ../utils/arch.sh)

# Set the compiler flags
CFLAGS= -ffreestanding -fbuiltin -Wall -Wextra -I include/
ASMFLAGS=-f elf 
LDFLAGS= -T arch/$(TARGET)/linker.ld -m elf_i386

# Make the OBJS variable, which will hold all the kernel
# object files
OBJS=

# Include the Make.config files
# These files contain the names of the files to compile
include arch/$(shell ../utils/arch.sh)/Make.config
include kernel/Make.config

# This is a shorthand to build all .c files
# $< is the first variable, which when called will be 
# something like main.c
# $@ is the target name, which will be *.o, like main.o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# This is the same as the previous section, only compiling with NASM
%.o: %.asm
	$(NASM) $(ASMFLAGS) $< -o $@

# "Make a file named jos.kernel"
# The dependencies are behind the colon ":"
# Since we are referencing a variable, it will recursively make .o files
# from the .c and .asm in the OBJ variable.
# Finally it will link it
jos.kernel: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $@

# Gets rid of all the object files
clean:
	rm kernel/*.o arch/$(TARGET)/*.o jos.kernel
