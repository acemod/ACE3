/*
 * Author: Alganthe
 * Update the right panel (listnbox).
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Max load of the current container <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_maxLoad"];

private _loadIndicatorBarCtrl = _display displayCtrl IDC_loadIndicatorBar;
private _curSel = lnbCurSelRow _control;

(lnbSize _control) params ["_rows"];

_maxLoad = getnumber (configfile >> "CfgVehicles" >> _maxLoad >> "maximumLoad");
_maxLoad = _maxLoad * (1 - (progressPosition _loadIndicatorBarCtrl));
_maxLoad = parseNumber (_maxLoad toFixed 2); // Required to avoid an issue where even though the typename returns "SCALAR" it doesn't act as one.

// Grey out items too big
for "_r" from 0 to (_rows - 1) do {
    private _mass = _control getVariable (_control lnbData [_r, 0]);
    private _class = _control lnbText [_r, 1];

    private _alpha = [0.25, 1.0] select (_mass <= _maxLoad);
    private _color = [1, 1, 1, _alpha];
    _control lnbSetColor [[_r, 1],_color];
    _control lnbSetColor [[_r, 2],_color];
};

// Remove all from container show / hide
private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;

if (progressPosition _loadIndicatorBarCtrl > 0) then {

    _removeAllCtrl ctrlSetFade 0;
    _removeAllCtrl ctrlShow true;
    _removeAllCtrl ctrlEnable true;
    _removeAllCtrl ctrlCommit FADE_DELAY;
};

(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", [GVAR(center), 2] call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);

// change button color if unique or too big
if (_curSel != -1) then {
    private _plusButtonCtrl = _display displayCtrl IDC_arrowPlus;
    _plusButtonCtrl ctrlEnable !((_control lnbValue [_curSel, 2]) == 1 || {(_control getVariable (_control lnbData [_curSel, 0])) > _maxLoad});
    _plusButtonCtrl ctrlCommit FADE_DELAY;
};
