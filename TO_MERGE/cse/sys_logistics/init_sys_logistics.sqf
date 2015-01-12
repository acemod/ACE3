/*
	NAME: init
	USAGE: CSE SYS Logistics init file
	AUTHOR: Glowbal
	RETURN: void

*/


waituntil{!isnil "cse_gui"};
[format["LOG - Logistics Module initialised"],2] call cse_fnc_debug;

_entries = [
	[localize "STR_CSE_LOG_CARRY", cse_fnc_canCarryObj_LOG, CSE_ICON_PATH + "icon_movement.paa",
	{
		if ([_this select 0,_this select 1,[0,1.5,1],false] call cse_fnc_carryObj) then {
			closeDialog 0;
			[player, "STR_CSE_LOG_MOVE_OBJECT","STR_CSE_LOG_OBJECT_PICKED_UP"] call cse_fnc_sendDisplayMessageTo;

			[player, 10] call cse_fnc_limitSpeed;
		};
	}, localize "STR_CSE_LOG_CARRY_OBJECT"],

	[localize "STR_CSE_LOG_DRAG", cse_fnc_canDragObj_LOG, CSE_ICON_PATH + "icon_movement.paa", cse_fnc_dragObject_LOG, localize "STR_CSE_LOG_DRAG_OBJECT"],

	[localize "STR_CSE_LOG_DROP",{(!isNull ([(_this select 0)] call cse_fnc_getCarriedObj)) && !(([(_this select 0)] call cse_fnc_getCarriedObj) isKindOf "CaManBase")}, CSE_ICON_PATH + "icon_placedown.paa",
	{
		([_this select 0,ObjNull,[0,1,1]] call cse_fnc_carryObj);
		[player, "STR_CSE_LOG_DROPPED_OBJECT","STR_CSE_LOG_PLACED_DOWN_OBJECT"] call cse_fnc_sendDisplayMessageTo;
		closeDialog 0;
		player switchMove "";
		[player, -1] call cse_fnc_limitSpeed;
	},localize "STR_CSE_LOG_DROP_OBJECT"],

	[localize "STR_CSE_LOG_LOAD",{(!isNull ([(_this select 0)] call cse_fnc_getCarriedObj)) && !(([(_this select 0)] call cse_fnc_getCarriedObj) isKindOf "CaManBase")}, CSE_ICON_PATH + "icon_place_in.paa",
	{
		([_this select 0,ObjNull,[0,1,1]] call cse_fnc_carryObj);
		if ([(_this select 1),[(_this select 1)] call cse_fnc_findVehicle_LOG] call cse_fnc_loadObject_LOG) then {
			[player, "STR_CSE_LOG_LOAD_OBJECT","STR_CSE_LOG_LOADED_OBJECT"] call cse_fnc_sendDisplayMessageTo;
		};
		player switchMove "";
		closeDialog 0;
		[player, -1] call cse_fnc_limitSpeed;
	}, localize "STR_CSE_LOG_LOAD_OBJECT"]
];
["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;

	//call compile preprocessFile "cse\cse_sys_logistics\scripts\addactions.sqf";

