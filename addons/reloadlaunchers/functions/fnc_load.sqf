/*
 * Author: commy2
 * Reload a launcher
 *
 * Arguments:
 * 0: Unit with magazine <OBJECT>
 * 1: Unit with launcher <OBJECT>
 * 2: weapon name <STRING>
 * 3: missile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "weapon", "missile"] call ace_reloadlaunchers_fnc_load
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target", "_weapon", "_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

private _reloadTime = if (isNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(buddyReloadTime))) then {
    getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(buddyReloadTime))
} else {
    2.5
};

// do animation
[_unit] call EFUNC(common,goKneeling);

// show progress bar
private ["_onSuccess", "_onFailure", "_condition"];

_onSuccess =  {
    (_this select 0 select 0) removeMagazine (_this select 0 select 3);
    [QGVAR(reloadLauncher), _this select 0, _this select 0 select 1] call CBA_fnc_targetEvent;

    [localize LSTRING(LauncherLoaded)] call DEFUNC(common,displayTextStructured);
};

_onFailure = {
    [localize ELSTRING(common,ActionAborted)] call DEFUNC(common,displayTextStructured);
};

_condition = {
    (_this select 0) call DFUNC(canLoad) && {(_this select 0 select 0) distance (_this select 0 select 1) < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, localize LSTRING(LoadingLauncher), _condition] call EFUNC(common,progressBar);
