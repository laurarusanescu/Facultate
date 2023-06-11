#include "SortedBag.h"
#include "SortedBagIterator.h"

SortedBag::SortedBag(Relation r) : relation(r), head(-1), tail(-1), firstEmpty(-1), count(0) {
	elements.reserve(10);
	for (int i = 0; i < 10; i++) {
		elements[i].element = NULL_TCOMP;
		elements[i].frequency = 0;
		elements[i].next = i + 1;
	}
	elements[9].next = -1;
}

int SortedBag::hashFunction(TComp e) const {
	return abs(e) % elements.capacity();
}

int SortedBag::findNode(TComp e) const {
	int index = hashFunction(e);
	int current = head;
	while (current != -1 && elements[current].element != e) {
		current = elements[current].next;
	}
	return current;
}

void SortedBag::resize() {
	int newCapacity = elements.capacity() * 2;
	elements.reserve(newCapacity);
	for (int i = elements.capacity(); i < newCapacity; i++) {
		elements[i].element = NULL_TCOMP;
		elements[i].frequency = 0;
		elements[i].next = i + 1;
	}
	elements[newCapacity - 1].next = -1;
}

void SortedBag::add(TComp e) {
	if (head == -1) {
		int index = firstEmpty;
		firstEmpty = elements[firstEmpty].next;
		elements[index] = { e, 1, -1 };
		head = tail = index;
		count++;
		return;
	}

	int current = head;
	int prev = -1;
	while (current != -1 && !relation(elements[current].element, e)) {
		prev = current;
		current = elements[current].next;
	}

	if (current != -1 && elements[current].element == e) {
		elements[current].frequency++;
		count++;
		return;
	}

	if (firstEmpty == -1) {
		resize();
	}

	int newIndex = firstEmpty;
	firstEmpty = elements[firstEmpty].next;
	elements[newIndex] = { e, 1, current };

	if (current == -1) {
		elements[prev].next = newIndex;
		tail = newIndex;
	}
	else {
		if (prev == -1) {
			head = newIndex;
		}
		else {
			elements[prev].next = newIndex;
		}
	}

	count++;
}

bool SortedBag::remove(TComp e) {
	if (head == -1) {
		return false;
	}

	int current = head;
	int prev = -1;
	while (current != -1 && elements[current].element != e) {
		prev = current;
		current = elements[current].next;
	}

	if (current == -1) {
		return false;
	}

	if (elements[current].frequency > 1) {
		elements[current].frequency--;
		count--;
		return true;
	}

	if (prev == -1) {
		head = elements[current].next;
	}
	else {
		elements[prev].next = elements[current].next;
	}

	if (current == tail) {
		tail = prev;
	}

	elements[current].next = firstEmpty;
	firstEmpty = current;

	count-- ;
	return true;
}

bool SortedBag::search(TComp e) const {
	return findNode(e) != -1;
}

int SortedBag::nrOccurrences(TComp e) const {
	int current = findNode(e);
	if (current == -1) {
		return 0;
	}
	return elements[current].frequency;
}

int SortedBag::size() const {
	return count;
}

SortedBagIterator SortedBag::iterator() const {
	return SortedBagIterator(*this);
}

bool SortedBag::isEmpty() const {
	return count == 0;
}

SortedBag::~SortedBag() {
	// TODO: Cleanup code, if any (e.g., deallocate memory)
}