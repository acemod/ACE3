/*
 * Author: Glowbal
 * Update the body image on the menu
 *
 * Arguments:
 * 0: selection bloodloss <ARRAY>
 * 1: display <DISPLAY>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_selectionBloodLoss", "_display"];
_selectionBloodLoss = _this select 0;
_display = _this select 1;

// Handle the body image coloring
_availableSelections = [50,51,52,53,54,55];
{
    private ["_red", "_green", "_blue"];
    _total = _x;

    _red = 1;
    _green = 1;
    _blue = 1;
    if (_total > 0) then {
        if (_damaged select _forEachIndex) then {
            _green = (0.9 - _total) max 0;
            _blue = _green;
        } else {
            _green = (0.9 - _total) max 0;
            _red = _green;
            //_blue = _green;
        };
    };
    (_display displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red, _green, _blue, 1.0];
}foreach _selectionBloodLoss;
