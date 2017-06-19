#include "script_component.hpp"
//#include "initKeybinds.sqf";

// Add interaction menu exception
["isNotSpectating", {!(GETVAR((_this select 0),GVAR(isStaged),false))}] call EFUNC(common,addCanInteractWithCondition);

["ace_settingsInitialized", {
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);
}] call CBA_fnc_addEventHandler;

// Create a radio channel for any spectators to text chat in
if (isServer) then {
    GVAR(channel) = radioChannelCreate [[0.729,0.149,0.098,1],"Spectator","Spectator (%UNIT_NAME)",[]];
    publicVariable QGVAR(channel);
};

// Should prevent unending spectator on mission end
if (isServer) then {
    addMissionEventHandler ["Ended", {
        [QGVAR(endMission), []] call CBA_fnc_globalEvent;
    }];
};

[QGVAR(endMission), {
    if (GVAR(isSet)) then {
        [false] call FUNC(setSpectator);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(stageSpectator), FUNC(stageSpectator)] call CBA_fnc_addEventHandler;
