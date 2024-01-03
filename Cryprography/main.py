import timeit
import random
import math

def euclidean_gcd(u, v):
    #this algorithm divides the greastes one by the lowest one untill v becomes 0
    while v:
        u, v = v, u % v
    return abs(u)

def factorization_gcd(u, v) :
    ## This function calculates the GCD of two numbers using prime factorization
    def prime_factors(n) :
        #finds the prime factors for u and v
        factors = set ()
        while n % 2 == 0 :
            factors.add (2)
            n //= 2
        for i in range (3, int (math.sqrt (n)) + 1, 2) :
            while n % i == 0 :
                factors.add (i)
                n //= i
        if n > 2 :
            factors.add (n)
        return factors

    factors_u = prime_factors (u)
    factors_v = prime_factors (v)

    #finds the common factors between u and v
    common_factors = factors_u.intersection (factors_v)

    gcd = 1
    #multiplies the untill it gets the greates commom divisor
    for factor in common_factors :
        gcd *= factor

    return gcd


def lehmer_gcd(u, v) :
    # Ensure both u and v are non-negative
    #au + cv = gcd(u, v)
    if u < 0 :
        u = -u
    if v < 0 :
        v = -v

    # Check if one of the numbers is zero; return the other one as the GCD
    if u == 0 :
        return v
    if v == 0 :
        return u

    # Initialize variables for Bézout coefficients
    a = 1
    b = 0
    c = 0
    d = 1

    # Start the extended Euclidean algorithm
    while v != 0 :
        # Calculate the quotient q
        q = u // v

        # Update u and v, similar to the standard Euclidean algorithm
        u, v = v, u - q * v

        # Update Bézout coefficients a, b, c, and d
        a, b = b, a - q * b
        c, d = d, c - q * d

    # Return the GCD and the Bézout coefficients (a and c)
    return u, a, c


# Function to measure the execution time of a GCD algorithm with given inputs
def measure_execution_time(algorithm, u, v):
    return timeit.timeit(lambda: algorithm(u, v), number=10000)
# Generate 10 pairs of random integers
input_values = [(random.randint(1, 1000), random.randint(1, 1000)) for _ in range(10)]

# Measure execution times for each algorithm with different inputs
euclidean_times = [measure_execution_time(euclidean_gcd, u, v) for u, v in input_values]
steins_times = [measure_execution_time(factorization_gcd, u, v) for u, v in input_values]
lehmer_times = [measure_execution_time(lehmer_gcd, u, v) for u, v in input_values]

# Print the execution times
print("Execution times (in seconds) for 10 different inputs:")
print("Euclidean GCD:")
for i, (u, v) in enumerate(input_values):
    print(u, v)
    print(euclidean_gcd(u, v))
    print(f"Input {i + 1}: {euclidean_times[i]:.6f} seconds")

print("Factorization GCD:")
for i, (u, v) in enumerate(input_values):
    print(u, v)
    print(factorization_gcd(u,v))
    print(f"Input {i + 1}: {steins_times[i]:.6f} seconds")

print("Lehmer's GCD:")
for i, (u, v) in enumerate(input_values):
    print(u, v)
    print(lehmer_gcd(u,v))
    print(f"Input {i + 1}: {lehmer_times[i]:.6f} seconds")



