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
    private _colorSelection = [1, 1, 1]; // RGB

    private _torniquet = _selectionTourniquet select _forEachIndex;
    if (_torniquet > 0) then {
        _colorSelection = [0, 0, 0.8];
    } else {
        private _bloodLoss = _selectionBloodLoss select _forEachIndex;

        private _frBL = 0 max (_bloodLoss / BLOOD_LOSS_RED_THRESHOLD) min 1;
        private _colorInt = ceil ((_frBL * (BLOOD_LOSS_TOTAL_COLORS - 1)));

        _colorSelection = [
             [1.00, 1.00, 1.00], // #ffffff
             [1.00, 0.95, 0.63], // #fff1a1
             [1.00, 0.88, 0.46], // #ffe075
             [1.00, 0.80, 0.33], // #ffcb55
             [1.00, 0.72, 0.24], // #ffb73c
             [1.00, 0.63, 0.15], // #ffa127
             [1.00, 0.53, 0.08], // #ff8815
             [1.00, 0.43, 0.02], // #ff6d05
             [1.00, 0.29, 0.00], // #ff4b00
             [1.00, 0.00, 0.00]  // #ff0000
        ] select _colorInt;
    };

    // Alpha is always 1
    _colorSelection pushBack 1;

    (_display displayCtrl _x) ctrlSetTextColor _colorSelection;
} forEach _availableSelections;
