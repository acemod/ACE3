#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Handles importing items list from clipboard into 3DEN's ace arsenal attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_arsenal_fnc_attributeImport
 *
 * Public: No
 */

private _importList = call compile copyFromClipboard;

// Verify import list is in correct format
if (isNil "_importList" || {!(_importList isEqualType [])} || {!(_importList isEqualTypeAll "")}) exitWith {
    playSound ["3DEN_notificationWarning", true];
};

params ["_controlsGroup"];

// Convert all items to config case
_importList = _importList apply {_x call EFUNC(common,getConfigName)};

// Remove any invalid/non-existing items
_importList = _importList - [""];

// Ensure imported items are in scanned config array
private _configItems = uiNamespace getVariable [QGVAR(configItems), []];
private _configItemsFlat = _configItems select [2, 16];
_configItemsFlat append (_configItems select IDX_VIRT_WEAPONS);
_configItemsFlat append (_configItems select IDX_VIRT_ATTACHMENTS);

private _filteredList = [];
private _intersection = [];

{
    // Find common entries
    _intersection = _x arrayIntersect _importList;

    _filteredList append _intersection;

    // Remove found entries, to reduce input array size
    _importList = _importList - _intersection;

    // Quit if nothing is left to import
    if (_importList isEqualTo []) exitWith {};
} forEach _configItemsFlat;

private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue set [0, _filteredList];

// Refresh the list for new items
[_controlsGroup] call FUNC(attributeAddItems);
