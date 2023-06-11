#include "BigInteger.h"

#include <cctype> // for isdigit
#include <iostream>
#include <iomanip>
using namespace std;


BigInteger::BigInteger() : digits("0"), sign(0) {}

BigInteger::BigInteger(long long int x) : sign(x >= 0 ? 1 : -1) {
    if (sign == 1) {
        digits = to_string(x);
    }
    else {
        digits = to_string(-x);
    }
}

BigInteger::BigInteger(string s) {
    if (s[0] == '-') {
        sign = -1;
        s.erase(0, 1);
    }
    else if (s[0] == '+') {
        sign = 1;
        s.erase(0, 1);
    }
    else {
        sign = 1;
    }
    digits = s;
    normalize();
}

void BigInteger::normalize() {
    auto pos = digits.find_first_not_of('0');
    if (pos == string::npos) {
        digits = "0";
        sign = 0;
        return;
    }
    digits.erase(0, pos);
    if (digits.empty()) {
        digits = "0";
        sign = 0;
        return;
    }
    if (sign == -1) {
        digits.insert(0, "-");
    }
}

int BigInteger::sgn() const {
    return sign;
}

bool BigInteger::operator==(const BigInteger& other) const {
    return sign == other.sign && digits == other.digits;
}

bool BigInteger::operator<(const BigInteger& other) const {
    if (sign != other.sign) {
        return sign < other.sign;
    }
    if (digits.size() != other.digits.size()) {
        return sign == 1 ? digits.size() < other.digits.size() : digits.size() > other.digits.size();
    }
    return sign == 1 ? digits < other.digits : digits > other.digits;
}

bool BigInteger::operator<=(const BigInteger& other) const {
    return *this == other || *this < other;
}

bool BigInteger::operator>(const BigInteger& other) const {
    return !(*this <= other);
}

bool BigInteger::operator>=(const BigInteger& other) const {
    return !(*this < other);
}