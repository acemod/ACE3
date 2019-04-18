#include "script_component.hpp"
/*
 * Author: commy2
 * Kills a local unit.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Reason for death <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", ["_reason", "unknown"]];

// No heart rate or blood pressure to measure when dead
_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];

// Kill the unit without changing visual apperance
[_unit, 1] call EFUNC(medical_engine,setStructuralDamage);

private _lastShooter = _unit getVariable [QEGVAR(medical_engine,lastShooter), objNull];
private _lastInstigator = _unit getVariable [QEGVAR(medical_engine,lastInstigator), objNull];

["ace_killed", [_unit, _reason, _lastShooter, _lastInstigator]] call CBA_fnc_globalEvent;
