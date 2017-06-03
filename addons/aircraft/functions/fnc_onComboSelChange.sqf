// TODO: Header
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
