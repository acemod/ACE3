#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Checks if unit has entrenching tool.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has entrenching tool <BOOL>
 *
 * Example:
 * [bob] call ace_trenches_fnc_hasEntrenchingTool
 *
 * Public: Yes
*/

params [
    ["_unit", objNull, [objNull]]
];

private _uniqueItems = +(_unit call EFUNC(common,uniqueItems));
_uniqueItems append weapons _unit;
_uniqueItems pushBack backpack _unit;

GVAR(entrenchingTools) findAny _uniqueItems != -1 // return
