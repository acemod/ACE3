#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"


GVAR(units) = [];
GVAR(openedContainers) = [objNull, objNull];

// Add "add" event handler in preInit to catch JIP events
[QGVAR(add), {
    params ["_unit", "_weaponsItems"];

    [_unit, _weaponsItems, true] call FUNC(add);
}] call CBA_fnc_addEventHandler;

[QGVAR(remove), {
    params ["_unit"];

    [_unit, true] call FUNC(remove);
}] call CBA_fnc_addEventHandler;

ADDON = true;
