# Macros for building, deleting. Needs Open Watcom

AS=owcc
ASFLAGS=-bdos

LD=owcc
LDFLAGS=-bdos

RM=rm -f

default: all

.SUFFIXES: .asm .obj .exe

# Rule to build .obj from .asm

.asm.obj:
	$(AS) $(ASFLAGS) -c -o$@ $<

.obj.exe:
	$(LD) $(LDFLAGS) -o$@ $<

# Targets:

all: aefdisk.exe

aefdisk.exe: aefdisk.obj

aefdisk.obj: aefdisk.asm fat16.inc fat32.inc

# Clean up:

clean:
	-$(RM) *.obj
	-$(RM) aefdisk.exe
