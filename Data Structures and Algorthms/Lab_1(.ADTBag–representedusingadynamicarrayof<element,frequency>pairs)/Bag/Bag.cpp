#include "Bag.h"
#include "BagIterator.h"
#include <exception>
#include <iostream>
#include <utility>
using namespace std;


Bag::Bag() {
	cap = 1;
	s = 0;
	elem = new TElem[cap];
	freq = new TElem[cap];
}
//theta(1)

void Bag::add(TElem elem) {
	for (int i = 0; i < s; i++) {
		if (this->elem[i] == elem) {
			this->freq[i]++;
			return;
		}
	}
	if (s >= cap) {
		cap *= 2;
		TElem* newElem = new TElem[cap];
		TElem* newFreq = new TElem[cap];
		for (int i = 0; i < s; i++) {
			newElem[i] = this->elem[i];
			newFreq[i] = this->freq[i];
		}
		delete[] this->elem;
		delete[] this->freq;
		this->elem = newElem;
		this->freq = newFreq;
	}
	this->elem[s] = elem;
	this->freq[s] = 1;
	s++;
}
//theta(s)


bool Bag::remove(TElem elem) {
	for (int i = 0; i < s; i++) {
		if (this->elem[i] == elem) {
			if (freq[i] > 1) {
				freq[i]--;
				return true;
			}
			else {
				for (int j = i + 1; j < s; j++) {
					this->elem[j - 1] = this->elem[j];
					this->freq[j - 1] = freq[j];
				}
				s--;
				return true;
			}
		}

	}
	return false;
}
//theta(s)


bool Bag::search(TElem elem) const {
	for (int i = 0; i < s; i++) {
		if (this->elem[i] == elem) {
			return true;
		}
	}
	return false; 
}
//theta(s)

int Bag::nrOccurrences(TElem elem) const {
	for (int i = 0; i < s; i++) {
		if (this->elem[i] == elem) {
			return this->freq[i];
		}
	}
	return 0;
}
//theta(s)

int Bag::size() const {
	int count = 0;
	for (int i = 0; i < s; i++) {
		count += freq[i];
	}
	return count;
}
//theta(s)


bool Bag::isEmpty() const {
	if (s == 0) {
		return true;
	}
	else {
		return false;
	}
}
//theta(1)

BagIterator Bag::iterator() const {
	return BagIterator(*this);
}
//theta(1)


Bag::~Bag() {
	delete[] elem;
	delete[] freq;
}
//theta(1)

