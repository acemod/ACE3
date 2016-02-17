#include "script_component.hpp"

["overpressure", FUNC(overpressureDamage)] call EFUNC(common,addEventHandler);

// Register fire event handler
["firedPlayer", DFUNC(firedEHBB)] call EFUNC(common,addEventHandler);
["firedPlayerVehicle", DFUNC(firedEHOP)] call EFUNC(common,addEventHandler);
