/*
 * Author: 654wak654
 * Mirrors magazine selection to the opposite pylon if mirroring is on
 *
 * Arguments:
 * 0: Combobox <CONTROL>
 * 1: Index of selected magazine in the combobox <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_aircraft_fnc_onComboSelChange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrl", "_index"];

private _checkBox = (findDisplay 654654) displayCtrl 130;
if (!cbChecked _checkBox) exitWith {};

{
    if (_ctrl == (_x select 0) && {(_x select 1) == -1}) exitWith {
        private _indexOf = _forEachIndex;
        {
            if ((_x select 1) == _indexOf) exitWith {
                (_x select 0) lbSetCurSel _index;
            };
        } forEach GVAR(comboBoxes);
    };
} forEach GVAR(comboBoxes);
