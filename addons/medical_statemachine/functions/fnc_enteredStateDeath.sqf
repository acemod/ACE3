#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles a unit reaching the point of death.
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

// TODO: Probably also needs additional logic to deal with edge cases

// Send a local event before death
[QEGVAR(medical,death), [_unit]] call CBA_fnc_localEvent;

_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];

_unit setDamage 1;
