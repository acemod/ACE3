/*
 * Author: Glowbal
 * Get All Chat messages sent between two devices
 *
 * Arguments:
 * 0: Device Id One <STRING>
 * 1: Device Id two <STRING>
 *
 * Return Value:
 * List of chat messages ordered by time sent <ARRAY>
 * format: [[timestamp, message, sender], ..]
 *
 * Example:
 * ["myDeviceId", "myOtherDeviceId"] call ace_bft_fnc_chatMessages_get
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_deviceId", "_otherDeviceId"];

// Check if both are valid device Ids
private _deviceDataOne = [_deviceId] call FUNC(getDeviceData);
private _deviceDataTwo = [_otherDeviceId] call FUNC(getDeviceData);

if (_deviceDataOne isEqualTo [] || {_deviceDataTwo isEqualTo []}) exitwith {[]}; // neither are valid devices

private _messagesId = [_deviceId, _otherDeviceId] call FUNC(chatMessage_getId);

(missionNamespace getVariable [_messagesId, []]);
