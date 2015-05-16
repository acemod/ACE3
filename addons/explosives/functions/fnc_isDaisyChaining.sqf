/*
 * Author: Loren Luke Leimer
 * Checks if the unit is running a daisy chain
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * The unit is daisy chaining <BOOL>
 *
 * Example:
 * _isdaisychaining = [player] call ACE_Explosives_fnc_isDaisyChaining;
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_unit", "_result", "_magazines"];
_result = false;
_unit = _this select 0;

_result = _unit getVariable [QGVAR(DaisyChain),[false,objNull]] select 0;

_result
