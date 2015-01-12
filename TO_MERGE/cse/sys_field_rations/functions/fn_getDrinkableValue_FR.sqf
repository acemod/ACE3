/**
 * fn_getDrinkableValue_FR.sqf
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

if ([_item] call cse_fnc_itemIsDrinkable_FR) then {
	_return = getNumber(ConfigFile >> "CfgWeapons" >> _item >> "cse_isDrinkable");
};
_return;