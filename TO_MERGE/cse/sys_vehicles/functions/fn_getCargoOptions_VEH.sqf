/**
 * fn_getCargoOptions_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return"];
_return = [];

//if (CSE_SYS_VEHICLE_INTERACTION_TARGET != (vehicle player)) then {
	if !(CSE_SYS_VEHICLE_INTERACTION_TARGET isKindOf "Man") then {
		if (!isNull([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH)) then {

		_return set [count _return, ["Unload Cargo","CloseDialog 0; [([CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_getSelectedData_VEH),CSE_SYS_VEHICLE_INTERACTION_TARGET] call cse_fnc_unloadObject_LOG;","Unload the current selected cargo"]];
		} else {
			_return set [count _return, ["Unload Cargo","hint 'You have to select an item in the list first!';","Unload the current selected cargo"]];
		};
	};
//};
_return