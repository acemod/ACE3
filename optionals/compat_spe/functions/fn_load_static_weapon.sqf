/*
Author: Kerc, original by www.3commandobrigade.com
Allows a player to load a static weapon with a magazine
Arguments:
none
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
params ["_weaponPlatform"];
private _handled = false;
private _unit = (call SPE_fnc_findPlayer);

if ((alive _weaponPlatform) && {(vehicle _unit == _unit || ((vehicle _unit) == _weaponPlatform))}) then
{
	// Check the weapon is functioning and out of ammo
	if ((!(_weaponPlatform lockedTurret [0])) &&  ((count magazines _weaponPlatform) isEqualTo 0)) then
	{
		_handled = [_weaponPlatform] call SPE_Weapons_Static_fnc_attempt_to_resupply_ammo;
	};
};
_handled
