/**
 * fn_dialogMovementOrder_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target","_order"];
_target = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_order = [_this, 1, "",[""]] call BIS_fnc_Param;

switch (_order) do {
	case "Stop": {
		_target stop true;
	};
	case "Move": {
		_target stop false;
	};
	default {

	};
};