#include "game.h"
#include <iostream>

int main() {
    CharacterTest::runAll();
    WizardTest::runAll();
    KnightTest::runAll();
    std::cout << "\nAll tests passed!\n";
    return 0;
}