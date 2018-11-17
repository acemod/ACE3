#include "script_component.hpp"
/*
 * Author: diwako
 * Update tourniquets on the body image on the menu.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Tourniquets <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [some_display, [0,0,0,0,0,0]] call ace_medical_fnc_updateTourniquets
 *
 * Public: No
 */

params ["_display", "_tourniquets"];

// Handle tourniquets
private _availableSelections = [0, 0, 56, 57, 58, 59];
for "_i" from 2 to 5 do {
    private _tourn = _tourniquets select _i;
    (_display displayCtrl (_availableSelections select _i)) ctrlSetTextColor [0, 0, 0.8, _tourn];
};
