/**
 * fn_getRepairOptions_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return"];
_return = [];

if (CSE_SYS_VEHICLE_INTERACTION_TARGET != (vehicle player)) then {
	if (CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "CAR") then {
		//_return set [count _return, ["Replace Tires","[_this select 0,_this select 1] call CSE_fnc_dummy;","Replace the tires of this vehicle"]];
	};
	if ((CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "B_UAV_01_F" || CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "O_UAV_01_F" || CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "G_UAV_01_F") && ([player, "cse_battery_darter"] call cse_fnc_hasItem) && (fuel CSE_SYS_VEHICLE_INTERACTION_TARGET < 1)) then {
		_return pushback ["Replace Battery","[_this select 0,_this select 1] call cse_fnc_replaceBatteryDarter_veh;","Replace battery of the Darter"];
	};
};
_return