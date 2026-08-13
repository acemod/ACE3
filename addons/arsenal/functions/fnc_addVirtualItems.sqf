#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen, johnb43
 * Add virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <BOOL or ARRAY of STRINGs>
 * 2: Add globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_addVirtualItems
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_items", [], [true, []]], ["_global", false, [false]]];

if (isNull _object || {_items isEqualTo []}) exitWith {};

private _cargo = _object getVariable QGVAR(virtualItems);

if (isNil "_cargo") then {
    _cargo = [
        [IDX_VIRT_WEAPONS, createHashMapFromArray [[IDX_VIRT_PRIMARY_WEAPONS, createHashMap], [IDX_VIRT_SECONDARY_WEAPONS, createHashMap], [IDX_VIRT_HANDGUN_WEAPONS, createHashMap]]],
        [IDX_VIRT_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]]
    ];

    _cargo = createHashMapFromArray _cargo;

    for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
        _cargo set [_index, createHashMap];
    };
};

// If passed argument is "true", add all items
if (_items isEqualType true) then {
    if (_items) then {
        private _weapons = _cargo get IDX_VIRT_WEAPONS;
        private _weaponAttachments = _cargo get IDX_VIRT_ATTACHMENTS;
        private _configItems = uiNamespace getVariable QGVAR(configItems);

        // Add onto existing items, in case some items that were already added aren't available by default in the arsenal
        {
            (_x select 0) merge [_x select 1, true];
            (_x select 2) set [_x select 3, _x select 0];
        } forEach [
            [_weapons get IDX_VIRT_PRIMARY_WEAPONS, _configItems get IDX_VIRT_WEAPONS get IDX_VIRT_PRIMARY_WEAPONS, _weapons, IDX_VIRT_PRIMARY_WEAPONS],
            [_weapons get IDX_VIRT_SECONDARY_WEAPONS, _configItems get IDX_VIRT_WEAPONS get IDX_VIRT_SECONDARY_WEAPONS, _weapons, IDX_VIRT_SECONDARY_WEAPONS],
            [_weapons get IDX_VIRT_HANDGUN_WEAPONS, _configItems get IDX_VIRT_WEAPONS get IDX_VIRT_HANDGUN_WEAPONS, _weapons, IDX_VIRT_HANDGUN_WEAPONS],
            [_weaponAttachments get IDX_VIRT_OPTICS_ATTACHMENTS, _configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_OPTICS_ATTACHMENTS, _weaponAttachments, IDX_VIRT_OPTICS_ATTACHMENTS],
            [_weaponAttachments get IDX_VIRT_FLASHLIGHT_ATTACHMENTS, _configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_FLASHLIGHT_ATTACHMENTS, _weaponAttachments, IDX_VIRT_FLASHLIGHT_ATTACHMENTS],
            [_weaponAttachments get IDX_VIRT_MUZZLE_ATTACHMENTS, _configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_MUZZLE_ATTACHMENTS, _weaponAttachments, IDX_VIRT_MUZZLE_ATTACHMENTS],
            [_weaponAttachments get IDX_VIRT_BIPOD_ATTACHMENTS, _configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_BIPOD_ATTACHMENTS, _weaponAttachments, IDX_VIRT_BIPOD_ATTACHMENTS]
        ];

        // Add onto existing items, in case some items that were already added aren't available by default in the arsenal
        for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
            (_cargo get _index) merge [_configItems get _index, true];
            _cargo set [_index, _cargo get _index];
        };
    };
} else {
    // Make sure all items are in string form, then convert to config case (non-existent items return "")
    _items = (_items select {_x isEqualType ""}) apply {_x call EFUNC(common,getConfigName)};

    // Remove any invalid/non-existing items
    _items = _items - [""];

    private _configItems = uiNamespace getVariable QGVAR(configItems);
    private _configItemsFlat = uiNamespace getVariable QGVAR(configItemsFlat);

    // Convert all items to their baseWeapon
    _items = _items apply {if (_x in _configItemsFlat) then {_x} else {_x call FUNC(baseWeapon)}};

    // Remove any items not found by the arsenal
    _items = _items select {_x in _configItemsFlat};

    // https://community.bistudio.com/wiki/Arma_3:_Characters_And_Gear_Encoding_Guide#Character_configuration
    // https://github.com/acemod/ACE3/pull/9040#issuecomment-1597748331
    {
        switch (true) do {
            // Weapons
            case (_x in ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_PRIMARY_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_PRIMARY_WEAPONS) set [_x, nil];
            };
            case (_x in ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_HANDGUN_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_HANDGUN_WEAPONS) set [_x, nil];
            };
            case (_x in ((_configItems get IDX_VIRT_WEAPONS) get IDX_VIRT_SECONDARY_WEAPONS)): {
                ((_cargo get IDX_VIRT_WEAPONS) get IDX_VIRT_SECONDARY_WEAPONS) set [_x, nil];
            };

            // Weapon attachments
            case (_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) set [_x, nil];
            };
            case (_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) set [_x, nil];
            };
            case (_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) set [_x, nil];
            };
            case (_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS)): {
                ((_cargo get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) set [_x, nil];
            };

            // Other
            default {
                for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
                    if (_x in (_configItems get _index)) exitWith {
                        (_cargo get _index) set [_x, nil];
                    };
                };
            };
        };
    } forEach _items;
};

_object setVariable [QGVAR(virtualItems), _cargo, _global];

// If the arsenal is already open, refresh arsenal display
if (_global) then {
    [QGVAR(refresh), _object] call CBA_fnc_globalEvent;
} else {
    [QGVAR(refresh), _object] call CBA_fnc_localEvent;
};
