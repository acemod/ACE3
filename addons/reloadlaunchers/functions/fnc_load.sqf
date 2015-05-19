/*
 * Author: commy2
 *
 * Reload a launcher
 *
 * Argument:
 * 0: Unit with magazine (Object)
 * 1: Unit with launcher (Object)
 * 2: weapon name (String)
 * 3: missile name (String)
 *
 * Return value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_target", "_weapon", "_magazine"];

_unit = _this select 0;
_target = _this select 1;
_weapon = _this select 2;
_magazine = _this select 3;

private "_reloadTime";
_reloadTime = getNumber (configFile >> "CfgWeapons" >> _weapon >> "magazineReloadTime");

// do animation
[_unit] call EFUNC(common,goKneeling);

// show progress bar
private ["_onSuccess", "_onFailure", "_condition"];

_onSuccess =  {
    (_this select 0 select 0) removeMagazine (_this select 0 select 3);
    ["reloadLauncher", _this select 0 select 1, _this select 0] call DEFUNC(common,targetEvent);

    [localize "STR_ACE_ReloadLaunchers_LauncherLoaded"] call DEFUNC(common,displayTextStructured);
};

_onFailure = {
    [localize "STR_ACE_Common_ActionAborted"] call DEFUNC(common,displayTextStructured);
};

_condition = {
    (_this select 0) call DFUNC(canLoad) && {(_this select 0 select 0) distance (_this select 0 select 1) < 4}
};

[_reloadTime, [_unit, _target, _weapon, _magazine], _onSuccess, _onFailure, localize "STR_ACE_ReloadLaunchers_LoadingLauncher", _condition] call EFUNC(common,progressBar);
