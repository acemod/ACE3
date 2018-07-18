/*
 * Author: Glowbal
 * Update the body image on the menu
 *
 * Arguments:
 * 0: selection bloodloss <ARRAY>
 * 1: selection damage <ARRAY>
 * 2: selection torniquet <ARRAY>
 * 3: display <DISPLAY>
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

params ["_selectionBloodLoss", "_selectionDamage", "_selectionTourniquet", "_display"];

// Handle the body image coloring
private _availableSelections = [50, 51, 52, 53, 54, 55];
{
    private _red = 1;
    private _green = 1;
    private _blue = 1;

    private _torniquet = _selectionTourniquet select _forEachIndex;
    if (_torniquet > 0) then {
        _red = 0;
        _green = 0;
        _blue = 0.8;
    } else {
        private _bloodLoss = _selectionBloodLoss select _forEachIndex;
        if (_bloodLoss > 0) then {
            _green = 0 max (0.8 - _bloodLoss);
            _blue = _green;
        } else {
            private _damage = _selectionDamage select _forEachIndex;
            if (_damage > 0.1) then {
                _blue = 0 max (1 - _damage);
                _green = 0.5 max (1 - _damage / 2);
            };
        };
    };

    (_display displayCtrl _x) ctrlSetTextColor [_red, _green, _blue, 1.0];
} forEach _availableSelections;
