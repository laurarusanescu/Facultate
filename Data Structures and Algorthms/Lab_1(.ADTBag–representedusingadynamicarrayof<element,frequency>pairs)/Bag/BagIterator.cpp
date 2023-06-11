#include <exception>
#include "BagIterator.h"
#include "Bag.h"

using namespace std;


BagIterator::BagIterator(const Bag& c): bag(c)
{
	current = 0;
}

void BagIterator::first() {
	current = 0;
}


void BagIterator::next() {
	
}


bool BagIterator::valid() const {
	return current < bag.size();
}



TElem BagIterator::getCurrent() const{
	if (valid()) {
		return this->bag.elem[current];
	}
}
