#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["_display"];

systemChat str _display;

if !(GVAR(allowDefaultLoadouts)) then {
    private _buttonDefaultLoadoutsCtrl = _display displayCtrl IDC_buttonDefaultLoadouts;
    _buttonDefaultLoadoutsCtrl ctrlEnable false;
    _buttonDefaultLoadoutsCtrl ctrlCommit 0;
};

if !(GVAR(allowSharedLoadouts)) then {
    private _buttonShareLoadoutsCtrl = _display displayCtrl IDC_buttonSharedLoadouts;
    _buttonShareLoadoutsCtrl ctrlEnable false;
    _buttonShareLoadoutsCtrl ctrlCommit 0;
};

[_display, _display displayCtrl IDC_buttonMyLoadouts] call FUNC(loadoutsChangeTab);