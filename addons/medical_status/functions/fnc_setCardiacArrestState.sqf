#include "script_component.hpp"
/*
 * Author: Glowbal
 * Marks a unit as in cardiac arrest and sets heart rate to 0.
 * Will put the unit in an unconscious state if not already.
 * For Internal Use: Called from the state machine entered/leftState funcs.
 *
 * Arguments:
 * 0: The unit that will be put in cardiac arrest state <OBJECT>
 * 1: Set CardiacArrest <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_status_fnc_setCardiacArrestState
 *
 * Public: No
 */

params ["_unit", "_active"];
TRACE_2("setCardiacArrestState",_unit,_active);

// No change to make
if (_active isEqualTo IN_CRDC_ARRST(_unit)) exitWith { TRACE_2("no change",_active,IN_CRDC_ARRST(_unit)); };

// No heart rate in cardiac arrest, low heart rate if revived
_unit setVariable [VAR_CRDC_ARRST, _active, true];
_unit setVariable [VAR_HEART_RATE, [40, 0] select _active, true];

// Cardiac arrest is an extension of unconsciousness
[_unit, _active] call FUNC(setUnconsciousState);

["ace_cardiacArrest", [_unit, _active]] call CBA_fnc_localEvent;
