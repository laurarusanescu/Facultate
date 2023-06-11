#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

//
// This program takes as command line a single integer value which represents a year and then computes and displays the Easter date for that year
// The algorithm for computing the catholic Easter date is the following :
//	A = year mod 19
//	B = year mod 4
//	C = year mod 7
//	D = (19 * A + 24) mod 30
//	E = (2 * B + 4 * C + 6 * D + 5) mod 7 where mod is the remainder of the division of x to y.
// Easter day is then(22 + E + D) March.Note that this formula can give a date from April if 22 + E + D > 31; also take this case into account!
// The program will display the Easter date in the following way "The Easter day is 02 April " (use trailing zeros for the day if it is less than 10)


int main(int argc, char* argv[]) {
	int y;
	printf("Enter the year: ");
	scanf("%d", &y);;
	int a, b, c, d, e, ed;
	a = y % 19;
	b = y % 4;
	c = y % 7;
	d = (19 * a + 24) % 30;
	e = (2 * b + 4 * c + 6 * d + 5) % 7;
	ed = 22 + e + d;
	if (ed > 31 ) {
		ed = ed - 31;
		(ed / 10 == 0) ? (printf("The Easter day is 0%d April. ", ed)) : (printf("The Easter day is %d April. ", ed));
	}else {
		ed = ed;
		(ed / 10 == 0) ? (printf("The Easter day is 0%d March. ", ed)) : (printf("The Easter day is %d March. ", ed));
	}

	return 0;
}