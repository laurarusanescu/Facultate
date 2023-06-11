#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <limits.h>
#include "tests.h"

// Write a function that takes as an input an array of integer numbers (both positive and negative numbers and returns the value of the triplet with the maximum product, as well as the elements that form this triplet (in increasing order). 
// Use pass by pointer/address to return the elements that form that triplet. 
// Think about the appropriate data type for the result. If the size of the array is less than 3, you should return the minimum
// representable value of the data type and the elements that form the triplet should be set to 0.
long long int computeMaxTriplet(long int arr[], unsigned int sz, long int *t1, long int* t2,long int* t3){
    //unsigned int n;
    //printf("Enter the number of elements: ");
    //scanf("%u", &n);
    //for (int i = 0; i < n; i++)
        //scanf("%d", &arr[i]);
    if (sz < 3)
    {
        *t1 = 0;
        *t2 = 0;
        *t3 = 0;
        long long prod = LLONG_MIN;
        printf("The array has less than 3 elements. Application will now stop.\n ");
        return prod;
    }
    else
    {
        long long int maxx = LLONG_MIN;
        for (int i = 0; i < sz; i++)
            for (int j = 0; j < sz; j++)
                for (int k = 0; k < sz; k++)
                    if (i != j && j != k && k != i)
                        if (arr[i] * arr[j] * arr[k] > maxx)
                        {
                            maxx = arr[i] * arr[j] * arr[k];
                            *t1 = arr[i];
                            *t2 = arr[j];
                            *t3 = arr[k];

                            if (*t1 > *t2) { *t2 = arr[i]; *t1 = arr[j]; }
                            if (*t2 > *t3)
                            {
                                *t3 = *t2;
                                *t2 = arr[k];
                                if (*t1 > *t2)
                                {
                                    *t2 = *t1;
                                    *t1 = arr[k];
                                }
                            }
                        }

        long long int prod = maxx;
        printf("The maximum triplet is(%d, %d, %d) with a product of %lld\n", *t1, *t2, *t3, prod);
        return prod;


    }
    
    return 0;
}

int main()
{
#if ENABLE_TESTS > 0
    run_tests(true);
#endif
    
    return 0;
}
