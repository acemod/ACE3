#include "script_component.hpp"
/*
 * Author: commy2, johnb43
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

private _onSuccess =  {
    (_this select 0) params ["_unit", "_target", "_weapon", "_magazine"];

    // Check if the unit has any of the same magazines and calculate max ammo
    private _maxAmmo = 0;

    {
        _maxAmmo = _maxAmmo max (_x select 1);
    } forEach (magazinesAmmo _unit select {(_x select 0) == _magazine});

    // Check if the launcher can still be loaded; If possible, then try to remove magazine
    if !([_unit, _target, _weapon, _magazine] call FUNC(canLoad) && {[_unit, _magazine, _maxAmmo] call EFUNC(common,removeSpecificMagazine)}) exitWith {
        // Notify reloading unit about failure
        [LLSTRING(LauncherNotLoaded)] call EFUNC(common,displayTextStructured);
    };

    // Reload target's launcher
    [QGVAR(reloadLauncher), [_unit, _target, _weapon, _magazine, _maxAmmo], _target] call CBA_fnc_targetEvent;

    // Notify reloading unit about success
    [LLSTRING(LauncherLoaded)] call EFUNC(common,displayTextStructured);
};

private _onFailure = {
    [localize ELSTRING(common,ActionAborted)] call DEFUNC(common,displayTextStructured);
};

private _condition = {
    (_this select 0) call DFUNC(canLoad) && {(_this select 0 select 0) distance (_this select 0 select 1) < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, localize LSTRING(LoadingLauncher), _condition, ["isNotInside", "isNotSwimming"]] call EFUNC(common,progressBar);
