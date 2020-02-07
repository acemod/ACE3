#include "script_component.hpp"


if (hasInterface) then {
#include "initKeybinds.sqf"

    GVAR(pfID) = -1;

    ["ace_settingsInitialized", {
//        ["weapon", LINKFUNC(weaponSwitch), false] call CBA_fnc_addPlayerEventHandler;
//        ["vehicle", LINKFUNC(showVehicleHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

    }] call CBA_fnc_addEventHandler;
};

