/*
 * Author: Glowbal
 *
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

{
    private ["_groupID","_color"];
    _groupID = (_x select 6) select 0;
    if (_groupID >= 0) then {
        _color = [_groupID] call FUNC(getGroupColor);
        (_x select 6) set [1, _color];
    };
} foreach GVAR(availableDevices);