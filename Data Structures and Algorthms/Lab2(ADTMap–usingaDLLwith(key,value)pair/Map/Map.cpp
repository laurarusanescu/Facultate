#include "Map.h"
#include "MapIterator.h"

Map::Map() {
    head = nullptr;
    tail = nullptr;
    count = 0;
}

Map::~Map() {
    Node* current = head;
    while (current != nullptr) {
        Node* next = current->next;
        delete current;
        current = next;
    }
}

int Map::add(int key, int value) {
    Node* current = head;
    while (current != nullptr) {
        if (current->key == key) {
            int oldValue = current->value;
            current->value = value;
            return oldValue;
        }
        current = current->next;
    }

    Node* newNode = new Node(key, value);
    if (head == nullptr) {
        head = newNode;
        tail = newNode;
    }
    else {
        newNode->prev = tail;
        tail->next = newNode;
        tail = newNode;
    }


    count++;
    return 0; 
}

int Map::search(int key) const {
    Node* current = head;
    while (current != nullptr) {
        if (current->key == key) {
            return current->value;
        }
        current = current->next;
    }
    return NULL_TVALUE;
}

int Map::remove(int key) {
    Node* current = head;
    while (current != nullptr) {
        if (current->key == key) {
            TValue value = current->value;

            if (current == head && current == tail) {
                head = nullptr;
                tail = nullptr;
            }
            else if (current == head) {
                head = current->next;
                head->prev = nullptr;
            }
            else if (current == tail) {
                tail = current->prev;
                tail->next = nullptr;
            }
            else {
                current->prev->next = current->next;
                current->next->prev = current->prev;
            }

            delete current;
            count--;
            return value;
        }
        current = current->next;
    }
    return NULL_TVALUE;
}

int Map::size() const {
    return count;
}

bool Map::isEmpty() const {
    return count == 0;
}

MapIterator Map::iterator() const {
    return MapIterator(*this);
}
