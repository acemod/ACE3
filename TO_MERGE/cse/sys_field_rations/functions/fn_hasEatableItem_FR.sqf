/**
 * fn_hasEatableItem_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_return", "_magazines"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_return = false;

_magazines = items _unit;
{
	if ([_x] call cse_fnc_itemIsEatable_FR) exitwith {
		_return = true;
	};
}foreach _magazines;

_return;