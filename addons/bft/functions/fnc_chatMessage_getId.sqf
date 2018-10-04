/*
 * Author: Glowbal
 * Get Chat messages Id
 *
 * Arguments:
 * 0: Device Id One <STRING>
 * 1: Device Id two <STRING>
 *
 * Return Value:
 * Id representing the chatMessages list <STRING>
 *
 * Example:
 * ["myDeviceId", "myOtherDeviceId"] call ace_bft_fnc_chatMessages_getId
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_deviceId", "_otherDeviceId"];

private _id = QGVAR(chatMessages);
private _deviceIds = [_deviceId, _otherDeviceId];
_deviceIds sort true;

{
    _id = _id + _x;
} forEach _deviceIds;

_id;
