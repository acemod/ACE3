#include "script_component.hpp"

//["flashbangExplosion", {_this call FUNC(flashbangExplosionEH)}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitWith {};

// Register fire event handler
["firedPlayer", DFUNC(throwChemlight)] call EFUNC(common,addEventHandler);
["firedPlayerNonLocal", DFUNC(throwChemlight)] call EFUNC(common,addEventHandler);
["firedNonPlayer", DFUNC(throwChemlight)] call EFUNC(common,addEventHandler);
