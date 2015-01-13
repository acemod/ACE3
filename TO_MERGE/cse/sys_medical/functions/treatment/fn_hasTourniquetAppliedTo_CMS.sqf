/**
 * fn_hasTourniquetAppliedTo_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_part","_selectionName","_tourniquets"];
_unit = _this select 0;
_selectionName = _this select 1;
_part =	[_selectionName] call cse_fnc_getBodyPartNumber_CMS;
_tourniquets = [_unit,"cse_tourniquets"] call cse_fnc_getVariable;
((_tourniquets select _part) > 0)