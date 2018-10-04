#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: owner <OBJECT>
 *
 * Return Value:
 * device IDs <ARRAY>
 *
 * Public: No
 */


params ["_owner"];

// Or use OBJECT getvariable [QGVAR(ownedDevices), []]; ?
private _ids = [];

{
    if ((_x select 5) == _owner) then {
        _ids pushback (_x select 0);
    };
} forEach GVAR(deviceData);

_ids
