/**
 * fn_localAnim.sqf
 * @Descr: Play an animation on a local machine using playMoveNow
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, animation STRING]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_anim","_persistent"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_anim = [_this, 1, "",[""]] call BIS_fnc_Param;

if (!local _unit) then {
	if (count _this >2) then {
		_persistent = [_this, 2, false, [false]] call BIS_fnc_Param;
		[[_unit,_anim], QUOTE(FUNC(playMoveNow)), _unit, _persistent] spawn EFUNC(common,execRemoteFnc);
	} else {
		[[_unit,_anim], QUOTE(FUNC(playMoveNow)), _unit, false] spawn EFUNC(common,execRemoteFnc);
	};
} else {
	[_unit,_anim] call FUNC(playMoveNow);
};