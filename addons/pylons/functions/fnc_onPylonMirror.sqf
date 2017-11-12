/*
 * Author: 654wak654
 * Called when the "mirror" checkbox on the loadout dialog is checked.
 * Changes the comboboxes and buttons to be mirrored / normal.
 *
 * Arguments:
 * 0: Checked status <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_pylons_fnc_onPylonMirror
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_checked"];

if (_checked) then {
    {
        _x params ["_combo", "_mirroredIndex", "_button"];

        if (_mirroredIndex != -1) then {
            private _selection = lbCurSel ((GVAR(comboBoxes) select _mirroredIndex) select 0);
            _combo lbSetCurSel _selection;
            _combo ctrlEnable false;

            private _mirroredButton = (GVAR(comboBoxes) select _mirroredIndex) select 2;
            private _turret = _mirroredButton getVariable [QGVAR(turret), [-1]];
            [_button, false, _turret] call FUNC(onButtonTurret);
            _button ctrlEnable false;
        };
    } forEach GVAR(comboBoxes);
} else {
    {
        (_x select 0) ctrlEnable true;
        (_x select 2) ctrlEnable true;
    } forEach GVAR(comboBoxes);
};
