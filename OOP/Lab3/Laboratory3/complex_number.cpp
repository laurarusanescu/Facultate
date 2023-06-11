#include <math.h>
#include <stdio.h>

#include "complex_number.h"

//GETTERS
float get_real(Complex c) {
	return c.real;
}
float get_imag(Complex c) {
	return c.imag;
}

//SETTERS
void set_real(Complex* c, float real) {
	c->real = real;
}
void set_imag(Complex* c, float imag) {
	c->imag = imag;
}

//A. Creating a complex number:
Complex complex_create(float real, float imag) {
	struct Complex complex_number;
	complex_number.real = real;
	complex_number.imag = imag;
	return complex_number;
}

//B. Displaying a complex number:
void complex_display(Complex c) {
	printf("The complex number is %f + %fi\n", c.real, c.imag);
}

//C. Computing the basic arithmetical operations on two complex numbers: addition, subtraction and multiplication:
Complex complex_add(Complex c1, Complex c2) {
	struct Complex complex_number;
	complex_number.real = c1.real+c2.real;
	complex_number.imag = c1.imag+c2.imag;
	return complex_number;
}

Complex complex_subtract(Complex c1, Complex c2) {
	struct Complex complex_number;
	complex_number.real = c1.real - c2.real;
	complex_number.imag = c1.imag - c2.imag;
	return complex_number;
}

Complex complex_multiply(Complex c1, Complex c2) {
	struct Complex complex_number;
	complex_number.real = (c1.real * c2.real) - (c2.imag * c1.imag);
	complex_number.imag = (c1.real * c2.imag) + (c1.imag * c2.real);
	return complex_number;
}

//D. Checking if two complex numbers are equal:
bool complex_equals(Complex c1, Complex c2) {
	if (c1.real == c2.real && c1.imag == c2.imag)
		return 1;
	return 0;
}

//E. Computing the complex conjugate of a complex number:
Complex complex_conjugate(Complex c) {
	struct Complex complex_number;
	complex_number.real = c.real;
	complex_number.imag = (-1) * c.imag;
	return complex_number;
}

//F. Multiplying a complex number with a scalar:
void complex_scalar_mult(Complex* c, float s) {
	c->real = c->real * s;
	c->imag = c->imag * s;
}

//G. Computing the magnitude and the phase of a complex number. Using these functions express the complex number in polar coordinates:
float complex_mag(Complex c) {
	return sqrt((c.real * c.real) + (c.imag * c.imag));
}

float complex_phase(Complex c) {
	return atan2(c.imag, c.real);
}

void complex_to_polar(Complex c, float* r, float* theta) {
	*r = complex_mag(c);
	*theta = complex_phase(c);
}
