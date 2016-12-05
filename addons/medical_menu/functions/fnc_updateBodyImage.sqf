/*
 * Author: Glowbal
 * Update the body image on the menu
 *
 * Arguments:
 * 0: selection bloodloss <ARRAY>
 * 1: selection pain <ARRAY>
 * 2: selection damage <ARRAY>
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

params ["_selectionBloodLoss", "_selectionPain", "_selectionDamage", "_display"];

// Handle the body image coloring
private _availableSelections = [50, 51, 52, 53, 54, 55];
{
    private _red = 1;
    private _green = 1;
    private _blue = 1;

    private _bloodLoss = _selectionBloodLoss select _forEachIndex;
    private _pain = _selectionPain select _forEachIndex;
    private _damage = _selectionDamage select _forEachIndex;
    
    if (_bloodLoss > 0) then {
        _green = 0 max (0.9 - _bloodLoss);
        _blue = _green;
    } else {
        if (_damage > 0.3) then {
            _blue = 0 max (0.9 - _damage);
            _green = 0.7;
            _red = 0.8;
        } else {
            _green = 0 max (0.9 - _pain);
            _red = _green;
        };
    };

    (_display displayCtrl _x) ctrlSetTextColor [_red, _green, _blue, 1.0];
} forEach _availableSelections;
