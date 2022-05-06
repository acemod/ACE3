#include "script_component.hpp"
/*
 * Author: YetheSamartaka
 * Checks for AI Unconsciousness Exception variable
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Has Unconsciousness Exception variable <BOOL>
 *
 * Example:
 * [_unit] call ace_medical_statemachine_fnc_AIUnconsciousException
 *
 * Public: No
 */

params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit || {!local _unit}) exitWith {};

if (_unit getVariable [QEGVAR(zeus,AIUnconsciousException), false]) exitWith { true };

false