#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: LinkIsGrim
 * Flattens GVAR(center)'s current loadout into a classname -> count HashMap - every
 * weapon, attachment, magazine, worn container's contents, and assigned/linked item.
 * Used by FUNC(fireItemsChangedEvent) to diff the arsenal's state before and after
 * a change.
 *
 * Deliberately does not include cosmetic-only slots (face, voice, insignia) - they
 * don't pull from the virtual item pool the way everything else here does.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Classname -> count <HASHMAP>
 *
 * Example:
 * call FUNC(getLoadoutItemCounts)
 *
 * Public: No
*/

private _counts = createHashMap;

private _fnc_add = {
    params [["_class", "", [""]], ["_amount", 1, [0]]];
    if (_class == "" || {_amount == 0}) exitWith {};
    _counts set [_class, (_counts getOrDefault [_class, 0]) + _amount];
};

// Weapon-format slot: [type, muzzle, pointer, optic, [primary mag, ammo],
// [secondary mag, ammo], bipod] - shared by primary/secondary/handgun/binocular.
private _fnc_addWeaponSlot = {
    params [["_slot", [], [[]]]];
    _slot params [
        ["_weapon", "", [""]], ["_muzzle", "", [""]], ["_pointer", "", [""]],
        ["_optic", "", [""]], ["_primaryMag", [], [[]]], ["_secondaryMag", [], [[]]],
        ["_bipod", "", [""]]
    ];
    [_weapon] call _fnc_add;
    [_muzzle] call _fnc_add;
    [_pointer] call _fnc_add;
    [_optic] call _fnc_add;
    [_primaryMag param [0, ""]] call _fnc_add;
    [_secondaryMag param [0, ""]] call _fnc_add;
    [_bipod] call _fnc_add;
};

// Uniform/vest/backpack slots: [type, [[item, count], [item, count], ...]]
private _fnc_addContainerSlot = {
    params [["_slot", [], [[]]]];
    _slot params [["_container", "", [""]], ["_items", [], [[]]]];
    [_container] call _fnc_add;
    {
        _x params [["_itemClass", "", [""]], ["_itemAmount", 1, [0]]];
        [_itemClass, _itemAmount] call _fnc_add;
    } forEach _items;
};

private _loadout = getUnitLoadout GVAR(center);

[_loadout select IDX_LOADOUT_PRIMARY_WEAPON] call _fnc_addWeaponSlot;
[_loadout select IDX_LOADOUT_SECONDARY_WEAPON] call _fnc_addWeaponSlot;
[_loadout select IDX_LOADOUT_HANDGUN_WEAPON] call _fnc_addWeaponSlot;
[_loadout select IDX_LOADOUT_BINO] call _fnc_addWeaponSlot;
[_loadout select IDX_LOADOUT_UNIFORM] call _fnc_addContainerSlot;
[_loadout select IDX_LOADOUT_VEST] call _fnc_addContainerSlot;
[_loadout select IDX_LOADOUT_BACKPACK] call _fnc_addContainerSlot;
[_loadout select IDX_LOADOUT_HEADGEAR] call _fnc_add;
[_loadout select IDX_LOADOUT_GOGGLES] call _fnc_add;

{
    [_x] call _fnc_add;
} forEach (_loadout select IDX_LOADOUT_ASSIGNEDITEMS);

_counts
