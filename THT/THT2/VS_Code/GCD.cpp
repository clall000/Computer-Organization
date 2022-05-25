#include <stdio.h>

int gcd(int a, int b) {
	if (a == 0)
		return b;
	return gcd(b % a, a);
}

int main()
{
	int a = 11, b = 5;
	printf("GCD(%d, %d) = %dn", a, b, gcd(a, b));
	return 0;

}