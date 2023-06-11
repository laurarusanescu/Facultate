#pragma once
#include<string>
#include<iostream>

class BigInteger {
public:
    BigInteger();
    BigInteger(long long int x);
    BigInteger(std::string s);

    int sgn() const;
    bool operator==(const BigInteger& other) const;
    bool operator<(const BigInteger& other) const;
    bool operator<=(const BigInteger& other) const;
    bool operator>(const BigInteger& other) const;
    bool operator>=(const BigInteger& other) const;

private:
    std::string digits;
    int sign;

    void normalize();
};