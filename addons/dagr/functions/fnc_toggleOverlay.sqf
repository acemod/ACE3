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
GVAR(hidden) = false;

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
        if(GVAR(run)) then {
            if ((!alive ACE_player) || (vehicle ACE_player != _vehicle)) exitWith {
                GVAR(run) = false;
                GVAR(hidden) = false;
                135471 cutText ["", "PLAIN"];
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
            if(!GVAR(hidden) && (cameraView == "GUNNER")) then {
                GVAR(hidden) = true;
                135471 cutText ["", "PLAIN"];
            };
            if(GVAR(hidden) && (cameraView != "GUNNER")) then {
                GVAR(hidden) = false;
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
            };
        } else {
            135471 cutText ["", "PLAIN"];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.1, [vehicle ACE_player]] call CBA_fnc_addPerFrameHandler;
};
