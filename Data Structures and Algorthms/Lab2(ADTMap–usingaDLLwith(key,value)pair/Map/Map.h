#pragma once
#include <utility>
//DO NOT INCLUDE MAPITERATOR


//DO NOT CHANGE THIS PART
typedef int TKey;
typedef int TValue;
typedef std::pair<TKey, TValue> TElem;
#define NULL_TVALUE -111111
#define NULL_TELEM pair<TKey, TValue>(-111111, -111111)
class MapIterator;

class Node {
public:
    int key;
    int value;
    Node* prev;
    Node* next;

    Node(int key, int value, Node* prev = nullptr, Node* next = nullptr)
        : key(key), value(value), prev(prev), next(next) {}
};

class Map {
    friend class MapIterator;
private:
    Node* head;
    Node* tail;
    int count;

public:
    // implicit constructor
    Map();

    // adds a pair (key, value) to the map
    // if the key already exists in the map, then the value associated with the key is replaced by the new value
    // and the old value is returned
    // if the key does not exist, a new pair is added and the value NULL_TVALUE is returned
    int add(int key, int value);

    // searches for the key and returns the value associated with the key if the map contains the key
    // or NULL_TVALUE otherwise
    int search(int key) const;

    // removes a key from the map and returns the value associated with the key if the key existed
    // or NULL_TVALUE otherwise
    int remove(int key);

    // returns the number of pairs (key, value) in the map
    int size() const;

    // checks whether the map is empty or not
    bool isEmpty() const;

    // returns an iterator for the map
    MapIterator iterator() const;

    // destructor
    ~Map();
};



