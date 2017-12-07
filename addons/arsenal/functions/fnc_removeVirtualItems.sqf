/*
 * Author: Alganthe
 * Remove virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_removeVirtualItems
 *
 * Public: Yes
*/
#include "script_component.hpp"

params [ ["_object", objNull, [objNull]], ["_items", [], [true, [""]]], ["_global", false, [false]] ];

if (_object == objNull) exitWith {};
if (_items isEqualType [] && {count _items == 0}) exitWith {};

private _cargo = _object getVariable [QGVAR(virtualItems), [
    [[], [], []], // Weapons 0, primary, handgun, secondary
    [[], [], [], []], // WeaponAccessories 1, optic,side,muzzle,bipod
    [ ], // Magazines 2
    [ ], // Headgear 3
    [ ], // Uniform 4
    [ ], // Vest 5
    [ ], // Backpacks 6
    [ ], // Goggles 7
    [ ], // NVGs 8
    [ ], // Binoculars 9
    [ ], // Map 10
    [ ], // Compass 11
    [ ], // Radio slot 12
    [ ], // Watch slot  13
    [ ], // Comms slot 14
    [ ], // WeaponThrow 15
    [ ], // WeaponPut 16
    [ ] // InventoryItems 17
]];

if (_items isEqualType true && {_items}) then {
    [_object, _global] call FUNC(removeBox);
    _object setVariable [QGVAR(virtualItems), nil, _global];
} else {

    // Make sure all items are in string form
    _items = _items select {_x isEqualType "" && {_x != ""}};

    {
        if (_forEachIndex isEqualTo 0) then {
            _cargo set [_forEachIndex, [(_x select 0) - _items, (_x select 1) - _items, (_x select 2) - _items]];
        } else {
            if (_forEachIndex isEqualTo 1) then {
                _cargo set [_forEachIndex, [(_x select 0) - _items, (_x select 1) - _items, (_x select 2) - _items, (_x select 3) - _items]];
            } else {
                _cargo set [_cargo find _x, _x - _items];
            };
        };
    } foreach _cargo;

    private _itemCount = {
        if (_x isEqualTo (_cargo select 0) || {_x isEqualTo (_cargo select 1)}) then {
            !(_x isEqualTo [[],[],[]] || {_x isEqualTo [[],[],[],[]]})
        } else {
            !(_x isEqualTo [])
        };
    } count _cargo;

    if (_itemCount == 0) then {
        [_object, _global] call FUNC(removeBox);
    } else {
        _object setVariable [QGVAR(virtualItems), _cargo, _global];
    };
};
