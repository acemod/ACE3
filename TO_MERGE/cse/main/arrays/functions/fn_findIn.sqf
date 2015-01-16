/**
 * fn_findIn.sqf
 * @Descr: Get the index of the first element that is equal to compare value
 * @Author: Glowbal
 *
 * @Arguments: [array ARRAY, value ANY (The compared value)]
 * @Return: NUMBER (-1 is not found. Else index of element in array)
 * @PublicAPI: true
 */

private ["_array", "_value", "_return"];
_array = _this select 0;
_value = _this select 1;

_return = -1;
{
	if (_x isEqualTo _value) exitwith {
		_return = _foreachIndex;
	};
}foreach _array;

_return;