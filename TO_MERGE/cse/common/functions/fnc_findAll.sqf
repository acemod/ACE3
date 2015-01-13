/**
 * fn_findAll.sqf
 * @Descr: Find all elements for which the code returns true
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY, if CODE (Code called for each element. Should return a bool)]
 * @Return: ARRAY Array with elements for which the if code returned true.
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_array", "_if", "_return"];
_array = _this select 0;
_if = _this select 1;

_return = [];
{
	if (_x call _if) then {
		_return pushback _x;
	};
}foreach _array;

_return;