#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: group ID <STRING>
 * 1: data <ARRAY> ?
 * 2: ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_groupID"];

if (count _this < 3) exitwith {}; // What is the 3rd parameter?

private _found = false;
{
    if (_x select 0 == _groupID) exitwith {_found = true;};
} forEach GVAR(orbatElements);

if (!_found) then {
    [QGVAR(orbatElements), _this] call FUNC(syncedArrayPushback);
};
