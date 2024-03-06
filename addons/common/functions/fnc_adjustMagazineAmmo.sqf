#include "..\script_component.hpp"
/*
 * Author: Katalam, Blue, Brett Mayson
 * Handle adjusting a magazine's ammo
 *
 * Arguments:
 * 0: Vehicle or Unit <OBJECT>
 * 1: Item <STRING>
 * 2: Count <NUMBER> (default: -1)
 *
 * Return Value:
 * Empty mag <BOOLEAN> - true if the magazine is empty after the ammo is consumed
 *
 * Example:
 * [player, "30Rnd_556x45_Stanag", 1] call ace_common_fnc_adjustMagazineAmmo;
 *
 * Public: No
 */

params ["_unit", "_magazine", ["_count", -1]];

private _containers = if (_unit isKindOf "CAManBase") then {
    [uniformContainer _unit, vestContainer _unit, backpackContainer _unit]
} else {
    [_unit]
};

scopeName "main";

private _container = objNull;
private _magazinesContainer = [];
private _newAmmoCount = 0;

{
    _container = _x;

    // Get all magazines of _magazine type
    _magazinesContainer = (magazinesAmmoCargo _container) select {_x select 0 == _magazine};

    // If there are none, skip to next container
    if (_magazinesContainer isEqualTo []) then {
        continue;
    };

    // Get the ammo count
    _magazinesContainer = _magazinesContainer apply {_x select 1};

    // Sort, smallest first
    _magazinesContainer sort true;

    {
        _newAmmoCount = _x + _count;

        if (_newAmmoCount >= 0) exitWith {
            _container addMagazineAmmoCargo [_magazine, -1, _x];

            private _emptyMag = _newAmmoCount == 0;

            // Only add magazine back if it's not empty
            if (!_emptyMag) then {
                _container addMagazineAmmoCargo [_magazine, 1, _newAmmoCount];
            };

            _emptyMag breakOut "main";
        };
    } forEach _magazinesContainer;
} forEach _containers;

false
