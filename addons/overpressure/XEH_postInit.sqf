#include "script_component.hpp"

["ace_overpressure", FUNC(overpressureDamage)] call CBA_fnc_addEventHandler;

// Register fire event handler
["ace_firedPlayer", DFUNC(firedEHBB)] call CBA_fnc_addEventHandler;
["ace_firedPlayerVehicle", DFUNC(firedEHOP)] call CBA_fnc_addEventHandler;
