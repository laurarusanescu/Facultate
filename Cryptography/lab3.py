import math
import random

# Pollards p − 1 algorithm is repeatedly raising a randomly chosen integer to
# successively larger powers and checking for common divisors with the target number, aiming to find not-trivial factors.
def pollards_p_minus_1(n, B=None) :
    if B is None :
        B = math.isqrt (n)  # Implicit bound if B is not provided

    a = random.randint (2, B)  # Randomly choose a starting point

    # Pollard's p − 1 algorithm
    for j in range (2, B + 1) :
        a = pow (a, j, n)  # Compute a^j mod n
        d = math.gcd (a - 1, n)
        if 1 < d < n :
            return d  # Found a non-trivial factor

    return None  # No factor found within the specified bound


if __name__ == "__main__" :
    try :
        number_to_factorize = int (input ("Enter the number to factorize: "))
        factor = pollards_p_minus_1 (number_to_factorize)

        if factor :
            print (f"A non-trivial factor of {number_to_factorize} is: {factor}")
        else :
            print (f"{number_to_factorize} is likely a prime number.")

    except ValueError :
        print ("Invalid input. Please enter a valid integer.")
