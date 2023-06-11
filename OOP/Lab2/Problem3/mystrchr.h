#pragma once

const char* my_strchr(const char* s, char character) {
    while (*s != '\0') {
        if (*s == character) {
            return (char*)s;
        }
        s++;
    }
    if (character == '\0') {
        return (char*)s;
    }
    return NULL;
}