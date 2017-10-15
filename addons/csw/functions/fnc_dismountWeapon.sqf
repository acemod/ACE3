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
			
			private _weaponPos = getPosATL _weapon;
			private _weaponDir = getDir _weapon;
			private _backpackClassname = getText(configfile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(cswOptions) >> "ace_csw_disassembleTo");
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
				
			_weaponPos = _cswTripod getRelPos[0.5, 90];
			_weaponPos set[2, (_weaponPos select 2) + 0.5];
			// For some reason ARMA refuses to set the position of the backpack, so we must spawn it on its desired position
			private _backpack = createVehicle[_backpackClassname, [0, 0, 0], [], 0, "NONE"];
			_backpack setPos _weaponPos;
			_backpack setVelocity [0, 0, -0.05];
			
		};
		
		private _crewCheck = {
			params["_args"];
			_args params["_weapon"];
			((crew _weapon) isEqualTo [])
		};
		
		[25, [_weapon], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _crewCheck] call EFUNC(common,progressBar);
	}, [_weapon]] call CBA_fnc_execNextFrame;
};