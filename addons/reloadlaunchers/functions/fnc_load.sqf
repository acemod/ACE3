#include "script_component.hpp"
/*
 * Author: commy2
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
    2.5
};

// Play animation
[_unit] call EFUNC(common,goKneeling);

// Show progress bar
private _onSuccess =  {
    (_this select 0) params ["_unit", "_target", "_weapon", "_magazine"];

    _unit removeMagazine _magazine;

    // Reload target's launcher
    [QGVAR(reloadLauncher), [_unit, _target, _weapon, _magazine], _target] call CBA_fnc_targetEvent;

    [LLSTRING(LauncherLoaded)] call EFUNC(common,displayTextStructured);
};

private _onFailure = {
    [LELSTRING(common,ActionAborted)] call EFUNC(common,displayTextStructured);
};

private _condition = {
    (_this select 0) params ["_unit", "_target"];

    (_this select 0) call FUNC(canLoad) && {_unit distance _target < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, LLSTRING(LoadingLauncher), _condition, ["isNotInside", "isNotSwimming"]] call EFUNC(common,progressBar);
