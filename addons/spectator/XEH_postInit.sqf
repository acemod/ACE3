#include "script_component.hpp"

["ace_settingsInitialized", {
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    // Create a radio channel for any spectators to text chat in
    GVAR(channel) = radioChannelCreate [[0.729,0.149,0.098,1],"Spectator","Spectator (%UNIT_NAME)",[]];
    publicVariable QGVAR(channel);

    // Used by the template to transfer zeus to virtual unit
    // Commands must be ran on server
    [QGVAR(transferZeus),{
        unassignCurator (_this select 1);

        // Can only re-assign when ready
        [
            {isNull getAssignedCuratorUnit (_this select 0)},
            {(_this select 0) assignCurator (_this select 1)},
            _this
        ] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addEventHandler;
};

// A virtual spectator cannot exist without an interface
if (hasInterface) then {
    // Local player (not ACE_Player) must be initalized to check
    [
        { !isNull player },
        {
            if (player isKindOf QGVAR(virtual)) then { [true] call FUNC(setSpectator); };
        }
    ] call CBA_fnc_waitUntilAndExecute;
};

["ace_spectator", {GETMVAR(GVAR(isSet),false)}] call CBA_fnc_registerFeatureCamera;
