/**
 * fn_foreachDo.sqf
 * @Descr: Execute code for each element in an array and collect the return values.
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY, do CODE (Code executed for each element)]
 * @Return: ARRAY Array with return values.
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_array", "_do", "_return"];
_array = _this select 0;
_do = _this select 1;

_return = [];
{
	_return pushback(_x call _do);
	false;
}count _array;

_return;