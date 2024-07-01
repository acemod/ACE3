#include "script_component.hpp"

if (!hasInterface || !GVAR(enabled)) exitWith {};

GVAR(cachedCasings) = createHashMap;
GVAR(cachedMagazines) = createHashMap;
GVAR(casings) = [];
["CAManBase", "FiredMan", LINKFUNC(createCasing)] call CBA_fnc_addClassEventHandler;
[QGVAR(reloaded), "Reloaded", LINKFUNC(createMagazine)] call EFUNC(common,addPlayerEH);
