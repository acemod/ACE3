/*
 * Author: commy2
 * Set structural damage of an object without modifying the individual hit points.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New damage value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0.5] call ace_medical_engine_fnc_setStructuralDamage
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_damage", 0, [0]]];

if (!local _unit) exitWith {
    ACE_LOGERROR("Unit not local or null");
};

private _hitPointDamages = getAllHitPointsDamage _unit param [2, []];

_unit setDamage _damage;

{
    _unit setHitIndex [_forEachIndex, _x];
} forEach _hitPointDamages;
