#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    ["turret", LINKFUNC(turretChanged), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
