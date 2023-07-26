/*
Author: Kerc, original by www.3commandobrigade.com
Allows a player to pick up a tripod and place in the launcher slot
Arguments:
0: tripod
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

private ["_tripod"];
_tripod = _this select 0;

if (alive (call SPE_fnc_findPlayer)) then {
	if ((_tripod isKindOf "SPE_Tripod_Bag") && ((secondaryWeapon (call SPE_fnc_findPlayer)) == "")) then {
		//hint "Picking up static tripod and replacing with launcher tripod";
		(call SPE_fnc_findPlayer) addWeapon (getText(configFile >> "cfgVehicles" >> (typeOf _tripod) >> "SPE_Equipped_Tripod_Name"));
		deleteVehicle _tripod;
	};
};
