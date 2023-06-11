#include "SortedBagIterator.h"
#include "SortedBag.h"
#include <exception>

using namespace std;

SortedBagIterator::SortedBagIterator(const SortedBag& b) : bag(b) {
	currentElementIndex = 0;
	int capacity = bag.size();
	elements = new ElementFrequency[capacity];
	int index = 0;

	for (int i = 0; i < bag.elements.capacity(); i++) {
		int current = bag.head[i];
		while (current != -1) {
			elements[index].element = bag.elements[current].element;
			elements[index].frequency = bag.elements[current].frequency;
			index++;
			current = bag.elements[current].next;
		}
	}

	for (int i = 0; i < capacity - 1; i++) {
		for (int j = 0; j < capacity - i - 1; j++) {
			if (elements[j].element > elements[j + 1].element) {
				ElementFrequency temp = elements[j];
				elements[j] = elements[j + 1];
				elements[j + 1] = temp;
			}
		}
	}
	currentElementIndex = 0;
}

TComp SortedBagIterator::getCurrent() {
	if (valid()) {
		return bag.elements[currentElementIndex].element;
	}
	return NULL_TCOMP;
}

bool SortedBagIterator::valid() {
	return currentElementIndex < bag.size();
}

void SortedBagIterator::next() {
	if (valid()) {
		currentElementIndex++;
	}
}

void SortedBagIterator::first() {
	currentElementIndex = 0;
}

SortedBagIterator::~SortedBagIterator() {
	delete[] elements;
}

