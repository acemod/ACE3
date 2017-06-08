/*
 * Author: esteldunedain
 * Removes a magazine from the unit that has an specific ammo count
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine <STRING>
 * 2: Ammo count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "magazine", 5] call ace_common_fnc_removeSpecificMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_magazineType", "", [""]], ["_ammoCount", 0, [0]]];

private _isRemoved = false;

// Check uniform
private _magazines = magazinesAmmoCargo uniformContainer _unit select {_x select 0 == _magazineType};
private _index = _magazines find [_magazineType, _ammoCount];

if (_index > -1) exitWith {
    {
        _unit removeItemFromUniform (_x select 0);
        false
    } count _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (uniformContainer _unit) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
        false
    } count _magazines;
};

// Check vest
_magazines = magazinesAmmoCargo vestContainer _unit select {_x select 0 == _magazineType};
_index = _magazines find [_magazineType, _ammoCount];

if (_index > -1) exitWith {
    {
        _unit removeItemFromVest (_x select 0);
        false
    } count _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (vestContainer _unit) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
        false
    } count _magazines;
};

// Check backpack
_magazines = magazinesAmmoCargo backpackContainer _unit select {_x select 0 == _magazineType};
_index = _magazines find [_magazineType, _ammoCount];

if (_index > -1) exitWith {
    {
        _unit removeItemFromBackpack (_x select 0);
        false
    } count _magazines;

    {
        if (!_isRemoved && (_x isEqualTo [_magazineType,_ammoCount])) then {
            _isRemoved = true;
        } else {
            (backpackContainer _unit) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
        false
    } count _magazines;
};
