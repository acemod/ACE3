/**
 * fn_hasAttachableItem_EQ.sqf
 * @Descr: Check if unit has an attachable Item.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_unit","_return"];
_unit = _this select 0;
_return = false;
{
	if ([_x] call cse_fnc_isAttachableItem_EQ) exitwith {
		_return = true;
	};
}foreach (magazines _unit);

_return