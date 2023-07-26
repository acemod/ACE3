/*
Author: Kerc, original by www.3commandobrigade.com
Check if resupply of ammo to a static weapon is available
Arguments:
0: static weapon platform
1: default magazine to load [optional]
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
params ["_weaponPlatform",["_defaultMag",""]];
private _unit = (call SPE_fnc_findPlayer);
private _canResupply = false;

if ((alive _unit) && (alive _weaponPlatform) && (vehicle _unit == _unit || vehicle _unit == _weaponPlatform)) then {

	// Limit the reload capacity of a static weapon to 1 magazines
	if ((count (_weaponPlatform magazinesTurret [0])) < 1) then {
		private _staticWeapon = (_weaponPlatform weaponsTurret [0]) select 0;
		private _magazines = (magazines _unit) apply {toLower _x};
		private _listOfMagNames = (compatibleMagazines _staticWeapon) apply {toLower _x};

		if (_defaultMag == "") then {
			{ if (toLower _x in _magazines) exitWith {_canResupply = true;}; } forEach _listOfMagNames;
		} else {
			if (_defaultMag in _magazines) exitWith {_canResupply = true;};
		};
	};
};

_canResupply
