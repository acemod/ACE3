#include "script_component.hpp"

// clan logos are not used in singleplayer
if (!isMultiplayer) exitWith {};

["CBA_settingsInitialized", {
    TRACE_1("settingsInit eh",GVAR(enabled));

    if (isServer && {GVAR(enabled)}) then {
        ["LandVehicle", "initPost", LINKFUNC(removeClanLogo), true, [], true] call CBA_fnc_addClassEventHandler;
        ["Air", "initPost", LINKFUNC(removeClanLogo), true, [], true] call CBA_fnc_addClassEventHandler;
        ["Ship", "initPost", LINKFUNC(removeClanLogo), true, [], true] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;
