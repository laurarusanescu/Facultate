#pragma once
#include <string>
#include <istream>
#include <fstream>
#include <ostream>
enum class DisplayType {
	RECTANGULAR_FORM,
	POLAR_FORM,
};

class Complex {
public:
    Complex(double real = 0, double imag = 0);

    double getReal() const;
    double getImag() const;
    void setReal(float real);
    void setImag(float imag);

    Complex conjugate() const;

    Complex add(const Complex& other) const;
    Complex subtract(const Complex& other) const;
    Complex multiply(const Complex& other) const;

    Complex operator+(const Complex& other) const;
    Complex operator-(const Complex& other) const;
    Complex operator*(const Complex& other) const;

    void multiply(double scalar);

    bool equals(const Complex& other) const;
    
    float phase() const;
    float magnitude() const;
    void toPolar(float* r, float* theta) const;

    std::string toString() const;

    float getMagnitude() const; 
    float getPhase() const;

    //static void setDisplayType(DisplayType type);

    //static DisplayType displayType;
    

    friend std::ostream& operator<<(std::ostream& os, const Complex& c);

   
private:
    double m_real;
    double m_imag;
    //static DisplayType displayType;
};
