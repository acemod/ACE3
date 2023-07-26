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
private _canUnload = false;

if ((alive _unit) && (alive _weaponPlatform) && (vehicle _unit == _unit || vehicle _unit == _weaponPlatform) && (((count (crew _weaponPlatform)) < 1 ) || (_unit in _weaponPlatform)) && (!(_weaponPlatform lockedTurret [0]))) then {
	_canUnload = (count (_weaponPlatform magazinesTurret [[0],false])) > 0;
};

_canUnload
