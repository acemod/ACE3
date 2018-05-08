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
 * Example:
 * [bob, "bloodloss"] call ace_medical_status_fnc_setDead;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_reason", "unknown"]];

// wait a frame to escape handleDamage
// @TODO Test if this is still necessary
[EFUNC(medical_engine,setStructuralDamage), [_unit, 1]] call CBA_fnc_execNextFrame;

private _lastShooter = _unit getVariable [QEGVAR(medical_engine,lastShooter), objNull];
private _lastInstigator = _unit getVariable [QEGVAR(medical_engine,lastInstigator), objNull];

["ace_killed", [_unit, _reason, _lastShooter, _lastInstigator]] call CBA_fnc_globalEvent;
