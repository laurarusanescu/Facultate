#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <limits.h>
#include <string.h>
#include "tests.h"
#include "mystrchr.h"

#define _CRTDBG_MAP_ALLOC
#include <stdlib.h>
#include <crtdbg.h>

// Using the function that you wrote for problem 2, write a function that computes and returns an array with all the positions of the occurrences of a character in a string.

void find_all( const char * str, char character, int*  positions, unsigned int cap, unsigned int * l){
    char s[100];
    strcpy(s, str);
    for (int i = 0; i < cap; i++)
    {
        if (my_strchr(s, character) != NULL)
        {   
            positions[i] = strlen(s) - strlen(strchr(s, character));
            s[strlen(s) - strlen(strchr(s, character))] = '[';
        }
        else
            positions[i] = -1;
    }

 }

int main()
{
#if  ENABLE_TESTS > 0
    run_tests(true);
#endif 

    _CrtSetReportMode(_CRT_WARN, _CRTDBG_MODE_DEBUG);
    _CrtDumpMemoryLeaks();
    return 0;
}
