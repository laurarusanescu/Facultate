#define _CRT_SECURE_NO_WARNINGS
#include <math.h>
#include <stdio.h>
#include <limits.h>
#include "tests.h"
#include <time.h>


void generateAllCombinations(int** numbers, char** operators) {
   int nums[9] = {1,2,3,4,5,6,7,8,9};
    int i,j,k,l,m,n,o,p,a,b,c,d;
    char op[4] = { '+','-','*','/' };
    char op1,op2,op3;
    int count = 0;
    
    for (i=0; i<9; i++) 
    {
        a = nums[i];
        for (j=0; j<9; j++) 
        {
            b = nums[j];
            for (k=0; k<9; k++) 
            {
                c = nums[k];
                for (l=0; l<9; l++) 
                {
                    d = nums[l];
                    for (m=0; m<4; m++) 
                    {
                        operators[m][0]=op[m];
                        op1 = op[m];
                        for (n=0; n<4; n++) 
                        {
                            operators[n][0]=op[n];
                            op2 = op[n];
                            for (o=0; o<4; o++) 
                            {
                                operators[o][0]=op[o];
                                op3 = op[o];
                                if (op1=='/' && a/b!=0) continue;
                                if (op2=='/' && b/c!=0) continue;
                                if (op3=='/' && c/d!=0) continue;
                                if (op1=='+' || op1=='-' || op1=='*' || op1=='/')
                                    if (op2=='+' || op2=='-' || op2=='*' || op2=='/')
                                        if (op3=='+' || op3=='-' || op3=='*' || op3=='/')
                                            if (evaluate(a,b,c,d,op1,op2,op3)==24) 
                                            {
                                                numbers[count][0] = a;
                                                numbers[count][1] = b;
                                                numbers[count][2] = c;
                                                numbers[count][3] = d;
                                                count++;
                                            }
                                        
                                    
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

int evaluate(int a, int b, int c, int d, char op1, char op2, char op3) {
    int result;
    if (op1 == '+' && op2 == '+') {
        result = a + b + c + d;
    }
    else if (op1 == '+' && op2 == '-') {
        result = a + b - c - d;
    }
    else if (op1 == '+' && op2 == '*') {
        result = a + b * c * d;
    }
    else if (op1 == '+' && op2 == '/') {
        result = a + b * c / d;
    }
    else if (op1 == '-' && op2 == '+') {
        result = a - b + c + d;
    }
    else if (op1 == '-' && op2 == '-') {
        result = a - b - c - d;
    }
    else if (op1 == '-' && op2 == '*') {
        result = a - b * c * d;
    }
    else if (op1 == '-' && op2 == '/') {
        result = a - b * c / d;
    }
    else if (op1 == '*' && op2 == '+') {
        result = a * b + c + d;
    }
}


   
                           

int main()
{
#if ENABLE_TESTS > 0
    run_tests(true);
#endif


    int digits[4];
    int i;
    srand(time(NULL));

    for (i = 0; i < 4; i++) {
        if (rand()%10!=0)
            digits[i] = rand() % 10;
    }

    printf("The randomly selected digits are: %d %d %d %d. Please write the operations you want to do:\n", digits[0], digits[1], digits[2], digits[3]);



    return 0;
    return 0;

}
