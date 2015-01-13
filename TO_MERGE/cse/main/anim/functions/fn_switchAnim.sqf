/**
 * fn_switchAnim.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_anim"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_Param;
_anim = [_this,1,"",[""]] call BIS_fnc_Param;
_unit switchMove _anim;
_unit playMove _anim;