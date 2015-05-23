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


if (count _this < 3) exitwith {};

private ["_groupID", "_data"];
_groupID = _this select 0;

_found = false;
{
    if (_x select 0 == _groupID) exitwith {_found = true;};
}foreach GVAR(orbatElements);

if (!_found) then {
    [QGVAR(orbatElements), _this] call FUNC(syncedArrayPushback);
};
