CFLAGS = -Os -fdata-sections -ffunction-sections
LIBFLAGS = -fPIC
CXXFLAGS = ${CFLAGS}
LDFLAGS = -nostdlib -Wl,--strip-all -Wl,--gc-sections

SOURCES = $(wildcard *.c)  # Find all C files in the directory
ASM_SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.c=.o) $(ASM_SOURCES:.s=.o) # Replace .c with .o for object files

ifeq (${STATIC}, 1)
	LDFLAGS+=-static
endif

ifeq (${RISCV}, 1)
	CC=riscv64-unknown-linux-gnu-gcc
	CXX=riscv64-unknown-linux-gnu-g++
	AS=riscv64-unknown-linux-gnu-as
	CFLAGS+=-march=rv64imafd
	CXXFLAGS+=-march=rv64imafd
endif

ifeq (${ARM64}, 1)
	CC=aarch64-linux-gnu-gcc
	CXX=aarch64-linux-gnu-g++
	AS=aarch64-linux-gnu-as
endif

all: $(SOURCES:.c=) $(ASM_SOURCES:.s=) # Build an executable for each file

# Generic rule for compiling .c files into .o files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	$(AS) $(CFLAGS) -c -o $@ $<

# Generic rule for linking .o files into executables
%: %.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%: %.S
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o $(SOURCES:.c=) $(ASM_SOURCES:.s=)
