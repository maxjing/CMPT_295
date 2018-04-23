
#include <stdio.h>

int sum(int *, int);

#define N 6

int A[N] = {58, 22, 101, 15, 72, 27};

void main () {
	int i;
	for (i = 0; i <= N; i++) {
	    printf("The total of A[%d] is %d.\n", i, sum(A,i));
	}
    return;
}
