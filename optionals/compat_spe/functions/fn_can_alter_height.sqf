/*
Author: Kerc, original by www.3commandobrigade.com
Check if resupply of ammo to a static weapon is available
Arguments:
0: static weapon platform
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_weaponPlatform"];
private _unit = (call SPE_fnc_findPlayer);
private _canAlterHeight = false;

if ((alive _unit) && (vehicle _unit == _unit) && (alive _weaponPlatform) && ((count (crew _weaponPlatform)) < 1 ) && (!(_weaponPlatform lockedTurret [0]))) then {
	_canAlterHeight = true;
};

_canAlterHeight
