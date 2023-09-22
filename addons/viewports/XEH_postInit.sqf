#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(pfeh) = -1;
["CBA_settingsInitialized", {
    TRACE_1("CBA_settingsInitialized",GVAR(enabled));
    ["vehicle", LINKFUNC(enterVehicle), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
