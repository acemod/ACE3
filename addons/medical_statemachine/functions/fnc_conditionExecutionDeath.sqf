#include "script_component.hpp"
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

params ["_unit"];

(GVAR(fatalInjuryCondition) < 2) && {!(_unit getVariable [QEGVAR(medical,deathBlocked), false])}
