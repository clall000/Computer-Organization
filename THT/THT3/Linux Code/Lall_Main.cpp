#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
using namespace std;
#define SIZE 16 //32 //64 //128 //256 //512 //1024 //2048 // 4096 //8192 //16384 //32768 //65536 
//function prototype
#pragma once
int computeDotProduct(int* a, int* b, size_t n) {  
	int sum = 0;
#pragma loop(hint_parallel(0))
	for (size_t i = 0; i < n; ++i) {
		sum = sum + *(a + i) * (*b + i);
	}
	return sum;
}
static int Array[SIZE];
int main(int argc, char **argv)
{
 uint64_t timed;
 //double time;
 double avg = 0.0;
 struct timespec start, end;
 for (int i=0; i<100; i++){
 clock_gettime(CLOCK_MONOTONIC, &start);
computeDotProduct(Array, Array ,SIZE);
 //recorded end time
 clock_gettime(CLOCK_MONOTONIC, &end);
 timed = (end.tv_sec - start.tv_sec)*1000000000ULL + end.tv_nsec - start.tv_nsec;
 //printf("time = %f ns\n", (double) timed);
 avg += timed;
 }
 avg/= 100;
 printf("size = %i, avg time = %f ns \n", SIZE, avg);
 return 0;
}