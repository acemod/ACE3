/*
 * Author: Loren Luke Leimer
 * Checks if a unit can daisy chain to an explosive
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target Explosive <OBJECT>

 *
 * Return Value:
 * Able to Daisy Chain to<BOOL>
 *
 * Example:
 * if ([player,_explosive] call ACE_Explosives_fnc_canDaisyChain) then {hint "Can Daisy Chain";};
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_explosive","_target","_explosive","_result"];
_unit = _this select 0;
_target = _this select 1;
_result = false;

if (!([_unit] call FUNC(isDaisyChaining))) exitWith {false};

_explosive = _unit getVariable QGVAR(DaisyChain) select 1;
if (_explosive == _target getVariable QGVAR(Explosive)) exitWith {false};

_result = [_explosive, _target, 25] call FUNC(checkDaisyChain);

_result
