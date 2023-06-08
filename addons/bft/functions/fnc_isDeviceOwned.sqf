#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: device ID <STRING>
 *
 * Return Value:
 * owned? <BOOLEAN>
 *
 * Public: No
 */


params ["_unit", "_deviceID"];

private _ownedIDs = _unit getvariable [QGVAR(ownedDevices), []];

_deviceID in _ownedIDs
