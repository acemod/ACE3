/*
 * Author: Loren Luke Leimer
 * Attaches an explosive (via ACE_DefuseObject) to a units daisy chain variable
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target Explosive <OBJECT>

 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [player,_explosive] call ACE_Explosives_fnc_startDaisyChain;
 *
 * Public: Yes
 */
 
 #include "script_component.hpp"

private ["_unit","_target"];

_unit = _this select 0;
_target = _this select 1;
_explosive = _target getVariable QGVAR(Explosive);

_unit setVariable [QGVAR(DaisyChain), [true,_explosive], true];