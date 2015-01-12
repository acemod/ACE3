/**
 * fn_tapShoulder_GRP.sqf
 * @Descr: Tap units shoulder.
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, target OBJECT (Unit that will be tapped)]
 * @Return:  void
 * @PublicAPI: true
 */

private ["_caller", "_target"];
_caller = _this select 0;
_target = _this select 1;

// If the target isn't local, we need to execute this function on the targets locality.
if (!local _target) exitwith {
	[[_caller, _target], "cse_fnc_tapShoulder_GRP", _target] call BIS_fnc_MP;
};
[[_caller, _target],"shoulderTapped"] call cse_fnc_customEventHandler_F;

// No need to execute this for non player units. We exit here for non player units, because we do want to execute the custom eventhandler.
if (!isPlayer _target) exitwith {};

// Display information for player to indicate that players should was tapped.
// This is done through a camShake and a display Message on the screen.
addCamShake [4, 0.5, 4];
[_target,localize "STR_CS_SHOULDER_TAP_GRP",format[localize "STR_CSE_SHOULDER_TAPPED_GRP", [_caller] call cse_fnc_getName]] call cse_fnc_sendDisplayMessageTo;