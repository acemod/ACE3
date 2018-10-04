#include "script_component.hpp"
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


params ["_deviceId", "_otherDeviceId", "_message"];

private _messagesListKey = [_deviceId, _otherDeviceId] call FUNC(chatMessage_getId);

private _timeStamp = format["00:00"];
private _messageId = [] call FUNC(generateEncryptionKey); // some random key TODO improve or implement some unique Id generator
private _constructedMessage = [_messageId, _timestamp, _message, _deviceId];

[_messagesListKey, _constructedMessage] call FUNC(syncedArrayPushback);
