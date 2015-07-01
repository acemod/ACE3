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

GVAR(run) = !GVAR(run);

if (GVAR(run)) then {
    if (GVAR(menuRun) && dialog) then {
        GVAR(menuRun) = false;
        closeDialog 0;
    };
    GVAR(hidden) = true;
    [{
        EXPLODE_1_PVT(_this select 0,_vehicle);
        if (!GVAR(run) || (!alive ACE_player) || (vehicle ACE_player != _vehicle)) exitWith {
            GVAR(run) = false;
            135471 cutText ["", "PLAIN"];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
        if (cameraView == "GUNNER") then {
            if (!GVAR(hidden)) then {
                GVAR(hidden) = true;
                135471 cutText ["", "PLAIN"];
            };
        } else {
            if (GVAR(hidden)) then {
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
        };
    }, 0.1, [vehicle ACE_player]] call CBA_fnc_addPerFrameHandler;
};
