/**
 * fn_getEatableValue_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_item", "_return"];
_item = [_this, 0, "", [""]] call bis_fnc_param;
_return = 0;

if ([_item] call cse_fnc_itemIsEatable_FR) then {
	_return = getNumber(ConfigFile >> "CfgWeapons" >> _item >> "cse_isEatable");
};
_return;