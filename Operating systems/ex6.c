#include <stdio.h>
#include <ctype.h>
#include <string.h>

void calculate_frequencies(const char *text, int frequencies[26]) {
    for (int i = 0; i < 26; i++) {
        frequencies[i] = 0;
    }

    for (int i = 0; text[i] != '\0'; i++) {
        // convert character to lowercase to make counting case-insensitive
        char ch = tolower(text[i]);

        // check if the character is a letter
        if (ch >= 'a' && ch <= 'z') {
            frequencies[ch - 'a']++;
        }
    }
}

void print_frequencies(const int frequencies[26]) {
    for (int i = 0; i < 26; i++) {
        if (frequencies[i] > 0) {
            printf("'%c': %d\n", i + 'a', frequencies[i]);
        }
    }
}

int main() {
    
    const char *text = "Hello, World! This is a simple example text to calculate letter frequencies.";
    
    int frequencies[26];
    calculate_frequencies(text, frequencies);
    print_frequencies(frequencies);

    return 0;
}
