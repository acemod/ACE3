#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New Damage <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 2] call ACE_medical_fnc_handleCollisionDamage
 *
 * Public: No
 */

params ["_unit", "_newDamage"];

private _selection = "body";

private _totalDamage = (_unit getHit _selection) + _newDamage;

_unit setHit [_selection, _totalDamage];

systemChat format ["collision: %1", _this];
