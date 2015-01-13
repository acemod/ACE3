/**
 * init.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

waituntil {!isnil "cse_main"};
waituntil {!isnil "cse_fnc_defineVariable"};

cse_fnc_interactWithVehicle_Condition = {
private ["_return"];
	_return = false;
	if (((_this select 0) distance (_this select 1) < 15)) then {
		if (((_this select 1) isKindOf "Car") || ((_this select 1) isKindOf "Air") || ((_this select 1) isKindOf "Tank")) then {
			_return = true;
		};
	};
	_return
};

_entries = [
	["Vehicle", {(_this call cse_fnc_interactWithVehicle_Condition) && (vehicle player == player)}, CSE_ICON_PATH + "icon_vehicle.paa",
		{
			closeDialog 0;
			[_this select 1] call cse_fnc_openMenu_VEH;
		}, "Vehicle Interaction"],

		["Vehicle", {(vehicle player != player)}, CSE_ICON_PATH + "icon_vehicle.paa",
		{
			closeDialog 0;
			[vehicle player] call cse_fnc_openMenu_VEH;
		}, "Vehicle Interaction"]
];
["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;