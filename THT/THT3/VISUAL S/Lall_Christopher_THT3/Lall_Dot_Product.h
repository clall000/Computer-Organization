#pragma once 
int _DotProduct(int* a, int* b, size_t n)
{
	int sum = 0;
#pragma loop(hint_parallel(0))
	for (size_t i = 0; i < n; ++i)
	{
		sum += *(a + i) * (*b + i);
	}
	return sum;
}
#pragma once
