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

private ["_owner", "_item", "_magazine", "_magID", "_deviceType", "_deviceSide", "_refreshRate", "_deviceEncryptionKeys", "_assignableInformation", "_app", "_deviceInformation", "_exists"];
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

_exists = false;
{
    if (_magID == (_x select 0)) exitwith {_exists = true};
}foreach GVAR(deviceData);
if (_exists) exitwith {};

_deviceType = if (_magazine != "") then { getText(configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType)) } else { _item };
_deviceSide = getText(configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "deviceSide");
_refreshRate = getNumber(configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "refreshRate");

// if (_deviceSide == "") exitwith {};
_deviceEncryptionKeys = ["DEFAULT_SIDE_ENCYPTION"]; // TODO encyption keys

// format: [elementType, elementSize, elementCallsign, orbatElementID]
_assignableInformation = _owner getvariable [format[QGVAR(assignableInformation_%1),_item], ["elementType", 0, "elementCallsign", 0]];

// format: app ID, app data
_app = [-1, []];

// format: device ID, deviceSide [side, encryptionKeys], deviceInformation [elementType, elementSize, callsign, orbatID], appInformation [appID, appData], timeLoggedIn, owner, item, deviceType]
_deviceInformation = [_magID, [_deviceSide, _deviceEncryptionKeys], _assignableInformation, _app, -1, _owner, _item, _deviceType, _refreshRate];

["bft_addDeviceData", _deviceInformation] call EFUNC(common,globalEvent);
