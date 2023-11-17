#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Remove virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of STRINGS> <BOOL>
 * 2: Remove globally <BOOL> (default: false)
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

params [["_object", objNull, [objNull]], ["_items", [], [true, [""]]], ["_global", false, [false]]];

if (isNull _object || {_items isEqualTo []}) exitWith {};

if (_items isEqualType true) then {
    if (_items) then {
        [_object, _global] call FUNC(removeBox);
    };
} else {
    private _cargo = _object getVariable QGVAR(virtualItems);

    if (isNil "_cargo") exitWith {
        [_object, _global] call FUNC(removeBox);
    };

    // Make sure all items are in string form, then convert to config case (non-existent items return "")
    _items = (_items select {_x isEqualType ""}) apply {_x call EFUNC(common,getConfigName)};

    // Remove any invalid/non-existing items
    _items = _items - [""];

    private _configItemsFlat = uiNamespace getVariable QGVAR(configItemsFlat);

    // Convert all items to their baseWeapon
    _items = _items apply {if (_x in _configItemsFlat) then {_x} else {_x call FUNC(baseWeapon)}};

    // Remove items from lists
    {
        switch (true) do {
            // Weapons
            case (_x in ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_PRIMARY_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_PRIMARY_WEAPONS) deleteAt _x;
            };
            case (_x in ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_HANDGUN_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_HANDGUN_WEAPONS) deleteAt _x;
            };
            case (_x in ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_SECONDARY_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_SECONDARY_WEAPONS) deleteAt _x;
            };

            // Weapon attachments
            case (_x in ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) deleteAt _x;
            };
            case (_x in ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) deleteAt _x;
            };
            case (_x in ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) deleteAt _x;
            };
            case (_x in ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) deleteAt _x;
            };

            // Other
            default {
                for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
                    if (_x in (_cargo get _index)) exitWith {
                        (_cargo get _index) deleteAt _x;
                    };
                };
            };
        };
    } forEach _items;

    private _empty = [
        [IDX_VIRT_WEAPONS, createHashMapFromArray [[IDX_VIRT_PRIMARY_WEAPONS, createHashMap], [IDX_VIRT_SECONDARY_WEAPONS, createHashMap], [IDX_VIRT_HANDGUN_WEAPONS, createHashMap]]],
        [IDX_VIRT_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]]
    ];

    _empty = createHashMapFromArray _empty;

    for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
        _empty set [_index, createHashMap];
    };

    // If nothing is left, remove arsenal from object
    if (_cargo isEqualTo _empty) then {
        [_object, _global] call FUNC(removeBox);
    } else {
        _object setVariable [QGVAR(virtualItems), _cargo, _global];

        // If the arsenal is already open, refresh arsenal display
        if (_global) then {
            [QGVAR(refresh), _object] call CBA_fnc_globalEvent;
        } else {
            [QGVAR(refresh), _object] call CBA_fnc_localEvent;
        };
    };
};
