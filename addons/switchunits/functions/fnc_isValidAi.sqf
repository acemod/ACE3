#include "script_component.hpp"
/*
 * Author: bux578
 * Checks if AI is a valid target for switching.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Valid AI <BOOL>
 *
 * Example:
 * [_unit] call ace_switchunits_fnc_isValidAi
 *
 * Public: Yes
 */

params ["_unit"];

!([_unit] call EFUNC(common,isPlayer)
|| {_unit in playableUnits}
|| {vehicle _unit != _unit}
|| {_unit getVariable [QGVAR(IsPlayerUnit), false]}
|| {_unit getVariable [QGVAR(IsPlayerControlled), false]}) // return
