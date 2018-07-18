/*
 * Author: Glowbal
 * Handles partial heal of a patient.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

if (!alive _target) exitWith {};

private _partialHealCounter = _target getVariable [QGVAR(partialHealCounter), 0];
_partialHealCounter = _partialHealCounter + 1;
_target setVariable [QGVAR(partialHealCounter), _partialHealCounter, true];

private _healingPower = (0 max (1 - EGVAR(medical,remainingDamage_Medkit)) min 1) ^ _partialHealCounter;
private _damageRemainder = 1 - _healingPower;

private _bodyPartDamage = _target getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
_bodyPartDamage = _bodyPartDamage apply {
    (_x min _damageRemainder)
};
_target setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

if ((_bodyPartDamage select 4) < 0.3 && {(_bodyPartDamage select 5) < 0.3}) then {
    [_target, false] call EFUNC(medical_engine,setLimping);
};

// Resetting damage
_target setDamage 0;

[_target, "activity", ELSTRING(medical_treatment,Activity_partialHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_partialHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
