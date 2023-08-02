#include "script_component.hpp"
#include "..\defines.hpp"
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

private _isLnB = ctrlType _control == CT_LISTNBOX;

// Favorites/blacklist will always be lowercase to handle configCase changes
private _item = toLower ([_control lbData _curSel, _control lnbData [_curSel, 0]] select _isLnB);

if (_item in GVAR(favorites)) then {
    GVAR(favorites) = GVAR(favorites) deleteAt _item;
} else {
    GVAR(favorites) set [_item, nil];
};

private _color = [[0.9, 0.875, 0.6, 1], [1, 1, 1, 1]] select (_item in GVAR(favorites));

if (_isLnB) then {
    _control lnbSetColor [[_curSel, 0], _color];
} else {
    _control lbSetColor [_curSel, _color];
};
