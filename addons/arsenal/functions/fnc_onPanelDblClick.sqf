#include "script_component.hpp"
#include "..\defines.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: LinkIsGrim
 * Add or remove item(s) to favorites when LShift is pressed
 *
 * Arguments:
 * 0: Left panel control <CONTROL>
 * 1: Left panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
params ["_control", "_curSel"];

if !(GVAR(shiftState)) exitWith {};

private _isLnB = (ctrlType _control) == CT_LISTNBOX;

// Favorites/blacklist will always be lowercase to handle configCase changes
private _item = "";
if (_isLnB) then {
    _item = toLower (_control lnbData [_curSel, 0]);
} else {
    _item = toLower (_control lbData _curSel);
};

if (_item in GVAR(favorites)) then {
    GVAR(favorites) = GVAR(favorites) deleteAt _item;
    if (isNil QGVAR(favorites)) then { // hashmap is deleted when all keys are deleted
        GVAR(favorites) = createHashMap;
    };
} else {
    GVAR(favorites) set [_item, nil];
};

private _color = [[1, 1, 1, 1], [0.9, 0.875, 0.6, 1]] select (_item in GVAR(favorites));

if (_isLnB) then {
    _control lnbSetColor [[_curSel, 0], _color];
} else {
    _control lbSetColor [_curSel, _color];
};
