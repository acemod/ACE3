/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_groupID", "_data"];
_groupID = _this select 0;

_data = [_groupID] call FUNC(getGroupData);

_found = false;
_color = [1,1,1,1]; // device color for blufor units

while {!_found} do {
    if (_groupID < 0) exitwith {};
    {
        if (_x select 0 == _groupID) exitwith {
            _found = true;
            _color = _x select 1;
        };
    }foreach GVAR(colorFilters);

    if (!_found) then {
        _groupID = _data select 2;
        _data = [_groupID] call FUNC(getGroupData);
    };
};

_color;
