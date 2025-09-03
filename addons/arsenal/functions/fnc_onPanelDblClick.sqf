#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "..\defines.hpp"
/*
 * Author: LinkIsGrim
 * Add or remove item(s) to favorites when LShift is pressed
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Tree selection path <ARRAY> / Selection index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
params ["_control", "_selection"];

if !(GVAR(shiftState)) exitWith {};

if (GVAR(currentLeftPanel) in [IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsigina]) exitWith {};

private _controlType = ctrlType _control;
private _isLnB = _controlType == CT_LISTNBOX;
private _isTree = _controlType == CT_TREE;

private _favorited = false;

// Favorites/blacklist will always be lowercase to handle configCase changes
private _item = "";
if (_isLnB) then {
    _item = toLowerANSI (_control lnbData [_selection, 0]);
} else {
    if (_isTree) then {
        if (count _selection == 0) exitWith {};
        _item = toLowerANSI (_control tvData _selection);
    } else {
        _item = toLowerANSI (_control lbData _selection);
    };
};

if (_item in GVAR(favorites)) then {
    GVAR(favorites) deleteAt _item;
} else {
    GVAR(favorites) set [_item, nil];
    _favorited = true;
};

private _color = ([[1, 1, 1], GVAR(favoritesColor)] select _favorited) + [1];

if (_isLnB) then {
    _control lnbSetColor [[_selection, 1], _color];
    _control lnbSetColorRight [[_selection, 1], _color];
} else {
    if (_isTree) then {
        _control tvSetColor [_selection, _color];
    } else {
        _control lbSetColor [_selection, _color];
        _control lbSetSelectColor [_selection, _color];
    };
};
