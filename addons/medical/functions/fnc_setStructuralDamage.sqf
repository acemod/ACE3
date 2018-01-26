/*
 * Author: commy2
 * Set the structural damage of a soldier without changing the individual hitpoints. Unit has to be local. Not safe to use with vehicles!
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_setStructuralDamage
 *
 * Public: no?
 */

params ["_unit", "_damage"];

if (!local _unit) exitWith {};

private _allHitPoints = getAllHitPointsDamage _unit select 2;

_unit setDamage _damage;

{
    _unit setHitIndex [_forEachIndex, _x];
} forEach _allHitPoints;
