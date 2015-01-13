/**
 * fn_findIf.sqf
 * @Descr: Get the first element that returns true.
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY, if CODE (Code called for each element. Should return a bool)]
 * @Return: ANY. Any element. Default return is an empty array ([])
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_array", "_if"];
_array = _this select 0;
_if = _this select 1;

_return = [];
{
	if (_x call _if) exitwith {
		_return = _array select _foreachIndex;
	};
}foreach _array;

_return;