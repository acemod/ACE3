/*
 * Author: TCVM
 * Loads ammo into the CSW and removes it from the player inventory
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CSW, player] call ace_csw_fnc_loadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw", "_player"];

private _cswWeapon = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _cswMagazines = getArray(configFile >> "CfgWeapons" >> _cswWeapon >> "magazines");

private _magazineSelected = "";
private _magazineAmmoCount = 0;
private _maxAmmo = [_csw] call FUNC(getMaxAmmo);

{
    if ((_x select 0) in _cswMagazines && (_csw ammo _cswWeapon) + (_x select 1) <= _maxAmmo) exitWith {
        _magazineSelected = _x select 0;
        _magazineAmmoCount = _x select 1;
        true
    };
} forEach magazinesAmmoFull(_player select 1);

if (_magazineAmmoCount == 0) then {
    hint "No room for ammo";
} else {
    [{
        params["_csw", "_cswWeapon", "_player", "_magazineSelected", "_magazineAmmoCount"];
        _player removeMagazineGlobal _magazineSelected;
        
        private _onFinish = {
            params["_args"];
            _args params["_csw", "_cswWeapon", "", "", "_magazineAmmoCount"];
            private _wantedAmmo = ((_csw ammo _cswWeapon) + _magazineAmmoCount);
            [QGVAR(addCSWAmmo), [_csw, _cswWeapon, _wantedAmmo]] call CBA_fnc_globalEvent;
            // due to an issue with locality, I set the ammo locally so the person who deployed the weapon sees the same result. It does NOT duplicate ammo
            _csw setAmmo [_cswWeapon, _wantedAmmo];
        };
        
        private _onFailure = {
            params["_args"];
            _args params["", "", "_player", "_magazineSelected", "_magazineAmmoCount"];
            _player addMagazine[_magazineSelected, _magazineAmmoCount];
        };
        
        private _deployTime = getNumber(configFile >> "CfgWeapons" >> _cswWeapon >> QGVAR(options) >> "ammoLoadTime");
        [_deployTime, [_csw, _cswWeapon, _player, _magazineSelected, _magazineAmmoCount], _onFinish, _onFailure, localize LSTRING(LoadingAmmo_progressBar)] call EFUNC(common,progressBar);
    }, [_csw, _cswWeapon, (_player select 1), _magazineSelected, _magazineAmmoCount]] call CBA_fnc_execNextFrame;
}

