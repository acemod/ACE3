#include "..\script_component.hpp"
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

if (GVAR(currentLeftPanel) in [IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsigina]) exitWith {};

private _isLnB = (ctrlType _control) == CT_LISTNBOX;

private _favorited = false;

// Favorites/blacklist will always be lowercase to handle configCase changes
private _item = "";
if (_isLnB) then {
    _item = toLowerANSI (_control lnbData [_curSel, 0]);
} else {
    _item = toLowerANSI (_control lbData _curSel);
};

if (_item in GVAR(favorites)) then {
    GVAR(favorites) deleteAt _item;
} else {
    GVAR(favorites) set [_item, nil];
    _favorited = true;
};

private _color = ([[1, 1, 1], GVAR(favoritesColor)] select _favorited) + [1];

if (_isLnB) then {
    _control lnbSetColor [[_curSel, 1], _color];
    _control lnbSetColorRight [[_curSel, 1], _color];
} else {
    _control lbSetColor [_curSel, _color];
    _control lbSetSelectColor [_curSel, _color];
};
