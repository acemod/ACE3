/**
 * fn_openMenu_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target"];
if (count _this > 0) then {
	_target = _this select 0;

} else {
	_target = cursortarget;
};
if (player == _target) exitwith{};
CSE_SYS_VEHICLE_INTERACTION_TARGET = _target;
[player,_target] call cse_fnc_registerInteractingWith;
createDialog "cse_sys_vehicleMenu";

[_target] spawn {
	waituntil {sleep 0.1; !dialog};
	[player,_this select 0] call cse_fnc_unregisterInteractingWith;
};
