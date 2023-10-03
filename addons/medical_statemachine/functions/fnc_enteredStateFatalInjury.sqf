#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Raises the transition to the next state instantly when fatally injured.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateFatalInjury
 *
 * Public: No
 */

params ["_unit"];
if (isNull _unit || {!isNil {_unit getVariable QEGVAR(medical,causeOfDeath)}}) exitWith {
    WARNING_1("enteredStateFatalInjury: State transition on dead or null unit - %1",_unit);
};

[QEGVAR(medical,FatalInjuryInstantTransition), _unit] call CBA_fnc_localEvent;
