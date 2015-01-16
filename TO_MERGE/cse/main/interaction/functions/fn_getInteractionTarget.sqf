/**
 * fn_getInteractionTarget.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_prevTarget"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_prevTarget = [_unit,"cse_interactionTarget"] call cse_fnc_getVariable;
_prevTarget