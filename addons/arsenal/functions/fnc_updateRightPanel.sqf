#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_maxLoad"];

private _loadIndicatorBarCtrl = _display displayCtrl IDC_loadIndicatorBar;
private _curSel = lnbCurSelRow _control;
(lnbSize _control) params ["_rows"];

_maxLoad = getnumber (configfile >> "CfgVehicles" >> _maxLoad >> "maximumLoad");
_maxLoad = _maxLoad * (1 - progressPosition _loadIndicatorBarCtrl);

// Grey out items too big
for "_r" from 0 to (_rows - 1) do {
    private _mass = _control getVariable (_control lnbText [_r, 1]);
    private _alpha = [1.0,0.25] select (_mass > _maxLoad);
    private _color = [1,1,1,_alpha];
    _control lnbsetcolor [[_r,1],_color];
    _control lnbsetcolor [[_r,2],_color];
};

// Remove all from container show / hide
private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;

if (progressPosition _loadIndicatorBarCtrl > 0) then {

    _removeAllCtrl ctrlSetFade 0;
    _removeAllCtrl ctrlShow true;
    _removeAllCtrl ctrlEnable true;
    _removeAllCtrl ctrlCommit FADE_DELAY;
};

// change button color if unique or too big
private _plusButtonCtrl = _display displayCtrl IDC_arrowPlus;
_plusButtonCtrl ctrlEnable !((_control lnbValue [_curSel, 2]) == 1 || {(_control getVariable (_control lnbText [_curSel, 1])) > _maxLoad});
_plusButtonCtrl ctrlCommit FADE_DELAY;
