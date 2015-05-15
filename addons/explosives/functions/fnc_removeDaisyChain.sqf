/*
 * Author: Loren Luke Leimer
 * Removes an explosive from the global daisy chain list.
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [_explosive] call ACE_Explosives_fnc_removeDaisyChain;
 *
 * Public: Yes
 */

 #include "script_component.hpp"
   
 private ["_explosive"];
 
 _explosive = _this select 0;
 
 {
    if ((_x select 0 == _explosive) || (_x select 1 == _explosive)) then {
	    GVAR(DaisyChains) = GVAR(DaisyChains) - [_x];
	};
 } forEach GVAR(DaisyChains);