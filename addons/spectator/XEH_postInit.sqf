#include "script_component.hpp"

["ace_settingsInitialized", {
    GVAR(availableModes) = [[0,1,2], [1,2], [0], [1], [2]] select GVAR(restrictModes);
    GVAR(availableVisions) = [[-2,-1,0,1], [-2,-1], [-2,0,1], [-2]] select GVAR(restrictVisions);

    if (GVAR(mapLocations)) then {
        private _worldWidth = worldSize / 2;
        {
            [locationPosition _x, [text _x] call CBA_fnc_capitalize] call FUNC(addLocation);
        } forEach nearestLocations [
            [_worldWidth, _worldWidth],
            ["NameVillage", "NameCity", "NameCityCapital", "NameLocal", "NameMarine"],
            _worldWidth * sqrt 2
        ];
    };
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

[QGVAR(stageSpectator), FUNC(stageSpectator)] call CBA_fnc_addEventHandler;

// Delay until local player (must not be ACE_Player) is fully initalized
[
    { !isNil { player } && { !isNull player } },
    {
        // Initalise virtual spectator players (must not be ACE_Player)
        [QGVAR(virtual),"initpost",{
            if !(GVAR(isSet)) then {
                if (player == (_this select 0)) then { [true] call FUNC(setSpectator) };
            };
        },false,[],true] call CBA_fnc_addClassEventHandler;
    },[]
] call CBA_fnc_waitUntilAndExecute;
