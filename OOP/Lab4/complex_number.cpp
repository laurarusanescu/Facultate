#include "complex_number.h"
#include <sstream>
#include <iomanip>
#include <sstream>
#include <iostream>
#include <math.h>
#include <cmath>
using namespace std;
#define M_PI  3.1415926535f 
Complex::Complex(double real, double imag)
    : m_real(real), m_imag(imag)
{
}

double Complex::getReal() const
{
    return m_real;
}

double Complex::getImag() const
{
    return m_imag;
}

void Complex::setReal(float real) {
    this->m_real = real;
}

void Complex::setImag(float imag) {
    this->m_imag = imag;
}

Complex Complex::conjugate() const
{
    return Complex(m_real, -m_imag);
}

Complex Complex::add(const Complex& other) const
{
    return Complex(m_real + other.m_real, m_imag + other.m_imag);
}

Complex Complex::subtract(const Complex& other) const
{
    return Complex(m_real - other.m_real, m_imag - other.m_imag);
}

Complex Complex::multiply(const Complex& other) const
{
    double real = m_real * other.m_real - m_imag * other.m_imag;
    double imag = m_real * other.m_imag + m_imag * other.m_real;
    return Complex(real, imag);
}

Complex Complex::operator+(const Complex& other) const
{
    return add(other);
}

Complex Complex::operator-(const Complex& other) const
{
    return subtract(other);
}

Complex Complex::operator*(const Complex& other) const
{
    return multiply(other);
}

void Complex::multiply(double scalar)
{
    m_real *= scalar;
    m_imag *= scalar;
}

bool Complex::equals(const Complex& other) const 
{
    return (m_real == other.m_real) && (m_imag == other.m_imag);
}

float Complex::phase() const {
    if (m_real == 0 && m_imag == 0) {
        return 0;
    }
    else {
        return atan2(m_imag, m_real);
    }
}

float Complex::magnitude() const {
    return sqrt(m_real * m_real + m_imag * m_imag);
}

void Complex::toPolar(float* r, float* theta) const {
    *r = magnitude();
    *theta = phase();
}

float Complex::getMagnitude() const
{
    return sqrt(m_real * m_real + m_imag * m_imag); 
}
float Complex::getPhase() const
{
    return atan2(m_imag, m_real) * 180.0f / M_PI; 
}

/*std::string Complex::toString() const {
    std::ostringstream os;

    double magnitude = sqrt(m_real * m_real + m_imag * m_imag);
    double angle = atan2(m_imag, m_real) * 180 / M_PI;

    if (displayType == DisplayType::RECTANGULAR_FORM) {
        os << std::fixed << std::setprecision(2) << m_real << " + i" << m_imag;
    }
    else {
        os << std::fixed << std::setprecision(2) << magnitude << "*(cos(" << angle << ") + i*sin(" << angle << "))";
    }

    return os.str();
}*/

/*void Complex::setDisplayType(DisplayType type) {
    displayType = type;
}

std::ostream& operator<<(std::ostream& os, const Complex& c) {
    std::ostringstream sstr;

    if (Complex::displayType == DisplayType::RECTANGULAR_FORM) {
        sstr << c.m_real;
        if (c.m_imag >= 0) {
            sstr << " + ";
        }
        else {
            sstr << " - ";
        }
        sstr << std::abs(c.m_imag) << "i";
    }
    else if (Complex::displayType == DisplayType::POLAR_FORM) {
        sstr.precision(2);
        sstr << std::fixed << c.getMagnitude() << "*(cos(" << std::fixed << c.getPhase() << ") + i*sin(" << std::fixed << c.getPhase() << "))";
    }

    os << sstr.str();
    return os;
}*/