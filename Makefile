TARGET 		= asmlink
CC  		= g++
ASM 		= nasm 
AFLAGS 		= -f elf64
CFLAGS 		= -m64 
ASM_OBJECTS	= src_asm/link.o
LDSCRIPT    = linker/linker.ld

SRC = $(wildcard src/*.cpp)
OBJECTS = $(SRC:.cpp=.o)

SRC_ASM = $(wildcard src_asm/*.asm)

INCLUDES = -Iinclude

all: link main

main:
	$(CC) $(SRC) $(CFLAGS) $(INCLUDES) $(ASM_OBJECTS) -T $(LDSCRIPT) -o $(TARGET)

link:
	$(ASM) $(AFLAGS) $(SRC_ASM)

clean:
	rm $(TARGET) $(ASM_OBJECTS)
