#include "script_component.hpp"

if (!hasInterface || !(GVAR(casingsEnabled))) exitWith {};

GVAR(casings) = createHashMap;
GVAR(casingsArr) = [];
["CAManBase", "FiredMan", {call FUNC(createCase)}] call CBA_fnc_addClassEventHandler;
