#pragma once
#include "EntityType.h"
#include "SimulationGrid.h"

class Entity
{
public:
	// TODO make pure abstract method
	EntityType what() {
		return EntityType::EMPTY;
	}
protected:
	 int row;
	 int col;

	void demographics(unsigned int population[], const SimulationGrid& g);
private:
};

