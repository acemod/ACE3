#include "script_component.hpp"
/*
 * Author: Freddo
 * Checks whether a unit is able to timestamp.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Whether unit is able to timestamp <BOOL>
 *
 * Example:
 * [ACE_Player] call ace_markers_fnc_canTimestamp
 *
 * Public: No
 */

params [["_unit", ACE_player]];

private _assignedItems = assignedItems _unit;

private _index = _assignedItems findIf {
    ([_x] call EFUNC(common,getItemType)) isEqualTo ["item", "watch"]
};

_index != -1
