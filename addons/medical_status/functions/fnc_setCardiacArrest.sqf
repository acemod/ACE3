#include "script_component.hpp"
/*
 * Author: Glowbal
 * Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies.
 * Timer is a random value between 120 and 720 seconds.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_medical_fnc_setCardiacArrest
 *
 * Public: yes
 */

params ["_unit"];

if IN_CRDC_ARRST(_unit) exitWith {};

_unit setVariable [VAR_CRDC_ARRST, true, true];
_unit setVariable [VAR_HEART_RATE, 0, true];

["ace_cardiacArrestEntered", [_unit]] call CBA_fnc_localEvent;

[_unit, true] call FUNC(setUnconsciousStatemachine);
