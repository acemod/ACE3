/*
 * Author: commy2
 *
 * Display Grenade information on grenade throw.
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Magazine <STRING>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "_magazine"];

if (_weapon != "Throw") exitWith {};

private "_count";
_count = {_x == _magazine} count magazines _unit;

[_magazine, _count] call FUNC(displayGrenadeTypeAndNumber);

if (_count == 0) then {
    if (GVAR(CurrentGrenadeMuzzleIsFrag)) then {GVAR(CurrentGrenadeMuzzleFrag) = ""} else {GVAR(CurrentGrenadeMuzzleOther) = ""};
};
