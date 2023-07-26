/*
Author: Kerc, original by www.3commandobrigade.com
EH to allow a player to drop a tripod from the launcher slot, converting it into a weapon base
Arguments:
0: unit
1: container (not used)
2: item
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

private ["_unit", "_container", "_item"];
_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;

if !(_container isKindOf "GroundWeaponHolder") exitWith {}; //So this doesn't run when placing a tripod in a vehicle/box
if (alive _unit) then {
	//diag_log format ["EH Put: unit = %1, container  = %2, item = %3", _unit, _container, _item];

	// isKindOf does not currently work for weapons
	if ((getNumber(configFile >> "cfgWeapons" >> _item >> "SPE_isTripod")) > 0) then {
		//hint "Dropping launcher tripod and replacing with static tripod";
		private _cargo = weaponCargo _container;

		{
			if (_x == _item) exitWith { _rc = _container; };
		} forEach _cargo;

		if (!(isNull _container)) then {
			// GroundWeaponHolder found, so delete it and replace with a deployed bipod
			//diag_log format ["deleting object %1", _rc];
			//deleteVehicle (_rc); - lets not delete the weapon holder incase it holds something other than the tripod
			private _weaponsItemsCargo = weaponsItemsCargo _container;

			clearWeaponCargoGlobal _container;

			{
				_x params ["_weapon","","","","_primaryMuzzleMagazine"];
				_primaryMuzzleMagazine params ["_primaryMagazine","_primaryMagazineCount"];

				if (_weapon != _item) then {
					_container addWeaponWithAttachmentsCargoGlobal [_x,1];
				}
				else
				{
					if !(isNil "_primaryMagazine") then
					{
						if (_unit canAdd _primaryMagazine) then
						{
							_unit addmagazine [_primaryMagazine,_primaryMagazineCount];
						}
						else
						{
							_container addMagazineAmmoCargo [_primaryMagazine, 1, _primaryMagazineCount];
						};
					};
				};
			} forEach _weaponsItemsCargo;

			private _pos = (getPosATL _unit) vectorAdd ((vectorDir _unit) vectorMultiply 1.1);

			// Note M6 is also considered a tripod as far as the next instruction is concerned.
			createVehicle [getText(configFile >> "cfgWeapons" >> _item >> "SPE_Deployed_Tripod_Name"), _pos, [], 0, "CAN_COLLIDE"] setVectorDir (vectorDir _unit);
		};
	};
};
