#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

#include "tests.h"

// Substitution cipher or Caesar’s cipher.

// This program which reads a natural number n and a string s. The string s is encoded using Caesar’s cipher with a displacement of n (either positive or negative).
// The program decodes the message and display it on the screen. Punctuation marks and numbers are left as they are.


// DO NOT CHANGE THE SIGNATURE OF THIS METHOD
int n;
char s[100];
void encrypt(char s[], int n) {
	int i, c;
	for (i = 0; s[i] != '\0'; i++) {
		char c = s[i];
		if (c >= 'A' && c <= 'Z') {
			s[i] = 'A' + ((c - 'A' + n) % 26 + 26) % 26;
		}
		else if (c >= 'a' && c <= 'z') {
			s[i] = 'a' + ((c - 'a' + n) % 26 + 26) % 26;
		}
	}
}

int main()
{
	// To enable the tests, ctrl+click on ENABLE_TESTS (or go to the file "tests.h") and change the line
	// #define ENABLE_TESTS 0
	// to:
	// #define ENABLE_TESTS 1
#if ENABLE_TESTS > 0
	run_tests(true);
#endif
	printf("Enter a natural number n: ");
	scanf_s("%d\n", &n);
	printf("Enter a string s: ");
	fgets(s, 255, stdin);
	printf("Encoded message: ");
	encrypt(s, n);
	printf("%s\n", s);
	return 0;
}