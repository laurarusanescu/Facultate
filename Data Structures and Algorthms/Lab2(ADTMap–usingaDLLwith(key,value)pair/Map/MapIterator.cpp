#include "Map.h"
#include "MapIterator.h"
#include <exception>
using namespace std;


MapIterator::MapIterator(const Map& m) : map(m){
	current = m.head;
}

void MapIterator::first() {
	current = map.head;
}


void MapIterator::next() {
	if (current != nullptr) {
		current = current->next;
	}
}


TElem MapIterator::getCurrent(){
	if (current != nullptr) {
		return std::make_pair(current->key, current->value);
	}
	return NULL_TELEM;
}


bool MapIterator::valid() const {
	return current != nullptr;
}



