import random

def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a

def multiplicative_inverse(e, phi):
    # multiplicative inverse : ed≡1(mod phi)
    d = 0
    x1 = 0
    x2 = 1
    y1 = 1
    temp_phi = phi

    while e > 0:
        temp1 = temp_phi // e
        temp2 = temp_phi - temp1 * e
        temp_phi = e
        e = temp2

        x = x2 - temp1 * x1
        y = d - temp1 * y1

        x2 = x1
        x1 = x
        d = y1
        y1 = y

    if temp_phi == 1:
        return d + phi

def is_prime(num):
    if num == 2:
        return True
    if num < 2 or num % 2 == 0:
        return False
    for n in range(3, int(num ** 0.5) + 2, 2):
        if num % n == 0:
            return False
    return True

def generate_keypair():
    """Generate two random primes"""
    # Select random prime numbers p and q
    p = random.choice([i for i in range(100, 1000) if is_prime(i)])
    q = random.choice([i for i in range(100, 1000) if is_prime(i)])

    print("p =", p)
    print("q =", q)

    # Calculate n and Euler's function (phi)
    n = p * q
    phi = (p - 1) * (q - 1)

    # Choose a random public exponent e
    e = random.randrange(1, phi)
    g = gcd(e, phi)

    # Ensure e and phi(n) are coprime
    while g != 1:
        e = random.randrange(1, phi)
        g = gcd(e, phi)

    # Calculate the private exponent d
    d = multiplicative_inverse(e, phi)

    return ((e, n), (d, n))

def encrypt(pk, plaintext):
    key, n = pk
    # Encrypt each character in plaintext using public key
    ciphertext = [(ord(char) ** key) % n for char in plaintext]
    # Map encrypted characters back to alphabet letters
    encrypted_letters = [chr(ciphertext_char % 26 + ord('A')) for ciphertext_char in ciphertext]
    print("Encrypted message: " + ''.join(encrypted_letters))
    return ciphertext

def decrypt(pk, ciphertext):
    key, n = pk
    # Decrypt each character in ciphertext using private key
    decrypted = [chr((char ** key) % n) for char in ciphertext]
    return ''.join(decrypted)

def print_hi(name):
    print("RSA Encrypter/Decrypter")

    public, private = generate_keypair ()

    print ("Your public key is", public)
    print ("Your private key is", private)

    # Take user input for a message to encrypt with the public key
    print("message to encrypt : Mara are 10 mere cu scortisoara.")
    encrypted_msg = encrypt (public, "Mara are 10 mere cu scortisoara.")

    # Decrypt the encrypted message using the private key
    decrypted_msg = decrypt (private, encrypted_msg)
    print ("Decrypted message with private key :")
    print ("Your decrypted message is:", decrypted_msg)

    # Generate public and private key pairs
    public, private = generate_keypair()

    print("Your public key is", public)
    print("Your private key is", private)

    # Take user input for a message to encrypt with the public key
    message = input("Enter a message to encrypt with your public key: ")
    encrypted_msg = encrypt(public, message)

    # Decrypt the encrypted message using the private key
    decrypted_msg = decrypt(private, encrypted_msg)
    print("Decrypting message with private key...")
    print("Your decrypted message is:", decrypted_msg)

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')