#include "script_component.hpp"

["ace_settingsInitialized", {
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);
}] call CBA_fnc_addEventHandler;

// Create a radio channel for any spectators to text chat in
if (isServer) then {
    GVAR(channel) = radioChannelCreate [[0.729,0.149,0.098,1],"Spectator","Spectator (%UNIT_NAME)",[]];
    publicVariable QGVAR(channel);
};

[QGVAR(stageSpectator), FUNC(stageSpectator)] call CBA_fnc_addEventHandler;

// Initalise virtual spectators
[QGVAR(virtual),"initpost",{
    if !(GVAR(isSet)) then {
        // Delay until local player is fully initalized
        [
            { !isNil { player } && { !isNull player } },
            { if (player == _this) then {[true] call FUNC(setSpectator)}; },
            _this select 0
        ] call CBA_fnc_waitUntilAndExecute;
    };
},false,[],true] call CBA_fnc_addClassEventHandler;
