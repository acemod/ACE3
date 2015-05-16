/*
 * Author: Loren Luke Leimer
 * Checks if a two explosives are within range of each other
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Target Explosive <OBJECT>
 * 2: Range <SCALAR>
 *
 *
 * Return Value:
 * in range <BOOL>
 *
 * Example:
 * if ([_explosive, _target, 15] call ACE_Explosives_fnc_checkDaisyChain) then {hint "in range";};
 *
 * Public: Yes
*/

#include "script_component.hpp";

private ["_explosive","_target","_range","_result"];
_explosive = _this select 0;
_target = _this select 1;
_range = _this select 2;
_result = false;

if (_explosive distance _target < _range) then {_result = true};

_result 

