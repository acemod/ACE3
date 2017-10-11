/*
 * Author: 654wak654
 * Handles various UI changes when a combobox' selection changes.
 *
 * Arguments:
 * 0: Combobox <CONTROL>
 * 1: Selected index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_combo, 5] call ace_pylons_fnc_onComboSelChange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrl", "_index"];

{
    _x params ["_combo", "_mirroredIndex", "", "_originalIndex"];
    if (_ctrl == _combo) exitWith {
        if (_mirroredIndex == -1) then {
            private _indexOf = _forEachIndex;
            {
                _x params ["_combo", "_mirroredIndex"];
                if (_mirroredIndex == _indexOf && {!ctrlEnabled _combo}) exitWith {
                    _combo lbSetCurSel _index;
                };
            } forEach GVAR(comboBoxes);
        };
        if !(GVAR(rearmNewPylons) || {GVAR(isCurator)}) then {
            private _color = [[0.5, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1]] select (_index == _originalIndex);
            _combo ctrlSetBackgroundColor _color;
        };
    };
} forEach GVAR(comboBoxes);
