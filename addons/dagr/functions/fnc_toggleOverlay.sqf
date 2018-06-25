#include "script_component.hpp"
/*
 * Author: Rosuto, Ruthberg
 * Toggles the DAGR overlay
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_dagr_fnc_toggleOverlay
 *
 * Public: No
 */

GVAR(run) = !GVAR(run);

if (GVAR(run)) then {
    if (GVAR(menuRun) && dialog) then {
        GVAR(menuRun) = false;
        closeDialog 0;
    };
    GVAR(hidden) = true;
    [{
        params ["_args", "_idPFH"];
        _args params ["_vehicle"];
        if (!GVAR(run) || (!alive ACE_player) || (vehicle ACE_player != _vehicle)) exitWith {
            GVAR(run) = false;
            135471 cutText ["", "PLAIN"];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
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
