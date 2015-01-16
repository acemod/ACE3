/**
 * fn_localAnim.sqf
 * @Descr: Play an animation on a local machine using playMoveNow
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, animation STRING]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit","_anim","_persistent"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_anim = [_this, 1, "",[""]] call BIS_fnc_Param;

if (!local _unit) then {
	if (count _this >2) then {
		_persistent = [_this, 2, false, [false]] call BIS_fnc_Param;
		[[_unit,_anim], "cse_fnc_playMoveNow", _unit, _persistent] spawn BIS_fnc_MP;
	} else {
		[[_unit,_anim], "cse_fnc_playMoveNow", _unit, false] spawn BIS_fnc_MP;
	};
} else {
	[_unit,_anim] call cse_fnc_playMoveNow;
};