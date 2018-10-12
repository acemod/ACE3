#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Handles changing the mode in 3DEN attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 * 1: Mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0] call ace_arsenal_fnc_attributeMode
 *
 * Public: No
 */

params ["_controlsGroup", "_mode"];
TRACE_1("Changing attribute mode",_mode);

// Store mode change
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue set [1, _mode];

// Change right list button and refresh list items with new mode
(_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST_RIGHT) ctrlSetText ([SYMBOL_ITEM_VIRTUAL, SYMBOL_ITEM_REMOVE] select _mode);
[_controlsGroup] call FUNC(attributeAddItems);
