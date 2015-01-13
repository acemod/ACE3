/*
	NAME: Addactions
	USAGE: Adds the interaction options to objects
	AUTHOR: gobbo
	RETURN: void

*/

// == Carry system  ==
//CSE_Logistics_Pickup = player addaction ["Pick up object", "cse\cse_sys_logistics\scripts\carry\pickup.sqf", [], 6, false, true, "","(alive cursorTarget) AND (cursorTarget distance player <= 5) AND (cursortarget getVariable [""CSE_Logistics_Enable"", true]) AND ((cursortarget iskindof ""ReammoBox"") OR (cursortarget iskindof ""ReammoBox_F"")) && (isNull ([player] call cse_fnc_getCarriedObj))"];

//CSE_Logistics_Drop = player addaction ["Drop object", "cse\cse_sys_logistics\scripts\carry\drop.sqf", [], 6, false, true, "","(!isNull ([player] call cse_fnc_getCarriedObj))"];

// == Load system ==
//CSE_Logistics_Load = player addaction ["Load object", "cse\cse_sys_logistics\scripts\load\load.sqf", [], 6, false, true, "","(!isNull ([player] call cse_fnc_getCarriedObj)) && !(([player] call cse_fnc_getCarriedObj) isKindof 'Man') "];

//CSE_Logistics_Unload = player addaction ["Unload object", "cse\cse_sys_logistics\scripts\load\unload.sqf", [], 6, false, true, "","(alive cursorTarget) AND (cursorTarget distance player <= 10) AND (cursortarget getVariable [""CSE_Logistics_Loaded"", 0] > 0) AND (player getVariable [""CSE_HandsFree"", true])"];