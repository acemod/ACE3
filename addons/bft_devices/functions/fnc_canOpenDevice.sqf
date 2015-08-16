/*
 * Author: Glowbal
 * Check if a device can be opened
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: Device Type <STRING>
 *
 * Return Value:
 * Can open device of type <BOOL>
 *
 * Example:
 * [ACE_player, "myDeviceType"] call ace_bft_devices_fnc_canOpenDevice
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_ownedDevices", "_return", "_deviceData"];
params ["_player", "_target", "_targetDeviceType"];

if (GVAR(ifOpenStart) || {GVAR(uavViewActive)} || {!I_CLOSED}) exitWith {false};
// if (_player != _target && {_target isKindOf "CAManBase"}) exitwith {false};

_ownedDevices = [_target] call EFUNC(bft,getOwnedDevices);

if (count _ownedDevices == 0) exitwith {false};

_return = false;
{
    _deviceData = [_x] call EFUNC(bft,getDeviceData);
    if (toLower D_GET_DEVICETYPE(_deviceData) isEqualTo toLower _targetDeviceType) exitwith {_return = true;};
} forEach _ownedDevices;
/*
if (!_return) then {
    _vehicle = _target;
    if (_vehicle != _unit) then {
        _ownedDevices = [_vehicle] call EFUNC(bft,getOwnedDevices);
        if (count _ownedDevices == 0) exitwith {};
        {
            _deviceData = [_playerDeviceId] call EFUNC(bft,getDeviceData);
            if (D_GET_DEVICETYPE(_deviceData) isEqualTo _targetDeviceType) exitwith {_return = true;};
        } forEach _ownedDevices;
    };
};*/
_return;
