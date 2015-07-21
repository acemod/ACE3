#include "script_component.hpp"
//#include "initKeybinds.sqf";

// Add interaction menu exception
["isNotSpectating", {!((_this select 0) getVariable [QGVAR(isSpectator), false])}] call EFUNC(common,addCanInteractWithCondition);

// Run spectator framework if enabled
["SettingsInitialized", {
    if !(hasInterface) exitWith {};

    /*if (GVAR(tracking)) then {
        [FUNC(checkUnits), 2] call CBA_fnc_addPerFrameHandler;
        [FUNC(trackUnits), 20] call CBA_fnc_addPerFrameHandler;
    };*/
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);
    GVAR(camMode) = GVAR(availableModes) select 0;

    if (GVAR(system)) then {
        // Add event handlers to correctly enter spectator upon death
        player addEventHandler ["Killed", FUNC(handleKilled)];
        player addEventHandler ["Respawn", FUNC(handleRespawn)];
    };
}] call EFUNC(common,addEventHandler);
