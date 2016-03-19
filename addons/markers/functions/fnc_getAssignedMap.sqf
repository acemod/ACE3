/*
 * Author: SzwedzikPL
 * Return assigned map class
 *
 * Arguments:
 * 0: Unit that will be checked (default: false)
 *
 * Return Value:
 * Enabled Channels <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _map = "";
private _assignedMaps = (assignedItems _unit) select {_x call FUNC(isMap)};
if (count _assignedMaps > 0) then {
    _map = _assignedMaps select 0;
};

_map
