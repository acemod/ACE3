#include "script_component.hpp"
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

    // Get magazines that are of the correct type; Exclude empty mags
    private _magazinesAmmoFull = (magazinesAmmoFull _unit) select {(_x select 0) == _magazine};

    // Get count of rounds in magazines, then select maximum
    private _ammo = selectMax (_magazinesAmmoFull apply {_x select 1});

    // Try to remove magazine; If failure, quit
    if !([_unit, _magazine, _ammo] call EFUNC(common,removeSpecificMagazine)) exitWith {
        [LELSTRING(common,ActionAborted)] call EFUNC(common,displayTextStructured);
    };

    // Reload target's launcher; Upon success, notify reloading unit about success
    [QGVAR(reloadLauncher), [_unit, _target, _weapon, _magazine, _ammo], _target] call CBA_fnc_targetEvent;
};

private _onFailure = {
    [localize ELSTRING(common,ActionAborted)] call DEFUNC(common,displayTextStructured);
};

private _condition = {
    (_this select 0) call DFUNC(canLoad) && {(_this select 0 select 0) distance (_this select 0 select 1) < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, localize LSTRING(LoadingLauncher), _condition, ["isNotInside", "isNotSwimming"]] call EFUNC(common,progressBar);
