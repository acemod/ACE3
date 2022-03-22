#include "script_component.hpp"

if (!hasInterface || !(GVAR(enabled))) exitWith {};

GVAR(casings) = createHashMap;
GVAR(casingsArr) = [];
["CAManBase", "FiredMan", {call FUNC(createCasing)}] call CBA_fnc_addClassEventHandler;
