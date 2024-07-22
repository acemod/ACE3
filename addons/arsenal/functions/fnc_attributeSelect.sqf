#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Handles adding/removing an item from 3DEN's ace arsenal attribute list.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 * 1: Add (true) or remove (false) item <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, true] call ace_arsenal_fnc_attributeSelect
 *
 * Public: No
 */

params ["_controlsGroup", "_addItem"];

// Get item class from listbox
private _listbox = _controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST;
private _currentRow = lnbCurSelRow _listbox;
private _itemClassname = _listbox lnbData [_currentRow, 1];
TRACE_2("Handling item selection",_itemClassname,_addItem);

private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue params ["_attributeItems", "_attributeMode"];

private _itemIndex = _attributeItems find _itemClassname;

// Add item if not already in list
if (_addItem && {_itemIndex == -1}) exitWith {
    _attributeItems pushBack _itemClassname;

    // Change symbol and increase alpha
    _listbox lnbSetText [[_currentRow, 3], [SYMBOL_ITEM_VIRTUAL, SYMBOL_ITEM_REMOVE] select _attributeMode];
    _listbox lnbSetColor [[_currentRow, 1], [1, 1, 1, 1]];
    _listbox lnbSetPictureColor [[_currentRow, 2], [1, 1, 1, 1]]; // mod icon is in column 2
    _listbox lnbSetColor [[_currentRow, 3], [1, 1, 1, 1]];
};

// Remove item if in list
if (!_addItem && {_itemIndex != -1}) exitWith {
    _attributeItems deleteAt _itemIndex;

    // Change symbol and reduce alpha
    _listbox lnbSetText [[_currentRow, 3], SYMBOL_ITEM_NONE];
    _listbox lnbSetColor [[_currentRow, 1], [1, 1, 1, 0.5]];
    _listbox lnbSetPictureColor [[_currentRow, 2], [1, 1, 1, 0.5]]; // mod icon is in column 2
    _listbox lnbSetColor [[_currentRow, 3], [1, 1, 1, 0.5]];
};
