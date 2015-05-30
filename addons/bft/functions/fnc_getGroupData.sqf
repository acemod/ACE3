/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: group ID <STRING>
 *
 * Return Value:
 * orbat element data <ARRAY>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_groupID);

private ["_data"];
_data = [_groupID, "", -1/*parent group ID*/];
{
    if (_x select 0 == _groupID) exitWith {
        _data = _x;
    };
} forEach GVAR(orbatElements);

_data
