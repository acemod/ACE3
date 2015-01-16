/**
 * fn_itemIsRefillable_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_item", "_return", "_cfg"];
_item = [_this, 0, "", [""]] call bis_fnc_param;
_return = false;

_cfg = (ConfigFile >> "CfgWeapons" >> _item);
if (isClass _cfg) then {
	_return = (getText(_cfg >> "cse_onRefill") != "");
};

_return;