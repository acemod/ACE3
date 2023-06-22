#include "script_component.hpp"
/*
 * Author: Killerswin2
 * Removes ammo from turret and replaces it with the equivalent cws ammo.
 *
 * Arguments:
 * 0: Vehicle
 * 
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_csw_fnc_staticWeaponVehicleInit;
 *
 * Public: No
 */

params["_vehicle"];
// exit with the user doesn't want the ammo to be replaced
if(!GVAR(replaceTurrentAmmoWithCSW)) exitwith {};
private _turretPath = [_vehicle] call EFUNC(common,getTurretGunner);
if((count _turretPath) isNotEqualTo 1) exitwith {};

// mags that will be replaced, [string, ammoCount]
private _replacementMags = [];
private _config = configFile >> "CfgMagazines";

//default to the maxLoad encase something change the value from the config
private _addLoad = maxLoad _vehicle;

{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if (_xTurret isEqualTo _turretPath && {_xAmmo isNotEqualTo 0}) then {

        _vehicle removeMagazineTurret [_xMag, _xTurret];
        private _cswMag = _xMag call FUNC(getCarryMagazine);
        _addLoad = _addLoad + getNumber(_config >> _cswMag >> "mass");
        _replacementMags pushback [_cswMag, _xAmmo];
    };
} forEach (magazinesAllTurrets _vehicle);

// set the load, so that users can remove the mags and add them other items to the vehicle.
[_vehicle, _addLoad] remoteExecCall ["setMaxLoad", 2];

{
    _x params ["_cswMag", "_xAmmo"];
    _vehicle addMagazineAmmoCargo [_cswMag, 1, _xAmmo];
} forEach _replacementMags;
