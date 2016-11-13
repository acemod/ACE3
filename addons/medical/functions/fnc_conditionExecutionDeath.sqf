/*
 * Author: BaerMitUmlaut
 * Condition for an execution caused death.
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

(GVAR(fatalInjuryCondition) < 2) && {!(_unit getVariable [QGVAR(deathBlocked), false])}
