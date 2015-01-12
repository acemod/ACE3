/**
 * fn_isCamelbak_FR.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_return", "_object"];
_object = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_return = false;
if (isClass (ConfigFile >> "cfgWeapons" >> typeOf _object)) then {
	_return = getNumber(ConfigFile >> "cfgWeapons" >> typeOf _object >> "cse_camelbak_maxContent") > 0;
};
_return