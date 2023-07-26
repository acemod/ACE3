/*
Author: Kerc, original by www.3commandobrigade.com
Resupply ammo to a static weapon
Arguments:
0: static weapon platform
1: default magazine to load [optional]
Return Value:
None
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

private _weaponPlatform = _this select 0;
private _unit = (call SPE_fnc_findPlayer);

if (alive _unit) then {
	private _staticWeapon = (_weaponPlatform weaponsTurret [0]) select 0;
	private _listOfMagNames = (compatibleMagazines _staticWeapon) apply {toLower _x};
	private _desiredAmmoCount = -1;
	private _chosenMagName = "";

	// Search for magazine on the player
	{
		_x params ["_magName","_ammoCount"];
		_magname = toLower (_magName);
		if (_magName in _listOfMagNames && {_ammoCount > _desiredAmmoCount}) then	{
			_desiredAmmoCount = _ammoCount;
			_chosenMagName = _magName;
		};
	} forEach magazinesAmmo _unit;

	if (_desiredAmmoCount != -1) then {
		// Remove Magazine from unit/container
		[_unit,_chosenMagName,_desiredAmmoCount] call SPE_Weapons_Static_fnc_removeMagazine;
		// Add magazine to weapon
		[_weaponPlatform,_chosenMagName,[0],_desiredAmmoCount] remoteExec ["SPE_Weapons_Static_fnc_addMagazine",_weaponPlatform];
	};
};
