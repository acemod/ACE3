/*
 * Author: Dslyecxi, Jonpas
 * Updates the Stamina Bar with current Fatigue level.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_staminabar_fnc_updatePFH
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_args", "_idPFH"];
_args params ["_ctrlBack", "_ctrlBar"];

// Hide bar and remove PFH if disabled
if (!GVAR(enabled)) exitWith {
    TRACE_1("Removing",GVAR(enabled));
    (QGVAR(Bar) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// Show under specific circumstances only
if (call FUNC(canShow)) then {
    // Show if invisible
    if (ctrlFade _ctrlBack > 0) then {
        _ctrlBack ctrlSetFade 0;
        _ctrlBar ctrlSetFade 0;
    };

    private ["_fatigue", "_fatigueWidth", "_staminaGreen", "_staminaAlpha", "_ctrlBarPos"];

    // Get fatigue and convert it to bar width
    _fatigue = getFatigue ACE_player;
    _fatigueWidth = linearConversion [0, 1, _fatigue, 0, 0.1, true];

    // Set background color
    _ctrlBack ctrlSetBackgroundColor [0, 0, 0, 0.3 min 0.8 * (_fatigue + 0.1)];

    // Convert fatigue to colors
    _staminaGreen = linearConversion [0,1, _fatigue, 0.6, 0, true]; 
    _staminaAlpha = linearConversion [0,1, _fatigue, 0.5, 1, true];

    // Set bar color
    _ctrlBar ctrlSetBackgroundColor [_fatigue, _staminaGreen, 0, _staminaAlpha];

    // Set bar fill
    _ctrlBarPos = ctrlPosition _ctrlBar;
    _ctrlBar ctrlSetPosition [_ctrlBarPos select 0, _ctrlBarPos select 1, _fatigueWidth * safezoneW, _ctrlBarPos select 3];
} else {
    // Hide if visible
    if (ctrlFade _ctrlBack == 0) then {
        _ctrlBack ctrlSetFade 1;
        _ctrlBar ctrlSetFade 1;
    };
};

// Commit changes
_ctrlBack ctrlCommit 0;
_ctrlBar ctrlCommit 0;
