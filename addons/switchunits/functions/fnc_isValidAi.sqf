/*
 * Author: bux578
 * Checks if AI is a valid target for switching.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [_unit] call FUNC(isValidAi)
 *
 * Public: Yes
 */

#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

!([_unit] call EFUNC(common,isPlayer)
|| {_unit in playableUnits}
|| {vehicle _unit != _unit} 
|| {_unit getVariable [QGVAR(IsPlayerUnit), false]} 
|| {_unit getVariable [QGVAR(IsPlayerControlled), false]})
