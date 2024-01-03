# Function to find the greatest common divisor (GCD) of two numbers
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

# Function to check if a number is prime
def is_prime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

# Function to check if a number is a Carmichael candidate
def is_carmichael_candidate(n):
    # Carmichael candidates must be odd, composite, and square-free.
    if n % 2 == 0 or is_prime(n):
        return False

    for a in range(2, n):
        if gcd(a, n) != 1:
            continue
        if pow(a, n - 1, n) != 1:
            return False

    return True

# Function to find Carmichael numbers up to a given bound
def find_carmichael_numbers(bound):
    carmichael_numbers = []
    for n in range(561, bound + 1):  # 561 is the smallest known Carmichael number
        if is_carmichael_candidate(n):
            carmichael_numbers.append(n)
    return carmichael_numbers

if __name__ == "__main__":
    upper_bound = int(input("Enter the upper bound: "))
    carmichael_numbers = find_carmichael_numbers(upper_bound)

    if carmichael_numbers:
        print("Carmichael numbers less than or equal to", upper_bound, "are:")
        for number in carmichael_numbers:
            print(number)
    else:
        print("No Carmichael numbers found in the specified range.")
