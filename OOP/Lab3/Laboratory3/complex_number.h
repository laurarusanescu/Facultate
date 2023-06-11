#pragma once
#include <stdbool.h>


struct Complex{
	float real;
	float imag;
};

//GETTERS AND SETTERS
float get_real(Complex c);
float get_imag(Complex c);
void set_real(Complex* c, float real);
void set_imag(Complex* c, float imag);

//A
Complex complex_create(float real, float imag);

//B
void complex_display(Complex c);

//C
Complex complex_add(Complex c1, Complex c2);
Complex complex_subtract(Complex c1, Complex c2);
Complex complex_multiply(Complex c1, Complex c2);

//D
bool complex_equals(Complex c1, Complex c2);

//E
Complex complex_conjugate(Complex c);

//F
void complex_scalar_mult(Complex* c, float s);

//G
float complex_mag(Complex c);
float complex_phase(Complex c);
void complex_to_polar(Complex c, float* r, float* theta);
