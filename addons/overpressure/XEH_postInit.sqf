#include "script_component.hpp"

["overpressure", FUNC(overpressureDamage)] call CBA_fnc_addEventHandler;

// Register fire event handler
["firedPlayer", DFUNC(firedEHBB)] call CBA_fnc_addEventHandler;
["firedPlayerVehicle", DFUNC(firedEHOP)] call CBA_fnc_addEventHandler;
