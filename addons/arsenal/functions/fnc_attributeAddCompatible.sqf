#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001, johnb43
 * Adds compatible attachments or magazines for all weapons in 3DEN attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_arsenal_fnc_attributeAddCompatible
 *
 * Public: No
 */

params ["_controlsGroup"];

private _category = lbCurSel (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY);

// Exit if selected category is not attachments or magazines
if !(_category in [IDX_CAT_OPTICS_ATTACHMENTS, IDX_CAT_FLASHLIGHT_ATTACHMENTS, IDX_CAT_MUZZLE_ATTACHMENTS, IDX_CAT_BIPOD_ATTACHMENTS, IDX_CAT_ITEMS_ALL]) exitWith {};

private _configItems = uiNamespace getVariable QGVAR(configItems);
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue params ["_attributeItems"];

// Get list of all weapons in attribute items
private _attributeWeapons = [];

{
    _attributeWeapons append (_attributeItems arrayIntersect (keys _y));
} forEach (_configItems get IDX_VIRT_WEAPONS);

private _itemsToAdd = createHashMap;

// Add compatible attachments or magazines to attribute
if (_category == IDX_CAT_ITEMS_ALL) then {
    // Add compatible attachments or magazines to attribute
    private _compatibleMagazines = createHashMap;

    // Get all compatible magazines for weapons
    {
        _compatibleMagazines insert [true, compatibleMagazines _x, []];
    } forEach _attributeWeapons;

    // Check if magazines are in configItems
    {
        if (_x in (_configItems get IDX_VIRT_ITEMS_ALL)) then {
            _itemsToAdd set [_x, nil];
        };
    } forEach (keys _compatibleMagazines);
} else {
    private _attachmentCategory = _category - 4;
    private _filter = ["optic", "pointer", "muzzle", "bipod"] select _attachmentCategory;
    private _compatibleItems = createHashMap;

    // CBA_fnc_compatibleItems returns config case sensitive names
    {
        _compatibleItems insert [true, [_x, _filter] call CBA_fnc_compatibleItems, []];
    } forEach _attributeWeapons;

    // Check if attachments are in configItems
    {
        if (
            _x in (_configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_OPTICS_ATTACHMENTS) ||
            {_x in (_configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)} ||
            {_x in (_configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_MUZZLE_ATTACHMENTS)} ||
            {_x in (_configItems get IDX_VIRT_ATTACHMENTS get IDX_VIRT_BIPOD_ATTACHMENTS)}
        ) then {
            _itemsToAdd set [_x, nil];
        };
    } forEach (keys _compatibleItems);
};

// Only take items that can be found by default in the arsenal
_attributeItems insert [-1, keys _itemsToAdd, true];
_attributeValue set [0, _attributeItems];

// Refresh the list for new items
[_controlsGroup] call FUNC(attributeAddItems);
