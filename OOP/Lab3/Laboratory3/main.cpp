#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

#include "complex_test.h"

#define AC_BLACK "\x1b[30m"
#define AC_RED "\x1b[31m"
#define AC_GREEN "\x1b[32m"
#define AC_YELLOW "\x1b[33m"
#define AC_BLUE "\x1b[34m"
#define AC_MAGENTA "\x1b[35m"
#define AC_CYAN "\x1b[36m"
#define AC_WHITE "\x1b[37m"
#define AC_NORMAL "\x1b[m"

void display_mandelbrot(int width, int height, int max_its)
{

    const float x_start = -3.0f;
    const float x_fin = 1.0f;
    const float y_start = -1.0f;
    const float y_fin = 1.0f;

    double dx = (x_fin - x_start) / (width - 1);
    double dy = (y_fin - y_start) / (height - 1);

    for (int y = 0; y < height; ++y)
    {
        for (int x = 0; x < width; ++x)
        {
            // create complex number z = 0 + 0i
            Complex z = complex_create(0, 0);
            // create complex number c =  x_start+ x*dx + (y_start+y*dy)i
            Complex c = complex_create(x_start + x * dx, y_start + y * dy);

            int iteration = 0;
            // while |z| < 2 and we haven't reach max_its
           
            while (complex_mag(z) < 2 && ++iteration < max_its) {
                // apply the rule:  z =  z*z + c
                z = complex_multiply(z, z);
                z = complex_add(z, c);
            }

            // TODO: your code here (modify the code to display the mandelbrot fractal
            if (iteration == max_its) {
                printf("%so%s", AC_WHITE, AC_NORMAL);
            }
            else {
                printf("%s-%s", AC_BLACK, AC_NORMAL);
            }

        }
        printf("\n");
    }

}



int main(int argc, char** argv) {



	run_complex_tests(true);


	Complex c1 = complex_create(3, 2);
	printf("One example of a complex number is: %f + %fi.\n", c1.real, c1.imag);
	printf("The magnitude of this complex number is: %f\n", complex_mag(c1));
	printf("The phase of this complex number is: %f\n", complex_phase(c1));
	printf("The complex conjugate of this number is: %f %fi.\n", complex_conjugate(c1).real, complex_conjugate(c1).imag);
	complex_scalar_mult(&c1, 3);

    
    Complex* c2 = (Complex*)malloc(sizeof(Complex));
    c2->real = 1;
    c2->imag = 2;
    free(c2);


    display_mandelbrot(100, 25, 100);

    //display_mandelbrot(150, 38, 150);

    //display_mandelbrot(50, 17, 50);

    getchar();
    return 0;
	
}