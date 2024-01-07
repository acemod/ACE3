#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    GVAR(cachedCasings) = createHashMap;
    GVAR(caselessWeapons) = createHashMap;
    GVAR(casings) = [];

    {

    } forEach ((toString {getText (_x >> "cartridgePos")}))

    ["CAManBase", "FiredMan", LINKFUNC(createCasing)] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
