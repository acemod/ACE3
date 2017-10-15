/*
 * Author: TCVM
 * Unloads ammo out of the CSW and places it onto the ground
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * How much ammo was unloaded <NUMBER>
 *
 * Example:
 * [CSW] call ace_csw_fnc_unloadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw", "_slowUnload"];

private _duration = -1;
if (_slowUnload) then { _duration = 4; };

private _weaponPos = _csw getRelPos[1.5, 270];
private _weaponMagazineClassname = "";
private _ammo = magazinesAmmoFull _csw;
private _weaponTurret = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _weaponMagazines = getArray(configFile >> "CfgWeapons" >> _weaponTurret >> "magazines");

{
	if !((_x find "Dummy") >= 0) exitWith { _weaponMagazineClassname = _x; true};
} forEach _weaponMagazines;

private _maxMagazineCapacity = getNumber(configFile >> "CfgMagazines" >> _weaponMagazineClassname >> "count");
private _magazineAmmoCount = (_ammo select 0) select 1;
private _maxAmmo = _magazineAmmoCount min _maxMagazineCapacity;

[{
	params["_duration", "_weaponPos", "_weaponMagazineClassname", "_maxAmmo", "_csw", "_weaponTurret"];
	private _onFinish = {
		params["_args"];
		_args params["_weaponPos", "_weaponMagazineClassname", "_maxAmmo", "_csw", "_weaponTurret"];

		// Create magazine holder and spawn the ammo that was in the weapon
		private _ammoHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
		_ammoHolder setPosATL _weaponPos;
		_ammoHolder setVectorUp (surfaceNormal _weaponPos);
		_ammoHolder setDir random[0, 180, 360];
		_ammoHolder addMagazineAmmoCargo[_weaponMagazineClassname, 1, _maxAmmo];

		private _ammoRemoved = (_csw ammo _weaponTurret) - _maxAmmo;
		
		[QGVAR(addCSWAmmo), [_csw, _weaponTurret, _ammoRemoved]] call CBA_fnc_serverEvent;
		_csw setAmmo [_weaponTurret, _ammoRemoved];

		[QGVAR(addObjectToServer), [_ammoHolder]] call CBA_fnc_serverEvent;
	};
	
	if (_duration > 0) then {
		[_duration, [_weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret], _onFinish, {}, localize LSTRING(UnloadingAmmo_progressBar)] call EFUNC(common,progressBar);
	} else {
		[[_weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret]] call _onFinish;
	};
}, [_duration, _weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret]] call CBA_fnc_execNextFrame;

_maxAmmo