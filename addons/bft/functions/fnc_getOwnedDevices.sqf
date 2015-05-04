/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

// Or use OBJECT getvariable [QGVAR(ownedDevices), []]; ?
private ["_owner", "_ids"];
_owner = _this select 0;
_ids = [];
{
    if ((_x select 5) == _owner) then {
        _ids pushback (_X select 0);
    };
}foreach GVAR(devices);

_ids;
