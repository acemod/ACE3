#include "script_component.hpp"
//#include "initKeybinds.sqf";

// Add interaction menu exception
["isNotSpectating", {!(GETVAR((_this select 0),GVAR(isStaged),false))}] call EFUNC(common,addCanInteractWithCondition);

["SettingsInitialized", {
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);

    if !(hasInterface) exitWith {};

    if (GVAR(onDeath)) then {
        player addEventHandler ["Killed",FUNC(handleKilled)];
        player addEventHandler ["Respawn",FUNC(handleRespawn)];
    };
}] call EFUNC(common,addEventHandler);
