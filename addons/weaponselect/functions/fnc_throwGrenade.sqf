/*
 * Author: commy2
 * Display Grenade information on grenade throw.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] call ace_weaponselect_fnc_throwGrenade
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "", "", "", "_magazine"];

if (_weapon != "Throw") exitWith {};

private "_count";
_count = {_x == _magazine} count magazines _unit;

[_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

if (_count == 0) then {
    if (GVAR(CurrentGrenadeMuzzleIsFrag)) then {GVAR(CurrentGrenadeMuzzleFrag) = ""} else {GVAR(CurrentGrenadeMuzzleOther) = ""};
};
