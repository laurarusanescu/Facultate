#pragma once
#include <string>

#include <string>
#include <vector>

class Character {
public:
    Character(const std::string& name, int health, int level);
    virtual ~Character() = default;

    const std::string& getName() const;
    void setName(const std::string& name);

    int getHealth() const;
    void setHealth(int health);

    int getLevel() const;
    void setLevel(int level);

protected:
    std::string m_name;
    int m_health;
    int m_level;

private:
    // the tester class is a friend of the Character class
    friend class CharacterTest;
};

class Wizard : public Character {
public:
    Wizard(const std::string& name, int health, int level, int mana, int spellPower);
    ~Wizard() override = default;

    int getMana() const;
    void setMana(int mana);

    int getSpellPower() const;
    void setSpellPower(int spellPower);

    bool castSpell(const std::string& spell);

    std::vector<std::string>& getSpells();

private:
    int m_mana;
    int m_spellPower;
    std::vector<std::string> m_spells = {"curse", "charm", "protect"};
    friend class WizardTest;
};

class Knight : public Character {
public:
    Knight(const std::string& name, int health, int level, double armor, int swordDamage);
    ~Knight() override = default;

    double getArmor() const;
    void setArmor(double armor);

    int getSwordDamage() const;
    void setSwordDamage(int swordDamage);

    void takeDamage(int damage);

private:
    double m_armor;
    int m_swordDamage;
    friend class KnightTest;
};

//TEST CLASS
class CharacterTest {
public:
    static void testSetName();
    static void testSetHealth();
    static void testSetLevel();
    static void runAll();
};

//TEST SUB-CLASS
class WizardTest {
public:
    static void testSetMana();
    static void testSetSpellPower();
    static void testCastSpell();
    static void runAll();
};

class KnightTest {
public:
    static void testSetArmor();
    static void testSetSwordDamage();
    static void testTakeDamage();
    static void runAll();
};
