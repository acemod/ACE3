/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: owner <OBJECT>
 * 1: item <STRING>
 * 2: magazine <STRING
 * 3: magazine ID <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_4(_owner,_item,_magazine,_magID);

private ["_deviceType", "_deviceSide", "_refreshRate", "_deviceEncryptionKeys", "_assignableInformation", "_app", "_deviceInformation", "_exists", "_deviceModes", "_defaultValues", "_elementCallsign", "_elementSize", "_elementType", "_groupID"];

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
} forEach GVAR(deviceData);
if (_exists) exitwith {};

_deviceType = if (_magazine != "") then { getText(configFile >> "CfgWeapons" >> _item >> QGVAR(deviceType)) } else { _item };
_deviceSide = getText(configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "deviceSide");
_deviceModes = getArray(configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "reportingModes");

_defaultValues = [];
// if this is a vehicle device, see if the default information is present on the vehicle
if !(isNull _owner || {_owner isKindOf "ParachuteBase" || _owner isKindOf "CAManBase"}) then {
    if (isArray (configFile >> "CfgVehicles" >> typeOf _owner >> QGVAR(defaultInformation))) then {
        _defaultValues = getArray (configFile >> "CfgVehicles" >> typeOf _owner >> QGVAR(defaultInformation));
    };
};
// otherwise, get the default information from the device
if (_defaultValues isEqualTo []) then {
    _defaultValues = getArray (configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "defaultInformation");
};

_refreshRate = getArray(configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "refreshRate");

_deviceEncryptionKeys = [_deviceSide] call FUNC(getEncryptionKey); // getting the default encryption keys for this side

_elementType = _owner getvariable format[QGVAR(elementType_%1),_item];
_elementSize = _owner getvariable format[QGVAR(elementSize_%1),_item];
_elementCallsign = _owner getvariable format[QGVAR(elementCallsign_%1),_item];
_groupID = _owner getvariable format[QGVAR(groupID_%1),_item];


// format: [elementType, elementSize, elementCallsign, orbatElementID]
_assignableInformation = _owner getvariable [format[QGVAR(assignableInformation_%1),_item], _defaultValues];

if (!isnil "_elementType") then {
    _assignableInformation set [0, _elementType];
};
if (!isnil "_elementSize") then {
    _assignableInformation set [1, _elementSize];
};
if (!isnil "_elementCallsign") then {
    _assignableInformation set [2, _elementCallsign];
};

if (!isnil "_groupID") then {
    _assignableInformation set [3, _groupID];
};

// format: app ID, app data
_app = [-1, []];

// format: device ID, deviceSide [side, encryptionKeys], deviceInformation [elementType, elementSize, callsign, orbatID], appInformation [appID, appData], timeLoggedIn, owner, item, deviceType, _refreshRate [TX, RX], _deviceModes]
_deviceInformation = [_magID, [_deviceSide, _deviceEncryptionKeys], _assignableInformation, _app, -1, _owner, _item, _deviceType, _refreshRate, _deviceModes];

["bft_addDeviceData", _deviceInformation] call EFUNC(common,globalEvent);
