#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles keyboard inputs inside the searchbars text boxes.
 *
 * Arguments:
 * 0: Loadouts display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

private _textString = ctrlText _control;

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;

if !(GVAR(lastSearchTextLoadouts) isEqualTo "" || {(_textString find GVAR(lastSearchTextLoadouts)) == 0}) then {//don't refill if there is no need
    [_display, _display displayCtrl GVAR(currentLoadoutsTab)] call FUNC(fillLoadoutsList);
};

GVAR(lastSearchTextLoadouts) = _textString;
if (count _textString == 0) exitWith {};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;

private _itemsToGo = (lnbSize _contentPanelCtrl) select 0;
private _lbIndex = 0;
while {_itemsToGo > 0} do {
    private _currentData = _contentPanelCtrl lnbText [_lbIndex, 1];
    private _currentClassname = _contentPanelCtrl lnbData [_lbIndex, 0];

    if ((_currentData isEqualTo "") || {(((toUpper _currentData) find (toUpper _textString)) == -1) && {((toUpper _currentClassname) find (toUpper _textString)) == -1}}) then {
        _contentPanelCtrl lnbDeleteRow _lbIndex;
    } else {
        _lbIndex = _lbIndex + 1;
    };
    _itemsToGo = _itemsToGo - 1;
};
_contentPanelCtrl lnbSetCurSelRow -1;
