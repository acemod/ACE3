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

DAGR_RUN = !DAGR_RUN;

if (DAGR_RUN) then {
    switch (toUpper DAGR_DISPLAY_SELECTION) do {
        case "WP" : {
            [] spawn FUNC(DAGR_OUTPUT_WP);
        };
        case "VECTOR" : {
            [] spawn FUNC(DAGR_OUTPUT_VECTOR);
        };
        case "DATA" : {
            [] spawn FUNC(DAGR_OUTPUT_DATA);
        };
    };
    [{
        EXPLODE_1_PVT(_this select 0,_vehicle);
        if (!DAGR_RUN || (!alive ACE_player) || (cameraView == "GUNNER") || (vehicle ACE_player != _vehicle)) exitWith {
            135471 cutText ["", "PLAIN"];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0.1, [vehicle ACE_player]] call CBA_fnc_addPerFrameHandler;
};
