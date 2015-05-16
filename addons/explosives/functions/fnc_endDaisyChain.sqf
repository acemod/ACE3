/*
 * Author: Loren Luke Leimer
 * Ends a unit's daisy chain, and chains two explosives together
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target Explosive <OBJECT>

 *
 * Return Value:
 * <NOTHING>
 *
 * Example:
 * [_unit,_target] call ACE_Explosives_fnc_daisyChainTo;
 *
 * Public: Yes
 */

 #include "script_component.hpp"
   
 private ["_unit","_target","_explosive"];

_unit = _this select 0;
_target = _this select 1 getVariable QGVAR(Explosive);

if (!([_unit] call FUNC(isDaisyChaining))) exitWith {false};

_explosive = _unit getVariable QGVAR(DaisyChain) select 1;

_result = [ARR_2(_unit, _target)] call FUNC(canDaisyChainTo);

if (_result) then {
    [_explosive, _target] call FUNC(daisyChainTo);
    [_unit] call FUNC(stopDaisyChain)
};

