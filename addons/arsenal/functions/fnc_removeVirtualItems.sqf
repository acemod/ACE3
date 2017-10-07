#include "script_component.hpp"
#include "..\defines.hpp"

params [ ["_object", objNull, [objNull]], ["_items", [], [true, [""]]], ["_global", false, [false]] ];

if (_object == objNull) exitWith {};
if (typeName _items isEqualTo "ARRAY" && {count _items == 0}) exitWith {};

private _cargo = _object getVariable [QGVAR(virtualItems), [
    [ ], // Weapons 0
    [ ], // WeaponAccessories 1
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


if (typeName _items isEqualTo "BOOL" && {_items}) then {
    _object setVariable [QGVAR(virtualItems), nil, _global];
} else {
    // Make sure all items are in string form
    _items = _items select (typename _x isEqualTo "STRING");
    {
        _cargo set [_cargo find _x, _x - _items];
    } foreach _cargo;

    _object setVariable [QGVAR(virtualItems), _cargo, _global];
};