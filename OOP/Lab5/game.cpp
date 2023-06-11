#include "game.h"
#include <iostream>
#include <cassert>
#define GREEN "\033[0;32m"
#define NC "\033[0m"

//CLASS CHARACTER
Character::Character(const std::string& name, int health, int level)
    : m_name(name), m_health(health), m_level(level)
{
}

//GETTERS AND SETTERS FOR NAME, HEALTH AND LEVEL
const std::string& Character::getName() const
{
    return m_name;
}

void Character::setName(const std::string& name)
{
    m_name = name;
}

int Character::getHealth() const
{
    return m_health;
}

void Character::setHealth(int health)
{
    m_health = health;
}

int Character::getLevel() const
{
    return m_level;
}

void Character::setLevel(int level)
{
    m_level = level;
}


//SUB-CLASS WIZARD
Wizard::Wizard(const std::string& name, int health, int level, int mana, int spellPower)
    : Character(name, health, level), m_mana(mana), m_spellPower(spellPower)
{
}

int Wizard::getMana() const
{
    return m_mana;
}

void Wizard::setMana(int mana)
{
    m_mana = mana;
}

int Wizard::getSpellPower() const
{
    return m_spellPower;
}

void Wizard::setSpellPower(int spellPower)
{
    m_spellPower = spellPower;
}

bool Wizard::castSpell(const std::string& spell)
{
    bool found = false;
    for (const auto& knownSpell : m_spells) {
        if (knownSpell == spell) {
            found = true;
            break;
        }
    }

    if (!found || m_mana < 10) {
        return false;
    }

    m_mana -= 10;
    return true;
}

std::vector<std::string>& Wizard::getSpells()
{
    return m_spells;
}

//SUB-CLASS KNIGHT
Knight::Knight(const std::string& name, int health, int level, double armor, int swordDamage)
    : Character(name, health, level), m_armor(armor), m_swordDamage(swordDamage)
{
}

double Knight::getArmor() const
{
    return m_armor;
}

void Knight::setArmor(double armor)
{
    m_armor = armor;
}

int Knight::getSwordDamage() const
{
    return m_swordDamage;
}

void Knight::setSwordDamage(int swordDamage)
{
    m_swordDamage = swordDamage;
}

void Knight::takeDamage(int damage)
{
    m_armor -= damage;
    if (m_armor < 0) {
        m_health += m_armor;
        m_armor = 0;
    }
    if (m_health < 0) {
        m_health = 0;
    }
}

//TESTS FOR CHARACTER
void CharacterTest::testSetName() {
    Character c("Amalia", 100, 78);
    assert(c.getName() == "Amalia");
    c.setName("Mirabela");
    assert(c.getName() == "Mirabela");
}

void CharacterTest::testSetHealth() {
    Character c("Amalia", 100, 78);
    assert(c.getHealth() == 100);
    c.setHealth(68);
    assert(c.getHealth() == 68);
}

void CharacterTest::testSetLevel() {
    Character c("Amalia", 100, 78);
    assert(c.getLevel() == 78);
    c.setLevel(228);
    assert(c.getLevel() == 228);
}

void CharacterTest::runAll() {
    testSetName();
    std::cout << "Test Set_Name: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testSetHealth();
    std::cout << "Test Set_Health: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testSetLevel();
    std::cout << "Test Set_Level: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
}

//TESTS FOR WIZARD
void WizardTest::testSetMana() {
    Wizard w("Amalia", 100, 78, 100, 16);
    assert(w.getMana() == 100);
    w.setMana(98);
    assert(w.getMana() == 98);
}

void WizardTest::testSetSpellPower() {
    Wizard w("Amalia", 100, 78, 100, 16);
    assert(w.getSpellPower() == 16);
    w.setSpellPower(21);
    assert(w.getSpellPower() == 21);
}

void WizardTest::testCastSpell() {
    Wizard w("Amalia", 100, 78, 100, 16);
    assert(w.castSpell("curse"));
    assert(w.castSpell("charm"));
    assert(w.castSpell("andabm") == false);
    Wizard w2("Maria", 100, 23, 7, 17);
    assert(w2.castSpell("charm") == false); //Maria has less than 10 mana
}

void WizardTest::runAll() {
    testSetMana();
    std::cout << "Test Set_Mana: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testSetSpellPower();
    std::cout << "Test Set_Spell_Power: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testCastSpell();
    std::cout << "Test Cast_Spell: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
}

//TESTS FOR KNIGHT
void KnightTest::testSetArmor() {
    Knight k("Amalia", 100, 78, 34, 10);
    assert(k.getArmor() == 34);
    k.setArmor(40);
    assert(k.getArmor() == 40);
}

void KnightTest::testSetSwordDamage() {
    Knight k("Amalia", 100, 78, 34, 10);
    assert(k.getSwordDamage() == 10);
    k.setSwordDamage(40);
    assert(k.getSwordDamage() == 40);
}

void KnightTest::testTakeDamage() {
    Knight k("Amalia", 100, 78, 34, 10);
    k.takeDamage(10);
    assert(k.getArmor() == 24);
    k.takeDamage(120);
    assert(k.getArmor() == 0);
    assert(k.getHealth() == 4);
    k.takeDamage(20);
    assert(k.getHealth() == 0);
}

void KnightTest::runAll() {
    testSetArmor();
    std::cout << "Test Set_Armour: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testSetSwordDamage();
    std::cout << "Test Set_Sword_Damage: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
    testTakeDamage();
    std::cout << "Test Take_Damage: " << GREEN; std::cout << "PASSED!"; std::cout << '\n' << NC;
}