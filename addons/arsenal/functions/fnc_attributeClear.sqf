#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Clears all items from current category in 3DEN attribute.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_arsenal_fnc_attributeClear
 *
 * Public: No
 */

params ["_controlsGroup"];

private _category = lbCurSel (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY) - 1;
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
TRACE_1("Handling clear button",_category);

// Remove all if no specific category
if (_category == -1) then {
    _attributeValue set [0, []];
} else {
    // Find category items and remove from list
    private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
    private _categoryItems = switch (true) do {
        case (_category < 3): {
            _configItems select 0 select _category;
        };
        case (_category < 7): {
            _configItems select 1 select (_category - 3);
        };
        default {
            _configItems select (_category - 5);
        };
    };
    _attributeValue set [0, (_attributeValue select 0) - _categoryItems];
};

// Refresh the list after clear
[_controlsGroup] call FUNC(attributeAddItems);
