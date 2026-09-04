#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Diffs two classname -> count HashMaps (as returned by FUNC(getLoadoutItemCounts))
 * and fires QGVAR(itemsChanged) with what actually changed, if anything did.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Panel the change originated from (an IDC_button* constant) <NUMBER>
 * 2: Item counts before the change, classname -> count <HASHMAP>
 * 3: Item counts after the change, classname -> count <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params [
    ["_display", displayNull, [displayNull]],
    ["_panel", -1, [0]],
    ["_oldCounts", createHashMap, [createHashMap]],
    ["_newCounts", createHashMap, [createHashMap]]
];

private _added = +_newCounts;
{
    private _remaining = (_added getOrDefault [_x, 0]) - _y;
    if (_remaining > 0) then {_added set [_x, _remaining]} else {_added deleteAt _x};
} forEach _oldCounts;

private _removed = +_oldCounts;
{
    private _remaining = (_removed getOrDefault [_x, 0]) - _y;
    if (_remaining > 0) then {_removed set [_x, _remaining]} else {_removed deleteAt _x};
} forEach _newCounts;

if (count _added == 0 && {count _removed == 0}) exitWith {};

// QGVAR(itemsChanged): [_display, _panel, _newItem (gained), _oldItem (lost)]
[QGVAR(itemsChanged), [_display, _panel, _added, _removed]] call CBA_fnc_localEvent;
