#include "script_component.hpp"
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


private _deviceID = D_GET_ID(_this);
private _owner = D_GET_OWNER(_this);
private _deviceClass = D_GET_CLASSNAME(_this);
private _refreshRate = D_GET_REFRESH_RATE_TX(_this);
private _viewModes = D_GET_DEVICEMODES(_this);

private _encryptionKeys = D_GET_ENCRYPTION(_this);
private _state = D_GET_DEVICE_STATE(_this);
/*_access = true;
{
    if (_x in _encryptionKeys) exitwith {_access = true; };
}foreach GVAR(localOwnedEncyptionKeys);

if !(_access) exitwith {[]};*/

private _typeIconPath = [D_GET_SIDE(_this), D_GET_TYPE(_this)] call FUNC(getTypeIcon);
private _sizeIconPath = [D_GET_SIDE(_this), D_GET_SIZE(_this)] call FUNC(getSizeIcon);
private _callsign = D_GET_CALLSIGN(_this);
private _groupID = D_GET_GROUP_ID(_this);

private _position = getPosASL vehicle _owner;
private _direction = direction vehicle _owner;
private _color = [_groupID] call FUNC(getGroupColor);

if (_callsign == "" && {_owner isKindOf "CAManBase"}) then {
    _callsign = groupId group _owner;
};

[_deviceID, _callsign, _typeIconPath, _sizeIconPath, _position, _encryptionKeys, [_groupID, _color], _deviceClass, time, _refreshRate, _owner, _viewModes, _direction, _state];
