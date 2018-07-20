#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles double clicking a row in 3DEN attribute listbox.
 *
 * Arguments:
 * 0: Listbox <CONTROL>
 * 1: Row index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0] call ace_arsenal_fnc_attributeDblClick
 *
 * Public: No
 */

params ["_listbox", "_currentRow"];
TRACE_1("Double click toggle",_currentRow);

// Get toggle mode (add or remove item)
private _itemClassname = _listbox lnbData [_currentRow, 1];
private _addItem = !(_itemClassname in ((uiNamespace getVariable [QGVAR(attributeValue), [[], 0]]) select 0));

[ctrlParentControlsGroup _listbox, _addItem] call FUNC(attributeSelect);
