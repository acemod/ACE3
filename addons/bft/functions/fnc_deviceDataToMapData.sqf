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

private [ "_deviceID", "_sideInformation", "_assignableInformation", "_owner","_deviceClass", "_encryptionKeys", "_access", "_typeIconPath", "_sizeIconPath", "_callsign","_groupID", "_position", "_refreshRate", "_viewModes"];
_deviceID = _this select 0;
_sideInformation = _this select 1;
_assignableInformation = _this select 2;
_owner = _this select 5;
_deviceClass = _this select 6;
_refreshRate = _this select 8;
_viewModes = _this select 9;

_encryptionKeys = _sideInformation select 1;
/*_access = true;
{
    if (_x in _encryptionKeys) exitwith {_access = true; };
}foreach GVAR(localOwnedEncyptionKeys);

if !(_access) exitwith {[]};*/

_typeIconPath = [_sideInformation select 0, _assignableInformation select 0] call FUNC(getTypeIcon);
_sizeIconPath = [_sideInformation select 0, _assignableInformation select 1] call FUNC(getSizeIcon);
_callsign = _assignableInformation select 2;
_groupID = _assignableInformation select 3;

_position = getPosASL _owner;

[_deviceID, _deviceID, _typeIconPath, _sizeIconPath, _position, _encryptionKeys, _groupID, _deviceClass, time, _refreshRate, _owner, _viewModes];
