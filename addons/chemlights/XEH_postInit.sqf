#include "script_component.hpp"

if (!hasInterface) exitWith {};

["firedPlayer", DFUNC(throwEH)] call EFUNC(common,addEventHandler);
["firedPlayerNonLocal", DFUNC(throwEH)] call EFUNC(common,addEventHandler);
["firedNonPlayer", DFUNC(throwEH)] call EFUNC(common,addEventHandler);
