#include "..\script_component.hpp"
/*
 * Author: Katalam, Blue, Brett Mayson, johnb43
 * Handle adjusting a magazine's ammo
 *
 * Arguments:
 * 0: Vehicle or Unit <OBJECT>
 * 1: Item <STRING>
 * 2: Ammo to adjust by <NUMBER> (default: -1)
 *
 * Return Value:
 * How much the ammo was adjusted by <NUMBER>
 *
 * Example:
 * [player, "30Rnd_556x45_Stanag", 1] call ace_common_fnc_adjustMagazineAmmo;
 *
 * Public: No
 */

params ["_unit", "_magazine", ["_count", -1]];

if (_count == 0) exitWith {0};

private _containers = if (_unit isKindOf "CAManBase") then {
    [uniformContainer _unit, vestContainer _unit, backpackContainer _unit]
} else {
    [_unit]
};

scopeName "main";

private _originalCount = _count;
private _container = objNull;
private _magazinesContainer = [];
private _newAmmoCount = 0;
private _removeAmmo = _count < 0;
private _maxMagazineAmmo = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

{
    _container = _x;

    // Get all magazines of _magazine type
    _magazinesContainer = (magazinesAmmoCargo _container) select {_x select 0 == _magazine};

    // Get the ammo count, filter out magazines with 0 ammo
    _magazinesContainer = (_magazinesContainer apply {_x select 1}) select {_x != 0};

    // If there are none, skip to next container
    if (_magazinesContainer isEqualTo []) then {
        continue;
    };

    // Sort, smallest first when removing, largest first when adding
    _magazinesContainer sort _removeAmmo;

    if (_removeAmmo) then {
        {
            _count = _x + _count;

            _container addMagazineAmmoCargo [_magazine, -1, _x];

            if (_count >= 0) then {
                // Only add magazine back if it's not empty
                if (_count != 0) then {
                    _container addMagazineAmmoCargo [_magazine, 1, _count];
                };

                _originalCount breakOut "main";
            };
        } forEach _magazinesContainer;
    } else {
        // This loop only fills up partially filled magazines
        {
            // Fill the magazine to either its max or until all ammo has been added
            _newAmmoCount = (_x + _count) min _maxMagazineAmmo;

            if (_newAmmoCount <= _maxMagazineAmmo) then {
                _container addMagazineAmmoCargo [_magazine, -1, _x];
                _container addMagazineAmmoCargo [_magazine, 1, _newAmmoCount];
            };

            // Remove the ammo that was added
            _count = _count - (_newAmmoCount - _x);

            if (_count <= 0) then {
                _originalCount breakOut "main";
            };
        } forEach (_magazinesContainer select {_x < _maxMagazineAmmo});
    };
} forEach _containers;

// If there is still remaining ammo to add, try add it after having iterated through all containers
if (!_removeAmmo && _count > 0) then {
    {
        while {_count > 0 && {_x canAdd _magazine}} do {
            _x addMagazineAmmoCargo [_magazine, 1, _count];

            _count = _count - _maxMagazineAmmo;
        };
    } forEach _containers;

    if (_count <= 0) then {
        _originalCount breakOut "main";
    };
};

_originalCount - _count
