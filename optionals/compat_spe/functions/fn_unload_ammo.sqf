/*
Author: Kerc, original by www.3commandobrigade.com
Remove ammo from static weapon
Arguments:
0: static weapon platform
Return Value:
None
*/

//////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

private ["_weaponPlatform", "_magazines", "_magName", "_ammoCount"];
_weaponPlatform = _this select 0;

if (alive (call SPE_fnc_findPlayer)) then {
	_magazines = _weaponPlatform magazinesTurret [0];
	if ((count _magazines) > 0) then {
		{
			_x params ["_magName","_ammoCount"];
			[_magName, _ammoCount] call SPE_Weapons_Static_fnc_drop_magazine;
			[_weaponPlatform, [_magName, [0]]] remoteExec ["removeMagazineTurret",_weaponPlatform];
		} foreach magazinesAmmo [_weaponPlatform,true];
	};
};
