/*
Author: Kerc, original by www.3commandobrigade.com
Determine what ammo the player has selected, whether it is available and only then load the static weapon
Also animates the player, removes new round and creates spent round
Arguments:
0: static weapon platform
1: default magazine to load [optional]
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_weaponPlatform"];

private _canResupply = false;
private _unit = (call SPE_fnc_findPlayer);

// Check that player has prepared a magazine
private _magazine = toLower (_unit getVariable ["SPE_Static_Weapon_Magazine",""]);
private _selectedMagazine = "";
if (_magazine == "")  then {
	hint (localize "STR_SPE_System_StaticWeapons_Hint_No_Ammo_Prepared");
} else {
	// Check that player has prepared a compatible magazine
	private _staticWeapon = (_weaponPlatform weaponsTurret [0]) select 0;
  private _listOfMagNames = (compatibleMagazines _staticWeapon) apply {toLower _x};

	if (!(_magazine in _listOfMagNames)) then	{
		hint (localize "STR_SPE_System_StaticWeapons_Hint_Wrong_Ammo_Prepared");
	}	else {
		private _playerIsGunner = (_unit == gunner _weaponPlatform);
		private _desiredAmmoCount = -1;
		private _container = objNull;

		private _ammoType = getText (configFile >> "cfgMagazines" >> _magazine >> "ammo");

		// Search for magazine on the player
		private _magazinesAmmo = (magazinesAmmo _unit) select
		{
			_x params ["_magName"];
			private _newammoType = getText (configFile >> "cfgMagazines" >> _magName >> "ammo");
			((toLower _magName) in _listOfMagNames && _ammoType == _newammoType)
		};
		//Find the largest magazine
    {
			_x params ["_magName","_ammoCount"];

			if (_ammoCount > _desiredAmmoCount) then	{
				_desiredAmmoCount = _ammoCount;
				_selectedMagazine = (toLower _magName);
			};

    } forEach _magazinesAmmo;
		if (_desiredAmmoCount != -1) then {
			_canResupply = true;
			_container = _unit;
		} else {
			// Search for magazines on the ground (within 2 metres)
			{
				private _holder = _x;
				private _magazinesAmmo = (magazinesAmmoCargo _holder) select
				{
					_x params ["_magName"];
					private _newammoType = getText (configFile >> "cfgMagazines" >> _magName >> "ammo");
					((toLower _magName) in _listOfMagNames && _ammoType == _newammoType)
				};
        {
					_x params ["_magName","_ammoCount"];

					if (_ammoCount > _desiredAmmoCount) then	{
						_desiredAmmoCount = _ammoCount;
						_selectedMagazine = (toLower _magName);
					};
        } forEach _magazinesAmmo;

				if (_desiredAmmoCount != -1) then
				{
					_canResupply = true;
					_container = _holder;
				};
			} forEach nearestObjects [getPosATL _unit, ["WeaponHolder"], 3];

			// Search for magazines in nearby crates (within 2 metres)
			if (!_canResupply) then {
				{
					private _holder = _x;
					private _magazinesAmmo = (magazinesAmmoCargo _holder) select
					{
						_x params ["_magName"];
						private _newammoType = getText (configFile >> "cfgMagazines" >> _magName >> "ammo");
						((toLower _magName) in _listOfMagNames && _ammoType == _newammoType)
					};
	        {
						_x params ["_magName","_ammoCount"];

						if (_ammoCount > _desiredAmmoCount) then	{
							_desiredAmmoCount = _ammoCount;
							_selectedMagazine = (toLower _magName);
						};
	        } forEach _magazinesAmmo;

					if (_desiredAmmoCount != -1) then
					{
						_canResupply = true;
						_container = _holder;
					};
				} forEach nearestObjects [getPosATL _unit, ["ReammoBox_F"], 3];
			};
		};

		if (_canResupply) then {
			// Do animation
			if !(_playerIsGunner) then {
				_unit playAction "PutDown";
			};
			
			// Remove Magazine from unit/container
			[_container,_selectedMagazine,_desiredAmmoCount] call SPE_Weapons_Static_fnc_removeMagazine;
			// Add magazine to weapon
			[_weaponPlatform,_selectedMagazine,[0],_desiredAmmoCount] remoteExec ["SPE_Weapons_Static_fnc_addMagazine",_weaponPlatform];

		} else {
			hint format [(localize "STR_SPE_System_StaticWeapons_Hint_No_Ammo")];
		};
	};
};
_canResupply
