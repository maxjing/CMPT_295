

int sum_unrolled(int *A, int n) {
    int total = 0;
	int sum[4] = {0, 0, 0, 0};
    int i;
    for (i = 0; i < n-4; i += 4) {
        sum[0] += A[i];
        sum[1] += A[i+1];
        sum[2] += A[i+2];
        sum[3] += A[i+3];
    }
	total = sum[0] + sum[1] + sum[2] + sum[3];
    for (; i < n; i++) {
        total += A[i];
    }
    return total;
}



int sum_rolled(int *A, int n) {
    int total = 0;
    int i;
    for (i = 0; i < n; i++) {
        total += A[i];
    }
    return total;
}



