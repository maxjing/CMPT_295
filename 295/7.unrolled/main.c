
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int sum_rolled(int *A, int n);
int sum_unrolled(int *A, int n);

#define N 2000
#define NTESTS 20

int A[N];
int P[N];
int Q;
int cycles[NTESTS];
long total;
int start_time = 150;
int end_time = 125;

void main () {
    srand(time(NULL));
    int i;

    Q = 0;
    for (i = 0; i < N; i++) {
        A[i] = rand() % 1024 - 512;
        Q += A[i];
    }
    for (i = 0; i < NTESTS; i++) {
        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (start_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        //P[i] = sum_rolled(A, N);
        P[i] = sum_unrolled(A, N);

        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (end_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        cycles[i] = end_time - start_time;
        if (cycles[i] >= 8000) { i--; continue; }
        if (P[i] != Q) {
            perror("Error:  sum mismatch"); return;
        }
    }

    total = 0;
    for (i = 0; i < NTESTS; i++) {
        printf("Sample %d completed in %d cycles.\n", i+1, cycles[i]);
        total += cycles[i];
    }
    printf("Average of %ld cycles.\n", total/NTESTS);

    return;
}

