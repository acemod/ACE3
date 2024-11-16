#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_firedPlayer", LINKFUNC(throwEH)] call CBA_fnc_addEventHandler;
// ["ace_firedPlayerNonLocal", LINKFUNC(throwEH)] call CBA_fnc_addEventHandler;
// ["ace_firedNonPlayer", LINKFUNC(throwEH)] call CBA_fnc_addEventHandler;
