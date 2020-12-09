#include "script_component.hpp"
/*
 * Author: TCVM and PabstMirror
 * Handles returned ammo (either from unloading or leftovers from linking)
 *
 * Arguments:
 * 0: Man or Vehicle <OBJECT>
 * 1: Carry Magazine <STRING>
 * 2: Ammo in magazine <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_csw_100Rnd_127x99_mag", 70] call ace_csw_fnc_reload_handleReturnAmmo
 *
 * Public: No
 */

params ["_unloadTo", "_carryMag", "_ammo"];
TRACE_3("reload_handleReturnAmmo",_unloadTo,_carryMag,_ammo);

private _carryMaxAmmo = getNumber (configFile >> "CfgMagazines" >> _carryMag >> "count");
private _fullMagazines = floor (_ammo / _carryMaxAmmo);
private _bulletsRemaining = _ammo % _carryMaxAmmo;

if (_unloadTo isKindOf "CaManBase") then {
    while {(_fullMagazines > 0) && {_unloadTo canAdd _carryMag}} do {
        _unloadTo addMagazine [_carryMag, _carryMaxAmmo];
        _fullMagazines = _fullMagazines - 1;
    };
    if ((_bulletsRemaining > 0) && {_unloadTo canAdd _carryMag}) then {
        _unloadTo addMagazine [_carryMag, _bulletsRemaining];
        _bulletsRemaining = 0;
    };
};

if ((_fullMagazines == 0) && {_bulletsRemaining == 0}) exitWith {};

// Try to use existing container
private _container = _unloadTo getVariable [QGVAR(container), objNull];
if ((_container distance _unloadTo) > 4) then { _container = objNull; };
if (isNull _container) then {
    _container = (nearestObjects [_unloadTo, ["groundWeaponHolder"], 4]) param [0, objNull];
};


if (isNull _container) then {
    // Create ground weapon holder container
    private _weaponRelPos = _unloadTo getRelPos RELATIVE_DIRECTION(270);
    _weaponRelPos set [2, ((getPosATL _unloadTo) select 2) + 0.05];
    _container = createVehicle ["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
    // ToDo: Unload to ammo box??
    _unloadTo setVariable [QGVAR(container), _container, true];
    _container setDir random [0, 180, 360];
    _container setPosATL _weaponRelPos;
    if ((_weaponRelPos select 2) < 0.5) then {
        _container setVectorUp (surfaceNormal _weaponRelPos);
    };
    TRACE_2("Creating NEW Container",_container,_weaponRelPos);
};

TRACE_3("adding to container",_container,_fullMagazines,_bulletsRemaining);

if (_fullMagazines > 0) then {
    _container addMagazineAmmoCargo [_carryMag, _fullMagazines, _carryMaxAmmo];
};
if (_bulletsRemaining > 0) then {
    _container addMagazineAmmoCargo [_carryMag, 1, _bulletsRemaining];
};
