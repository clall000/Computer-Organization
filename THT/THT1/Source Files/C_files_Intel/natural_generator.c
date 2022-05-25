#include <stdio.h>
int natural_generator()
{
	int a = 1;
	static int b = -1;
	b += 1;
	return a + b;
}
void main7()
{
	printf("%d\n", natural_generator());
	printf("%d\n", natural_generator());
	printf("%d\n", natural_generator());
}