#include "script_component.hpp"
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


params ["_groupID"];

private _data = [_groupID, "", -1/*parent group ID*/];
{
    if (_x select 0 == _groupID) exitWith {
        _data = _x;
    };
} forEach GVAR(orbatElements);

_data
