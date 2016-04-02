#include "script_component.hpp"

["overpressure", FUNC(overpressureDamage)] call CFUNC(addEventHandler);

// Register fire event handler
["firedPlayer", DFUNC(firedEHBB)] call CFUNC(addEventHandler);
["firedPlayerVehicle", DFUNC(firedEHOP)] call CFUNC(addEventHandler);
