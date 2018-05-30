/*
 * Author: Grey
 * Checks whether magazine can be unloaded from static weapon
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * canUnloadMagazine <BOOL>
 *
 * Example:
 * [_target,_player] call ace_mk6mortar_fnc_canUnloadMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_static","_unit"];

if !(alive _static && GVAR(useAmmoHandling) && _static getVariable [QGVAR(initialized),false]) exitWith {false};
if (_static getVariable [QGVAR(inUse), false]) exitWith {false};

private _canUnloadMagazine = false;

private _ammoCount = ((magazinesAllTurrets _static) select 1) select 2;
if (_ammoCount > 0) then {
    _canUnloadMagazine = true;
};
_canUnloadMagazine
