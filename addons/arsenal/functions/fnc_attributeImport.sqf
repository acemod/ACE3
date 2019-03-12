#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles importing items list from clipboard into 3DEN attribute.
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

params ["_controlsGroup"];

private _importList = call compile copyFromClipboard;

// Verify import list is in correct format
if (isNil "_importList" || {!(_importList isEqualType [])} || {!(_importList isEqualTypeAll "")}) exitWith {
    playSound ["3DEN_notificationWarning", true];
};

// Ensure imported items are in scanned config array and classname case is correct
private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
private _configItemsFlat = _configItems select [2, 16];
_configItemsFlat append (_configItems select 0);
_configItemsFlat append (_configItems select 1);

private _filteredList = [];

{
    private _item = _x;
    {
        private _index = _x findIf {_x == _item};
        if (_index > -1) then {
            _filteredList pushBackUnique (_x select _index);
        };
    } forEach _configItemsFlat;
} forEach _importList;

private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue set [0, _filteredList];

// Refresh the list for new items
[_controlsGroup] call FUNC(attributeAddItems);
