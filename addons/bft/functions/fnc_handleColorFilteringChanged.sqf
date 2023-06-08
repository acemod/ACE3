#include "script_component.hpp"
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


{
    private _groupID = (_x select 6) select 0;
    if (_groupID >= 0) then {
        private _color = [_groupID] call FUNC(getGroupColor);
        (_x select 6) set [1, _color];
    };
} foreach GVAR(availableDevices);
