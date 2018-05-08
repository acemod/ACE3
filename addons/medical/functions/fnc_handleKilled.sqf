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

SET_PAIN_TOTAL(_unit,0);
SET_HEART_RATE(_unit,0);
_unit setVariable [QGVAR(bloodPressure), [0, 0], true];
