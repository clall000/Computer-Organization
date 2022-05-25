#include <iostream>
#include <ctime>
#include <Windows.h>
#include <cmath>
#include <chrono> 
#include <fstream> 
#include "Lall_Dot_Product.h" 

int _DotProduct(int*, int*, size_t);
using namespace std;
const string getName()
{
	chrono::time_point<chrono::system_clock> now = chrono::system_clock::now();
	time_t start = std::chrono::system_clock::to_time_t(now);
	char timedisplay[100];
	struct tm buf;
	errno_t err = localtime_s(&buf, &start);
	strftime(timedisplay, sizeof(timedisplay), "dp%Y%m%d%H%M%S.csv", &buf);
	return timedisplay;
}

int main()
{
	std::ofstream file;
	string fname = getName();
	file.open(fname, ios::out);
	file << "Array Size, Start, End, Difference, f(Hz), time(s)";
	printf("n\tTime Taken (us)\n");
	for (int p = 4; p < 17; ++p)
	{
		int n = pow(2, p);
		_int64 start = 0;
		_int64 end = 0;
		_int64 f = 0;

		srand(time(nullptr));
		int* x = new int[n];
		int* y = new int[n];
		for (int i = 0; i < n; ++i)
		{
			*(x + i) = rand();
			*(y + i) = rand();
		}

		if (QueryPerformanceCounter((LARGE_INTEGER*)&start) != 0)
		{
			_DotProduct(x, y, n);
			QueryPerformanceCounter((LARGE_INTEGER*)&end);
			QueryPerformanceFrequency((LARGE_INTEGER*)&f);

			printf("%d\t%.2f us \n", n, (end - start) * 1.0 / f * pow(10, 6));
			file << n << ", " << start << ", " << end << ", " << end - start << ", " << f << ", " << (end - start) * 1.0 / f << endl;
		}
		else
		{
			DWORD errorMessageID = GetLastError();
			printf("Error Value: %lu\n", errorMessageID);
		}
		delete x;
		delete y;
	}
	file.close();
	return 0;

}
