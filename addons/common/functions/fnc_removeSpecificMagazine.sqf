/*
 * Author: esteldunedain
 * Removes a magazine from the unit that has an specific ammo count
 *
 * Argument:
 * 0: Player <OBJECT>
 * 1: Magazine <STRING>
 * 2: Ammo count <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_player", "_magazineType", "_ammoCount"];

private ["_magazines","_index","_isRemoved"];
_isRemoved = false;

// Check uniform
_magazines = [magazinesAmmoCargo uniformContainer _player, {_this select 0 == _magazineType}] call FUNC(filter);
_index = _magazines find [_magazineType,_ammoCount];
if (_index > -1) exitWith {
    {
        _player removeItemFromUniform (_x select 0);
    } forEach _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (uniformContainer _player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
    } forEach _magazines;
};

// Check vest
_magazines = [magazinesAmmoCargo vestContainer _player, {_this select 0 == _magazineType}] call FUNC(filter);
_index = _magazines find [_magazineType,_ammoCount];
if (_index > -1) exitWith {
    {
        _player removeItemFromVest (_x select 0);
    } forEach _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (vestContainer _player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
    } forEach _magazines;
};

// Check backpack
_magazines = [magazinesAmmoCargo backpackContainer _player, {_this select 0 == _magazineType}] call FUNC(filter);
_index = _magazines find [_magazineType,_ammoCount];
if (_index > -1) exitWith {
    {
        _player removeItemFromBackpack (_x select 0);
    } forEach _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (backpackContainer _player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
    } forEach _magazines;
};
