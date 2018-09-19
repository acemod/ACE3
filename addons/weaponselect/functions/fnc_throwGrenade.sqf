#include "script_component.hpp"
/*
 * Author: commy2
 * Display Grenade information on grenade throw. Called from the unified fired EH only for the local player.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] call ace_weaponselect_fnc_throwGrenade
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (_weapon != "Throw") exitWith {};

private _count = ({_x == _magazine} count uniformItems _unit) + ({_x == _magazine} count vestItems _unit) + ({_x == _magazine} count backpackItems _unit);

[_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

if (_count == 0) then {
    if (GVAR(CurrentGrenadeMuzzleIsFrag)) then {GVAR(CurrentGrenadeMuzzleFrag) = ""} else {GVAR(CurrentGrenadeMuzzleOther) = ""};
};
