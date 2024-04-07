#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Clears all items from current category in 3DEN's ace arsenal attribute.
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

private _category = lbCurSel (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY);
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
TRACE_1("Handling clear button",_category);

// Remove all if no specific category
if (_category == IDX_CAT_ALL) then {
    _attributeValue set [0, []];
} else {
    // Find category items and remove from list
    private _configItems = uiNamespace getVariable QGVAR(configItems);
    private _categoryItems = switch (true) do {
        // Weapons
        case (_category < IDX_CAT_OPTICS_ATTACHMENTS): {
            (_configItems get IDX_VIRT_WEAPONS) get (_category - 1)
        };
        // Weapon attachments
        case (_category < IDX_CAT_ITEMS_ALL): {
            (_configItems get IDX_VIRT_ATTACHMENTS) get (_category - 4)
        };
        // Other
        default {
            _configItems get (_category - 6)
        };
    };

    _attributeValue set [0, (_attributeValue select 0) select {!(_x in _categoryItems)}];
};

// Refresh the list after clear
[_controlsGroup] call FUNC(attributeAddItems);
