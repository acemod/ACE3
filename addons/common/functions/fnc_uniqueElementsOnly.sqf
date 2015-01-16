/**
 * fn_uniqueElementsOnly.sqf
 * @Descr: Make a copy of an array with only the unique elements.
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY]
 * @Return: ARRAY Copy of original array
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_array", "_result", "_value"];
_array = _this select 0;

_result = [];
{
	_value = _x;
	if ({_x isEqualTo _value} count _result == 0) then {
		_result pushback _x;
	};
}foreach _array;

_result;