#include <stdlib.h>
#include <string.h>
void quicksort(float * array, int first, int last)
{
    if (first>last)
    {
        return;
    }
    float temp;
    int i = first;
    int j = last;
    int mid = first + (last-first)/2;
    float pivot = array[mid];
    while (i < j)
    {
        while (array[i] > pivot)
        {
            i++;
        }
        while (array[j] < pivot)
        {
            j--;
        }
        if (i <= j)
        {
            temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i++;
            j--;
        }
    }
    if (first < j)
        quicksort(array, first, j);
    if (i < last)
        quicksort(array, i, last);
}

int binary_search(float *array, int first, int last, float el)
{
    int mid = first + (last-first)/2;
    if (array[mid] == el)
    {
        return mid + 1;
    }
    if (el > array[mid])
    {
        return binary_search(array,first,mid-1,el);
    }
    else
    {
        return binary_search(array,mid+1,last,el);
    }
}
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i;
    int num_pass = 0;
    float average = 0;
    float pass_avg = 0;
    if (N <= 0) return;

    size_t sz = sizeof(float)*N;
    float * J = malloc(sz);
    memcpy(J, F, sz);

    quicksort(J,0,N-1);
    // compute ranks
    for (i = 0; i < N; ++i) {
        R[i] = binary_search(J,0,N-1,F[i]);
        average += F[i];
        if (F[i] >= 50.0) {
            pass_avg += F[i];
            num_pass += 1;
        }
    }
    // check for div by 0
    average /= N;
    if (num_pass>0) pass_avg /= num_pass;
    *avg = average;
    *passing_avg = pass_avg;
    *num_passed = num_pass;
    free(J);
} // compute_ranks