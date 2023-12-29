#include "script_component.hpp"

if (!hasInterface || !GVAR(enabled)) exitWith {};

GVAR(cachedCasings) = createHashMap;
GVAR(casings) = [];
["CAManBase", "FiredMan", LINKFUNC(createCasing)] call CBA_fnc_addClassEventHandler;
