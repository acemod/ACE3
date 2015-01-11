/*
 * Author: KoffeinFlummi
 *
 * Checks if a unit is diagnosed and if that's even necessary.
 *
 * Arguments:
 * 0: Unit to be treated.
 *
 * Return Value:
 * Is unit diagnosed? (Bool)
 */

private ["_unit"];

_unit = _this select 0;

if !(AGM_player getVariable ["AGM_Medical_RequireDiagnosis", AGM_Medical_RequireDiagnosis]) exitWith {true};
if !(_unit getVariable ["AGM_isUnconscious", False]) exitWith {true};

(_unit getVariable ["AGM_isDiagnosed", True])
