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

private [ "_deviceID", "_owner","_deviceClass", "_encryptionKeys", "_access", "_typeIconPath", "_sizeIconPath", "_callsign","_groupID", "_position", "_direction", "_refreshRate", "_viewModes", "_color"];
_deviceID = D_GET_ID(_this);
_owner = D_GET_OWNER(_this);
_deviceClass = D_GET_CLASSNAME(_this);
_refreshRate = D_GET_REFRESH_RATE_TX(_this);
_viewModes = D_GET_DEVICEMODES(_this);

_encryptionKeys = D_GET_ENCRYPTION(_this);
/*_access = true;
{
    if (_x in _encryptionKeys) exitwith {_access = true; };
}foreach GVAR(localOwnedEncyptionKeys);

if !(_access) exitwith {[]};*/

_typeIconPath = [D_GET_SIDE(_this), D_GET_TYPE(_this)] call FUNC(getTypeIcon);
_sizeIconPath = [D_GET_SIDE(_this), D_GET_SIZE(_this)] call FUNC(getSizeIcon);
_callsign = D_GET_CALLSIGN(_this);
_groupID = D_GET_GROUP_ID(_this);

_position = getPosASL vehicle _owner;
_direction = direction vehicle _owner;
_color = [_groupID] call FUNC(getGroupColor);

[_deviceID, _callsign, _typeIconPath, _sizeIconPath, _position, _encryptionKeys, [_groupID, _color], _deviceClass, time, _refreshRate, _owner, _viewModes, _direction];
