#include "..\script_component.hpp"
/*
 * Author: Katalam, Blue, Brett Mayson
 * Handle adjusting a magazine's ammo
 *
 * Arguments:
 * 0: Vehicle or Unit <OBJECT>
 * 1: Item <STRING>
 * 2: Count <NUMBER>
 *
 * Return Value:
 * Empty mag <BOOLEAN> - true if the magazine is empty after the ammo is consumed
 *
 * Example:
 * [player, "30Rnd_556x45_Stanag", 1] call ace_commone_fnc_adjustMagazineAmmo;
 *
 * Public: No
 */

params ["_unit", "_item", ["_count", -1]];

if (_unit isKindOf "CAManBase") then {
    // get matching non-loaded mags
    private _magazines = (magazinesAmmoFull _unit) select {(_x select 0) == _item && _x select 2 == false};
    // use items in uniform first, then vest, then backpack
    _magazines = _magazines apply {
        _x params ["_class", "_ammo", "_loaded", "", "_location"];
        [_class, _ammo, switch (_location) do {
            case "Uniform": {
                0
            };
            case "Vest": {
                1
            };
            case "Backpack": {
                2
            };
        }]
    };
    _magazines sort true;
    _unit removeMagazines _item;
    (_magazines select 0) params ["_class", "_ammo", "_location"];
    _magazines set [0, [_class, _ammo + _count, _location]];
    {
        _x params ["_class", "_ammo", "_location"];
        if (_ammo > 0) then {
            switch (_location) do {
                case 0: {
                    uniformContainer _unit
                };
                case 1: {
                    vestContainer _unit
                };
                case 2: {
                    backpackContainer _unit
                };
            } addMagazineAmmoCargo [_class, 1, _ammo];
        };
    } forEach _magazines;
    _ammo + _count <= 0
} else {
    private _cargoMags = magazinesAmmoCargo _unit;
    private _itemIndex = _cargoMags findIf {_x select 0 isEqualTo _item};
    if (_itemIndex == -1) exitWith {};
    clearMagazineCargoGlobal _unit;
    {
        if (_forEachIndex == _itemIndex) then {
            if (((_x select 1) + _count) > 0) then {
                _unit addMagazineAmmoCargo [_x select 0, 1, ((_x select 1) + _count)];
            };
        } else {
            _unit addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        };
    } forEach _cargoMags;
    ((_cargoMags select _itemIndex) select 1) + _count <= 0
};
