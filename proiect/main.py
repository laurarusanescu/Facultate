# This is a sample Python script.
from rsa_module import *
from rsa_module.RSA import *


# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    pass
    rsa = RSA()
    print(f"Public Key: (n={rsa.get_public_key()}, e={rsa.get_private_key()})")

    plaintext = input("Enter plaintext: ").upper()
    ciphertext = rsa.encrypt(plaintext)
    print (f"Encrypted Text: {ciphertext}")
    decrypted_text = rsa.decrypt(ciphertext)
    print (f"Decrypted Text: {decrypted_text}")

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
