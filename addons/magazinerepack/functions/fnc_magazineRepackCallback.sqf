// by commy2
#include "script_component.hpp"

private ["_unit", "_magazine", "_ammo", "_ammoCount", "_fullMagazinesCount", "_restAmmo", "_isLoaded", "_weapon", "_reloadAction", "_text", "_picture"];

_unit = ACE_player; //_this select 0;
_magazine = _this select 1;

// exit if the last magazine of this type was taken out of the backpack
if !(_magazine in magazines _unit) exitWith {};

// get current ammo count
_ammo = 0;
{
    if (_x select 0 == _magazine) then {
        _ammo = _ammo + (_x select 1);
    };
} forEach magazinesAmmoFull _unit;

// how many rounds fit in one mag
_ammoCount = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

// calculate new vaules
_fullMagazinesCount = floor (_ammo / _ammoCount);
_restAmmo = _ammo - _fullMagazinesCount * _ammoCount;

// remove old magazines
_unit removeMagazines _magazine;

_isLoaded = false;
// reload rifle
if (_magazine in primaryWeaponMagazine _unit) then {
    _weapon = primaryWeapon _unit;

    if (_fullMagazinesCount > 0) then {
        _unit setAmmo [_weapon, _ammoCount];
        _fullMagazinesCount = _fullMagazinesCount - 1;
    } else {
        _unit setAmmo [_weapon, _restAmmo];
        _restAmmo = 0;
    };

    if (_weapon == currentWeapon _unit) then {
        _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
        _unit playActionNow _reloadAction;
    };

    _isLoaded = true;
};

// reload pistol
if (_magazine in handgunMagazine _unit) then {
    _weapon = handgunWeapon _unit;

    if (_fullMagazinesCount > 0) then {
        _unit setAmmo [_weapon, _ammoCount];
        _fullMagazinesCount = _fullMagazinesCount - 1;
    } else {
        _unit setAmmo [_weapon, _restAmmo];
        _restAmmo = 0;
    };

    if (_weapon == currentWeapon _unit) then {
        _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
        _unit playActionNow _reloadAction;
    };

    _isLoaded = true;
};

// reload rocket launcher (just in case ...)
if (_magazine in secondaryWeaponMagazine _unit) then {
    _weapon = secondaryWeapon _unit;

    if (_fullMagazinesCount > 0) then {
        _unit setAmmo [_weapon, _ammoCount];
        _fullMagazinesCount = _fullMagazinesCount - 1;
    } else {
        _unit setAmmo [_weapon, _restAmmo];
        _restAmmo = 0;
    };

    if (_weapon == currentWeapon _unit) then {
        _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
        _unit playActionNow _reloadAction;
    };

    _isLoaded = true;
};

// add new magazines
for "_a" from 1 to _fullMagazinesCount do {
    _unit addMagazine _magazine;
};

if (_restAmmo > 0) then {
    _unit addMagazine [_magazine, _restAmmo];
};

// display text if successful
_text = format [localize "STR_ACE_MagazineRepack_RepackedMagazinesDetail", [_fullMagazinesCount, _fullMagazinesCount + 1] select _isLoaded, _restAmmo];
_picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

_text = parseText format ["<img align='center' size='1.8' color='#ffffff' image='%1'/> <br/> <t align='center'>%2</t> <br/> <t align='center'>%3</t>", _picture, localize "STR_ACE_MagazineRepack_RepackedMagazines", _text];

[_text] call EFUNC(common,displayTextStructured);
