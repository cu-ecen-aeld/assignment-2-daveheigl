#CROSS_COMPILE=aarch64-none-linux-gnu-
export PATH=$PATH:/home/dave/Downloads/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin

#default target builds the writer
all: writer

#clean cleans the writer binary
clean:
	rm -f writer

#writer.c is needs built using 
writer: writer.c
	$(CROSS_COMPILE)gcc -o writer writer.c