#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

// Alice forgot her card’s PIN code.She remembers that her PIN code had 4 digits, all the digits were distinctand in decreasing order, and that the sum of these digits was 24. 
// This C program that prints, on different lines, all the PIN codes which fulfill these constraints. 

int main(int argc, char* argv[]) {
	int i, a, b, c, d;
	int sum = 24;
	for (i = 1599; i <= 9952; i++) {
		a = i / 1000;
		b = (i / 100) % 10;
		c = (i / 10) % 10;
		d = i % 10;
		if (a > b && b > c && c > d && a + b + c + d == sum) {
			printf(%i is a valid PIN for your card.\n", i);
		}
	}
	return 0;
}
