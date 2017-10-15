/*
 * Author: TCVM
 * Dismounts the weapon from the tripod and drops its backpack beside
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_dismountWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

params["_weapon"];

if (isNull GVAR(cswTripod)) then {
	[{
		params["_weapon"];
		private _onFinish = {
			params["_args"];
			_args params["_weapon"];
			
			private _carryWeaponClassname = getText(configFile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(cswOptions) >> "ace_csw_disassembleTo");
			
			private _weaponPos = getPosATL _weapon;
			private _weaponDir = getDir _weapon;
			private _ammo = magazinesAmmoFull _weapon;
			
			{
				private _magazineAmmoCount = _x select 1;
				while {_magazineAmmoCount > 0} do {
					private _ammoRemoved = [_weapon, false] call FUNC(unloadAmmo);
					_magazineAmmoCount = _magazineAmmoCount - _ammoRemoved;
				};
			} forEach _ammo; // forEach so if a CSW has more than 1 magazine loaded it will still remove the ammo and give it back
			
			deleteVehicle _weapon;
			
			private _cswTripod = createVehicle [QGVAR(tripodObject), [0, 0, 0], [], 0, "NONE"];
			_cswTripod setPosATL _weaponPos;
			_cswTripod setDir _weaponDir;
			_cswTripod setVelocity [0, 0, -0.05];
			_cswTripod setVectorUp (surfaceNormal _weaponPos);
				
			_weaponPos = _cswTripod getRelPos[1.5, 90];
			private _weaponHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
			_weaponHolder setPosATL _weaponPos;
			_ammoHolder setDir random[0, 180, 360];
			_weaponHolder addWeaponCargoGlobal[_carryWeaponClassname, 1];
			
		};
		
		private _crewCheck = {
			params["_args"];
			_args params["_weapon"];
			((crew _weapon) isEqualTo [])
		};
		
		private _turretClassname = getArray(configFile >> "CfgVehicles" >> typeof(_weapon) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
		private _deployTime = getNumber(configFile >> "CfgWeapons" >> _turretClassname >> QGVAR(cswOptions) >> "pickupTime");
		[_deployTime, [_weapon], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _crewCheck] call EFUNC(common,progressBar);
	}, [_weapon]] call CBA_fnc_execNextFrame;
};