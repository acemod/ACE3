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

private ["_owner", "_deviceID"];
_unit = _this select 0;
_deviceID = _this select 1;

_ownedIDs = _unit getvariable [QGVAR(ownedDevices), []];
_deviceID in _ownedIDs;
