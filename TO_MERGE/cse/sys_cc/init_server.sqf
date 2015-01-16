/*
server_init.sqf
Usage: Initalizes the Command and Control Server functionality
Author: Glowbal

Arguments: array []
Returns: void

Affects: Server
Executes: All Localities
*/

//if (isServer) exitwith{};

if (isnil "CSE_CC_LOGIC_OBJECT_CC") then {
	_group = createGroup sideLogic;
	CSE_CC_LOGIC_OBJECT_CC = _group createUnit ["logic", [1,1,1], [], 0, "FORM"];
	publicVariable "CSE_CC_LOGIC_OBJECT_CC";
//	[] call cse_fnc_assignTrackerIDs_Server_CC; // temp disabled, switching to non id based???
};