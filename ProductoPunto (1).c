
#include <stdio.h>

int Vector_1[9] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
int Vector_2[9] = { -1,2,-3,4,-5,6,-7,8,-9 };

int i = 0;
int resultado = 0;

int Producto(int, int);

int main(void) {

	for (i = 0; i < 9; i++)
	{
		result = result + ProductFunction(Vector_1[i], Vector_2[i]);
	}
}


int ProductFunction(int a, int b)
{
	return(a*b);

}

