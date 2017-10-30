/*
 * Author: TCVM
 * Unloads ammo out of the CSW and places it onto the ground
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Slow Unload <BOOL>
 * 2: Unload All Ammo <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CSW, false, false] call ace_csw_fnc_unloadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw", "_slowUnload", "_allAmmo"];

private _weaponPos = _csw getRelPos RELATIVE_DIRECTION(270);
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
private _deployTime = getNumber(configFile >> "CfgWeapons" >> _weaponTurret >> QGVAR(options) >> "ammoUnloadTime");

[{
    params["_duration", "_slowUnload", "_allAmmo", "_weaponPos", "_weaponMagazineClassname", "_maxAmmo", "_csw", "_weaponTurret"];
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

        [QGVAR(addCSWAmmo), [_csw, _weaponTurret, _ammoRemoved]] call CBA_fnc_globalEvent;
        _csw setAmmo [_weaponTurret, _ammoRemoved];
        _maxAmmo
    };
    
    private _codeCheck = {
        params["_args"];
        _args params["", "", "_maxAmmo", "_csw", "_weaponTurret"];
        ((_csw ammo _weaponTurret) - _maxAmmo) >= 0
    };

    if (_slowUnload) then {
        [_duration, [_weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret], _onFinish, {}, localize LSTRING(UnloadingAmmo_progressBar), _codeCheck] call EFUNC(common,progressBar);
    } else {
        if (_allAmmo) then {
            private _ammo = magazinesAmmoFull _csw;
            private _maxMagazineCapacity = getNumber(configFile >> "CfgMagazines" >> _weaponMagazineClassname >> "count");
            private _ammoCount = 0;
            {
                _ammoCount = _ammoCount + (_x select 1);
            } forEach _ammo; // forEach so if a CSW has more than 1 magazine loaded it will still remove the ammo and give it back
            
            private _extraAmmo = _ammoCount % _maxMagazineCapacity;
            _ammoCount = _ammoCount - _extraAmmo;
            
            private _ammoHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
            _ammoHolder setPosATL _weaponPos;
            _ammoHolder setVectorUp (surfaceNormal _weaponPos);
            _ammoHolder setDir random[0, 180, 360];
            _ammoHolder addMagazineAmmoCargo[_weaponMagazineClassname, _ammoCount / _maxMagazineCapacity, _maxMagazineCapacity];
            _ammoHolder addMagazineAmmoCargo[_weaponMagazineClassname, 1, _extraAmmo];
            
            [QGVAR(addCSWAmmo), [_csw, _weaponTurret, 0]] call CBA_fnc_globalEvent;
            _csw setAmmo [_weaponTurret, 0];
            
        } else {
            [[_weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret]] call _onFinish;
        };
    };
    
}, [_deployTime, _slowUnload, _allAmmo, _weaponPos, _weaponMagazineClassname, _maxAmmo, _csw, _weaponTurret]] call CBA_fnc_execNextFrame;

