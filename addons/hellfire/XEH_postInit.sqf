#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(pfID) = -1;

["ace_settingsInitialized", {
    ["turret", LINKFUNC(showHud), false] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", LINKFUNC(showHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag
}] call CBA_fnc_addEventHandler;
