#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Condition for an execution caused death (fatal injury received in cardiac arrest).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_conditionExecutionDeath
 *
 * Public: No
 */

params ["_unit"];

(isPlayer _unit && {GVAR(fatalInjuriesPlayer) != FATAL_INJURIES_NEVER} || {!isPlayer _unit && {GVAR(fatalInjuriesAI) != FATAL_INJURIES_NEVER}}) && {!(_unit getVariable [QEGVAR(medical,deathBlocked), false])}
