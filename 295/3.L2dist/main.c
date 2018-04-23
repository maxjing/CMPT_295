
#include <stdio.h>

unsigned sqrt(unsigned );
unsigned dist(unsigned x1, unsigned y1, unsigned x2, unsigned y2);
unsigned sumroot(unsigned x, unsigned y);

void main () {
	unsigned x1 = 5, y1 = 15;
	unsigned x2 = 45, y2 = 2;

    printf("The distance between (%u,%u) and (%u,%u) is %u.\n", x1, y1, x2, y2, dist(x1, y1, x2, y2));

	unsigned x = 1225;
	unsigned y = 49;

	printf("The sum of the roots of %u and %u is %u.\n", x, y, sumroot(x,y));

    return;

}










