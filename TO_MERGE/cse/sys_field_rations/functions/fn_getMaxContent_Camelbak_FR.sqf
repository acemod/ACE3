/**
 * fn_getMaxContent_Camelbak_FR.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_camelbak"];
_camelbak = [_this, 0, objNull, [objNull]] call bis_fnc_param;
getNumber(ConfigFile >> "cfgWeapons" >> typeOf _camelbak >> "cse_camelbak_maxContent");