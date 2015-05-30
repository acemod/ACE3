/*
 * Author: Gundy
 *
 * Description:
 *   Called whenever a interface toggle (open/close) key is pressed. Based on situation will open or close the interface for a BFT device
 *
 * Arguments:
 *   0: 0 = Primary, 1 = Secondary, 3 = Tertiary <INTEGER>
 *
 * Return Value:
 *   Handled <BOOL>
 *
 * Example:
 *   0 call ace_bft_devices_fnc_onIfToggleKey;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_className", "_deviceData", "_deviceID", "_dialogName", "_displayName", "_handled", "_interfaceName", "_playerDevices", "_previousInterface", "_vehicleDevices"];

_handled = false;

// exit if we have already an interface starting up
if (GVAR(ifOpenStart)) exitWith {_handled};

_previousInterface = "";

// close interface and exit if there is an interface open of the same type
if (!I_CLOSED && {I_GET_TYPE == _this}) exitWith {
    [] call FUNC(ifClose);
    true
};

// close interface if there is one open
if !(I_CLOSED) then {
    _previousInterface = I_GET_NAME;
    [] call FUNC(ifClose);
    _handled = true;
};

// see if player is carrying any devices
_playerDevices = [ACE_player] call EFUNC(bft,getOwnedDevices);

// get devices for the vehicle the player might be in
_vehicleDevices =
    if (ACE_player != vehicle ACE_player) then {
        [vehicle ACE_player] call EFUNC(bft,getOwnedDevices);
    } else {
        [];
    };

// select a device --- the first one for now
_deviceId = if !(_playerDevices isEqualTo []) then {_playerDevices select 0} else {""};

// bail if we could not retrieve a device ID
if (_deviceId == "") exitWith {_handled};

// get device data
_deviceData = [_deviceId] call EFUNC(bft,getDeviceData);

// bail if we could not receive device data
if (_deviceData isEqualTo []) exitWith {_handled};

// get class name for device
_className = D_GET_CLASSNAME(_deviceData);

// get uiNamespace variable names
_displayName = getText (configFile >> "CfgWeapons" >> _className >> QGVAR(displayName));
_dialogName = getText (configFile >> "CfgWeapons" >> _className >> QGVAR(dialogName));

// logic to determine which interface to open
_interfaceName = switch (_this) do {
    case 0: {
        if (_displayName != "") then {_displayName} else {_dialogName};
    };
    case 1: {
        if (_dialogName != "") then {_dialogName} else {_displayName};
    };
    default {QGVAR(JV5_dlg)}; // ToDo: make dynamic
};

if (_interfaceName != "" && _interfaceName != _previousInterface) then {
    // queue the start up of the interface as we might still have one closing down
    [{
        if (I_CLOSED) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            ((_this select 0) + [ACE_player, vehicle ACE_player]) call FUNC(ifOpen);
        };
    },0,[_deviceID,_this,_interfaceName]] call CBA_fnc_addPerFrameHandler;
};

true