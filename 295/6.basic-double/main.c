
#include <stdio.h>
#include <math.h>

long d2l(double);
double l2d(long);

double sum_doubles(double *, int);
float sum_floats(float *, int);

long a = 0x0123456789abcdef;

#define N 10

 float f[N] = {8.6, 4.6, -3.3, NAN, -2.3, 3.5, -6.8, 7.5, 2.4, 2.9};
double d[N] = {8.6, 4.6, -3.3, 0, -2.3, 3.5, -6.8, 7.5, 2.4, 2.9};

void main () {
    printf("a = %#.16lx\n", a);
    double b = l2d(a);
    printf("b = %e\n", b);
    a = d2l(b);
    printf("a = %#.16lx\n", a);

    int i = 0;
    float ftot = 0;
    double dtot = 0;
    ftot = sum_floats(f, N);
    //dtot = sum_doubles(d, N);
    for (i = 0; i < N; i++) {
        //ftot += f[i];
        dtot += d[i];
    }
    printf("ftot = %f\n", ftot);
    printf("dtot = %lf\n", dtot);
    return;
}
