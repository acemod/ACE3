#include "script_component.hpp"
/*
 * Author: Glowbal, commy2
 * Handle wounds received event.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: caused by <OBJECT>
 * 2: damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "", "_damage", "_shooter"];

if (GVAR(enabledFor) == 1 && {!isPlayer _unit && {_unit != ACE_player}}) exitWith {};
if (vehicle _unit != _unit && {!((vehicle _unit) isKindOf "StaticWeapon")}) exitWith {}; // Don't bleed on ground if mounted

_damage = _damage min 1;

if (isNull _shooter) exitWith { // won't be able to calculate the direction properly, so instead we pick something at random
    [QGVAR(spurt), [_unit, random 360, _damage]] call CBA_fnc_serverEvent;
};

// Calculate bulletDirection
private _bulletDir = _shooter getDir _unit;

[QGVAR(spurt), [_unit, _bulletDir, _damage]] call CBA_fnc_serverEvent;
