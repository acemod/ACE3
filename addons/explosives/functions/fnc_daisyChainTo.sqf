/*
 * Author: Loren Luke Leimer
 * Daisy Chains two explosives together
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Target Explosive <OBJECT>

 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [_explosive,_target] call ACE_Explosives_fnc_daisyChainTo;
 *
 * Public: Yes
 */
#include "script_component.hpp"
  
private ["_unit","_target"];

_explosive = _this select 0;
_target = _this select 1;

if (isNil QGVAR(DaisyChains)) then {
    GVAR(DaisyChains) = [];
};

_result = false;

{
    if (count GVAR(DaisyChains) < 1) exitWith {};
    if (_x select 0 == _explosive) then {
	    if (_x select 1 == _target) then {_result = true};
	};
} forEach GVAR(DaisyChains);

if (!_result) then {

    GVAR(DaisyChains) pushBack [_explosive,_target];
	GVAR(DaisyChains) pushBack [_target, _explosive];
};
