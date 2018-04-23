
#include <stdio.h>

#define N 55

void fill(char *s) {
    int i;

    for (i = 0; i < N; i++) {
        s[i] = (i % 26) + 'a';
    }
    s[i] = 0;

    return;
}

