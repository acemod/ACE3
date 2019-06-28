#include "script_component.hpp"
/*
 * Author: Glowbal
 * Marks a unit as in cardiac arrest and sets heart rate to 0.
 * Will put the unit in an unconscious state if not already.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_active"];
TRACE_2("setCardiacArrest",_unit,_active);

// No change to make
if (_active isEqualTo IN_CRDC_ARRST(_unit)) exitWith {};

// No heart rate in cardiac arrest, low heart rate if revived
_unit setVariable [VAR_CRDC_ARRST, _active, true];
_unit setVariable [VAR_HEART_RATE, [40, 0] select _active, true];

// Cardiac arrest is an extension of unconsciousness
[_unit, _active] call FUNC(setUnconscious);

["ace_cardiacArrest", [_unit, _active]] call CBA_fnc_localEvent;
