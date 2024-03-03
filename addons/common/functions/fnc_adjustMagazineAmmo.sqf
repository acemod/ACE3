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

private _lowestCount = 999;
private _lowestIndex = 0;

if (_unit isKindOf "CAManBase") then {
    private _magazines = [];
    {
        _x params ["_class", "_ammo", "_loaded", "", "_location"];
        if (_class == _item && !_loaded) then {
            _magazines pushBack _x;
            if (_ammo < _lowestCount) then {
                _lowestCount = _ammo;
                _lowestIndex = count _magazines - 1;
            };
        };
    } forEach (magazinesAmmoFull _unit);
    if (_magazines isEqualTo []) exitWith {};
    _unit removeMagazines _item;
    (_magazines select _lowestIndex) params ["_class", "_ammo", "_loaded", "", "_location"];
    _magazines set [_lowestIndex, [_class, _ammo + _count, _loaded, "", /* tolower _location - no command, will always go to first empty container */ ""]];
    {
        _x params ["_class", "_ammo", "_loaded", "", "_location"];
        if (_ammo > 0) then {
            [_unit, _class, _location, _ammo] call FUNC(addToInventory);
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
