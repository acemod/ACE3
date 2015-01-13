/**
 * fn_canTapShoulder_GRP.sqf
 * @Descr: Check if caller can tap targets shoulder.
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, target OBJECT]
 * @Return: BOOL true if caller can tab target shoulder
 * @PublicAPI: true
 */


private ["_caller", "_target"];
_caller = _this select 0;
_target = _this select 1;

if (isnil "CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP") then {
	CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP = false;
};
if !(CSE_SYS_GROUPS_ALLOW_SHOULDER_TAPS_GRP) exitwith { false };

(_target isKindOf "CAManBase" && {[_target] call cse_fnc_isAwake} && {[_caller] call cse_fnc_canInteract} && {_caller distance _target < 3} && {_caller != _target})