/*
 * Author: Glowbal
 * Called when a unit is killed
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_handleKilled
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

_unit setVariable [VAR_PAIN, 0, true];
_unit setVariable [VAR_HEART_RATE, 0, true];
_unit setVariable [VAR_BLOOD_PRESS, [0, 0], true];
