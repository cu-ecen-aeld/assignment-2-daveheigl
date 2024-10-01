CROSS_COMPILE=aarch64-none-linux-gnu-

#default target builds the writer
all: writer

#clean cleans the writer binary
clean:
	rm -f writer

#writer.c is needs built using 
writer: writer.c
	$(CROSS_COMPILE)gcc -o writer writer.c