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

private ["_owner", "_item", "_magazine", "_magID", "_deviceSide", "_deviceEncryptionKeys", "_assignableInformation", "_app", "_deviceInformation"];
_owner = _this select 0;
_item = _this select 1;
_magazine = _this select 2;
_magID = _this select 3;

/*
    Device ID
    Side ID/encyrption ID
    time logged in
    opened app ID
    app data [map position, map zoom level, ..]
    element type
    element size
    element callsign
    currentOwner
    ORBAT element ID
*/
systemChat format["handleItemCreated: %1", _this];
diag_log format["handleItemCreated: %1", _this];

_deviceSide = getText (configFile >> "CfgWeapons" >> _item >> QGVAR(deviceSide));
_deviceEncryptionKeys = []; // TODO encyption keys

// format: [elementType, elementSize, elementCallsign, orbatElementID]
_assignableInformation = _owner getvariable [format[QGVAR(assignableInformation_%1),_item], ["elementType", 0, "elementCallsign", 0]];

// format: app ID, app data
_app = [-1, []];

// format: device ID, deviceSide [side, encryptionKeys], deviceInformation [elementType, elementSize, callsign, orbatID], appInformation [appID, appData], timeLoggedIn, owner]
_deviceInformation = [_magID, [_deviceSide, _deviceEncryptionKeys], _assignableInformation, _app, -1, _owner, _item];

["bft_addDeviceData", _deviceInformation] call EFUNC(common,globalEvent);
