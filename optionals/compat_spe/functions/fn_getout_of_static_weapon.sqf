/*
Author: Kerc, original by www.3commandobrigade.com
Allows a player to get out of a static weapon with or without a weapon equipped
Arguments:
Weapon equipped: 0 = unarmed, 1 = primary
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
private ["_weapon", "_handled", "_veh"];

_weapon = _this select 1;

_handled = false;
_veh = vehicle (call SPE_fnc_findPlayer);

if ((alive (call SPE_fnc_findPlayer)) && ((_veh isKindOf "SPE_Static_MG_Base") || (_veh isKindOf "SPE_Static_Mortar_Base"))) then {
	_handled = true;
	moveOut (call SPE_fnc_findPlayer);

	if (_weapon == 0) then {
		(call SPE_fnc_findPlayer) selectWeapon "";
	};
};

_handled
