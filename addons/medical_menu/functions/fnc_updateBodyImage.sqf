/*
 * Author: Glowbal
 * Update the body image on the menu
 *
 * Arguments:
 * 0: selection bloodloss <ARRAY>
 * 1: damaged (array of bools) <ARRAY>
 * 2: display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.3, some_display] call ace_medical_menu_fnc_updateBodyImage
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_selectionBloodLoss", "_damaged", "_display"];

// Handle the body image coloring
private _availableSelections = [50, 51, 52, 53, 54, 55];
{
    private _red = 1;
    private _green = 1;
    private _blue = 1;

    if (_x > 0) then {
        if (_damaged select _forEachIndex) then {
            _green = (0.9 - _x) max 0;
            _blue = _green;
        } else {
            _green = (0.9 - _x) max 0;
            _red = _green;
            //_blue = _green;
        };
    };

    (_display displayCtrl (_availableSelections select _forEachIndex)) ctrlSetTextColor [_red, _green, _blue, 1.0];
} forEach _selectionBloodLoss;
