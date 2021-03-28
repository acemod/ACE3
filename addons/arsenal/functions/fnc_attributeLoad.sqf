#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Initializes the 3DEN attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 * 1: Attribute value <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, [[], 0]] call ace_arsenal_fnc_attributeLoad
 *
 * Public: No
 */

params ["_controlsGroup", "_value"];
TRACE_1("Initializing 3DEN attribute",_value);

// Store working attribute value
uiNamespace setVariable [QGVAR(attributeValue), _value];

// Add keyDown EH to display
// Does not work properly when added to controls group
private _display = ctrlParent _controlsGroup;
_display displayAddEventHandler ["KeyDown", {call FUNC(attributeKeyDown)}];

// Handle selected mode
if (_value select 1 > 0) then {
    (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_MODE) lbSetCurSel 1;
    (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST_RIGHT) ctrlSetText SYMBOL_ITEM_REMOVE;
};

// Trigger category selection for last selected category to populate list
private _category = uiNamespace getVariable [QGVAR(attributeCategory), 0];
(_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY) lbSetCurSel _category;

[_controlsGroup, _category] call FUNC(attributeCategory);
