/**
 * fn_hasCamelbak_FR.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */


private ["_unit"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;

if !(_unit isKindOf "CAManBase") exitwith {false};
([uniformContainer _unit] call cse_fnc_isCamelbak_FR);