/*
Author: Kerc, original by www.3commandobrigade.com 
Allows a player to toggle on and off the mortar range table
Arguments:
none
Return Value:
none
*/
	
/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
private["_handled"];

_handled = false;

if (alive (call SPE_fnc_findPlayer)) then {
	if ((vehicle (call SPE_fnc_findPlayer)) isKindOf "SPE_Static_Mortar_Base") then {
		// player is the gunner of the mortar and so range table is displayed in mortar UI
		(call SPE_fnc_findPlayer) setVariable ["SPE_Range_Table", !((call SPE_fnc_findPlayer) getVariable["SPE_Range_Table", false])];
		_handled = true;
	};
};
_handled