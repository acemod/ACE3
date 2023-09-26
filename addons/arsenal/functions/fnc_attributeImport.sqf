#include "..\script_component.hpp"
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
private _configItemsFlat = uiNamespace getVariable QGVAR(configItemsFlat);
private _filteredList = _importList select {_x in _configItemsFlat};

private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue set [0, _filteredList];

// Refresh the list for new items
[_controlsGroup] call FUNC(attributeAddItems);
