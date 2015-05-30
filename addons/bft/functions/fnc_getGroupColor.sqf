/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: group ID <STRING>
 *
 * Return Value:
 * color <ARRAY>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_groupID);

private ["_data", "_found", "_color"];
_data = [_groupID] call FUNC(getGroupData);
_found = false;
_color = GVAR(colorWest);

while {!_found} do {
    if (_groupID < 0) exitWith {};
    {
        if (_x select 0 == _groupID) exitWith {
            _found = true;
            _color = _x select 1;
        };
    } forEach GVAR(colorFilters);

    if (!_found) then {
        _groupID = _data select 2;
        _data = [_groupID] call FUNC(getGroupData);
    };
};

_color
