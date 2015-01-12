/**
 * fn_dragObject_LOG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DISTANCE_OBJECT 	1.3

private ["_caller", "_object", "_attachToPos"];
_caller = _this select 0;
_object = _this select 1;

_attachToPos = [0, DISTANCE_OBJECT, (_caller worldToModel (_object modelToWorld [0,0,0])) select 2];
if ([_caller, _object, _attachToPos, false] call cse_fnc_carryObj) then {
	closeDialog 0;
	[player, "STR_CSE_LOG_DRAG_OBJECT","STR_CSE_LOG_START_DRAGGING"] call cse_fnc_sendDisplayMessageTo;

	if (currentWeapon _caller == primaryWeapon _caller) then {
		[_caller, "AcinPknlMstpSrasWrflDnon", true] call cse_fnc_localAnim;
	} else {
		[_caller, "AcinPknlMstpSnonWnonDnon", true] call cse_fnc_localAnim;
	};
};