
#include <stdio.h>

int get_byte_by_addr(int *, int i);

int get_byte_by_order(int x, int i) {
	int byte1;
	byte1 = (x>>(8*i)) & 0xff;
	return byte1;
	// end of Part 2.
}

int x=233876875;
unsigned int y=2908479998;

void main () {
	// complete this in Part 1.
	printf("x = %#x\n", x);
	printf("x = %i\n", x);
	printf("y = %#x\n", y);
	printf("y = %u\n", y);
	// end of Part 1

	int i;

	printf("x = ");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_order(x, i));
	}
	putchar('\n');

	printf("x = ");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_addr(&x, i));
	}
	putchar('\n');

	printf("y = ");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_order(y, i));
	}
	putchar('\n');

	printf("y = ");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_addr(&y, i));
	}
	putchar('\n');

    return;
}

