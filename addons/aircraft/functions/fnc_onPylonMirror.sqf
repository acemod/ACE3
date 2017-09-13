/*
 * Author: 654wak654
 * Called when the "mirror" checkbox on the loadout dialog is checked
 * Changes the comboboxes to be mirrored / normal
 *
 * Arguments:
 * 0: Checked status <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_aircraft_fnc_onPylonMirror
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_checked"];

if (_checked) then {
    {
        if ((_x select 1) != -1) then {
            private _selection = lbCurSel ((GVAR(comboBoxes) select (_x select 1)) select 0);
            (_x select 0) lbSetCurSel _selection;
            (_x select 0) ctrlEnable false;
        };
    } forEach GVAR(comboBoxes);
} else {
    {
        (_x select 0) ctrlEnable true;
    } forEach GVAR(comboBoxes);
};
