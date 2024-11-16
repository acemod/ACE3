#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43, drofseh
 * Start reloading a launcher, reload started by the unit who has the missile.
 *
 * Arguments:
 * 0: Unit executing the reload <OBJECT>
 * 1: Unit equipped with the launcher <OBJECT>
 * 2: Launcher name <STRING>
 * 3: Missile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "launch_RPG32_F", "RPG32_F"] call ace_reloadlaunchers_fnc_load
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

private _config = configFile >> "CfgWeapons" >> _weapon >> QGVAR(buddyReloadTime);

private _reloadTime = if (isNumber _config) then {
    getNumber _config
} else {
    getNumber (configFile >> "CfgWeapons" >> _weapon >> "magazineReloadTime") min 2.5
};

// Play animation
[_unit] call EFUNC(common,goKneeling);

// Notify unit that is being reloaded that reload has been started
[QGVAR(reloadStarted), [_unit, _target], _target] call CBA_fnc_targetEvent;

// Show progress bar
private _onSuccess =  {
    (_this select 0) params ["_unit", "_target", "_weapon", "_magazine"];

    // Check if the unit has any of the same magazines and calculate max ammo
    private _maxAmmo = 0;

    {
        _maxAmmo = _maxAmmo max (_x select 1);
    } forEach (magazinesAmmo _unit select {(_x select 0) == _magazine});

    // Check if the launcher can still be loaded; If possible, then try to remove magazine
    if !(_maxAmmo > 0 && {[_unit, _target, _weapon, _magazine] call FUNC(canLoad)} && {[_unit, _magazine, _maxAmmo] call EFUNC(common,removeSpecificMagazine)}) exitWith {
        // Notify unit that was being reloaded that reload has been stopped
        [QGVAR(reloadAborted), [_unit, _target], _target] call CBA_fnc_targetEvent;

        // Notify reloading unit about failure
        if (GVAR(displayStatusText)) then {
            [LSTRING(LauncherNotLoaded)] call EFUNC(common,displayTextStructured);
        };
    };

    // Reload target's launcher
    [QGVAR(reloadLauncher), [_unit, _target, _weapon, _magazine, _maxAmmo], _target] call CBA_fnc_targetEvent;

    // Notify reloading unit about success
    if (GVAR(displayStatusText)) then {
        [LSTRING(LauncherLoaded)] call EFUNC(common,displayTextStructured);
    };
};

private _onFailure = {
    (_this select 0) params ["_unit", "_target"];

    // Notify unit that was being reloaded that reload has been stopped
    [QGVAR(reloadAborted), [_unit, _target], _target] call CBA_fnc_targetEvent;

    // Notify reloading unit about failure
    if (GVAR(displayStatusText)) then {
        [LSTRING(LauncherNotLoaded)] call EFUNC(common,displayTextStructured);
    };
};

private _condition = {
    (_this select 0) params ["_unit", "_target"];

    (_this select 0) call FUNC(canLoad) && {_unit distance _target < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, LLSTRING(LoadingLauncher), _condition, ["isNotInside", "isNotSwimming"]] call EFUNC(common,progressBar);
