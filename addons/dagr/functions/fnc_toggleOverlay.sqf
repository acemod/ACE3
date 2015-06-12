/*
 * Author: Rosuto, Ruthberg
 * Toggles the DAGR overlay
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

if (cameraView == "GUNNER") exitWith {};

GVAR(run) = !GVAR(run);

if (GVAR(run)) then {
    switch (toUpper GVAR(displaySelection)) do {
        case "WP" : {
            call FUNC(outputWP);
        };
        case "VECTOR" : {
            call FUNC(outputVector);
        };
        case "DATA" : {
            call FUNC(outputData);
        };
    };
    [{
        EXPLODE_1_PVT(_this select 0,_vehicle);
        if (!GVAR(run) || (!alive ACE_player) || (cameraView == "GUNNER") || (vehicle ACE_player != _vehicle)) exitWith {
            135471 cutText ["", "PLAIN"];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.1, [vehicle ACE_player]] call CBA_fnc_addPerFrameHandler;
};
