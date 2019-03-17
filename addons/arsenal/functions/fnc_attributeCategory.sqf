#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Handles changing the category in 3DEN attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 * 1: Category <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0] call ace_arsenal_fnc_attributeCategory
 *
 * Public: No
 */

params ["_controlsGroup", "_category"];

// Store selected category
uiNamespace setVariable [QGVAR(attributeCategory), _category];

// Show add compatible items button when category is attachments or magazines
private _compatibleButton = _controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_ADD_COMPATIBLE;
private _enable = _category in [4, 5, 6, 7, 8];
_compatibleButton ctrlEnable _enable;
_compatibleButton ctrlShow _enable;

// Refresh the list for selected category
[_controlsGroup] call FUNC(attributeAddItems);
