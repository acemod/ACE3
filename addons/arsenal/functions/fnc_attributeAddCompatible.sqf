#include "script_component.hpp"
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

private _configItems = uiNamespace getVariable [QGVAR(configItems), []];
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue params ["_attributeItems"];

// Get list of all weapons in attribute items
private _attributeWeapons = _attributeItems arrayIntersect (flatten (_configItems select IDX_VIRT_WEAPONS));

// Add compatible attachments or magazines to attribute
private _itemsToAdd = [];

if (_category == IDX_CAT_ITEMS_ALL) then {
    // Get all compatible magazines for weapons
    {
        _itemsToAdd append (compatibleMagazines _x);
    } forEach _attributeWeapons;

    _itemsToAdd = _itemsToAdd arrayIntersect (_configItems select IDX_VIRT_ITEMS_ALL);
} else {
    private _attachmentCategory = _category - 4;
    private _filter = ["optic", "pointer", "muzzle", "bipod"] select _attachmentCategory;

    // CBA_fnc_compatibleItems returns config case sensitive names
    {
        _itemsToAdd append ([_x, _filter] call CBA_fnc_compatibleItems);
    } forEach _attributeWeapons;

    _itemsToAdd = _itemsToAdd arrayIntersect (flatten (_configItems select IDX_VIRT_ATTACHMENTS));
};

// Only take items that can be found by default in the arsenal
_attributeItems append _itemsToAdd;
_attributeValue set [0, _attributeItems arrayIntersect _attributeItems];

// Refresh the list for new items
[_controlsGroup] call FUNC(attributeAddItems);
