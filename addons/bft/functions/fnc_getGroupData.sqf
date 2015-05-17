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

_data = [_groupID, "", -1/*parent group ID*/];
{
    if (_x select 0 == _groupID) exitwith {
        _data = _x;
    };
}foreach GVAR(orbatElements);

_data;
