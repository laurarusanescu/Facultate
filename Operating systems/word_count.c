#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int countWords(const char *line) {
    int count = 0;
    int inWord = 0; // Flag to track if currently inside a word
    while (*line) {
        if (isspace(*line)) {
            inWord = 0;
        } else if (!inWord) {
            count++;
            inWord = 1;
        }
        line++;
    }
    return count;
}

int main() {
    FILE *file;
    char filename[100];
    char line[1000];

    printf("Enter the name of the file: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    while (fgets(line, sizeof(line), file)) {
        int wordCount = countWords(line);
        printf("Line has %d words.\n", wordCount);
    }

    fclose(file);

    return 0;
}
