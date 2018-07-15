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
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];

[QEGVAR(medical,FatalInjuryInstantTransition), _unit] call CBA_fnc_localEvent;
