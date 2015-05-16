/*
 * Author: Loren Luke Leimer
 * Handles the detonation of a daisy chain based on a given explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Fuze delay <OBJECT>

 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [_explosive,_time] call ACE_Explosives_fnc_detonateDaisyChain;
 *
 * Public: Yes
 */

#include "script_component.hpp"
   
private ["_explosive","_time"];

_explosive = _this select 0;
_time = _this select 1;

 
if (isNil QGVAR(DaisyChains)) then {
    GVAR(DaisyChains) = [];
};

{
    if (_x select 0 == _explosive) then {
    	_temparr = [_explosive, _x select 1];
	    GVAR(DaisyChains) = GVAR(DaisyChains) - [_x];
		if ([_explosive, _temparr select 1, 25] call FUNC(checkDaisyChain)) then {
		    [_explosive, -1, [_temparr select 1, _time]] call FUNC(detonateExplosive);
        };
    };



	if (_x select 1 == _explosive) then {
	    GVAR(DaisyChains) = GVAR(DaisyChains) - [_x];
	};
} forEach GVAR(DaisyChains);
