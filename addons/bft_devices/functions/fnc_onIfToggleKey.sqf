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

private ["_handled","_previousInterface","_playerDevices","_vehicleDevices","_playerDeviceId","_vehicleDeviceId","_playerDeviceData","_vehicleDeviceData","_playerDeviceInterface","_vehicleDeviceInterface","_playerDeviceDisplayName","_playerDeviceDialogName","_vehicleDeviceDisplayName","_vehicleDeviceDialogName","_selectedInterface","_interfaceName","_deviceID","_isDialog","_interface","_interfaces"];

_handled = false;

// exit if we have already an interface starting up
if (GVAR(ifOpenStart)) exitWith {_handled};

_previousInterface = "";

// if UAV gunner view is open, exit the view
if (GVAR(uavViewActive)) then {
    objNull remoteControl (gunner GVAR(actUav));
    vehicle ACE_player switchCamera 'internal';
    GVAR(uavViewActive) = false;
    true
};

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
_vehicleDevices = [vehicle ACE_player] call EFUNC(bft,getOwnedDevices);

// select a device --- the first one for now
_playerDeviceId = if !(_playerDevices isEqualTo []) then {_playerDevices select 0} else {""};
_vehicleDeviceId = if !(_vehicleDevices isEqualTo []) then {_vehicleDevices select 0} else {""};

// bail if we could not retrieve a device ID
if (_playerDeviceId == "" && _vehicleDeviceId == "") exitWith {_handled};

// get device data
_playerDeviceData = if (_playerDeviceId != "") then {[_playerDeviceId] call EFUNC(bft,getDeviceData)} else {[]};
_vehicleDeviceData = if (_vehicleDeviceId != "") then {[_vehicleDeviceId] call EFUNC(bft,getDeviceData)} else {[]};

// bail if we could not receive device data
if (_playerDeviceData isEqualTo [] && _vehicleDeviceData isEqualTo []) exitWith {_handled};

// get interface for device
_playerDeviceInterface = if !(_playerDeviceData isEqualTo []) then {
    _interfaces = [_playerDeviceId,ACE_player] call EFUNC(bft,getInterfaces);
    // select the first device -- for now
    if (count _interfaces > 0) then {_interfaces select 0} else {""};
} else {""};
_vehicleDeviceInterface = if !(_vehicleDeviceData isEqualTo []) then {
    _interfaces = [_vehicleDeviceId,ACE_player] call EFUNC(bft,getInterfaces);
    // select the first device -- for now
    if (count _interfaces > 0) then {_interfaces select 0} else {""};
} else {""};

diag_log str [_playerDeviceInterface,_vehicleDeviceInterface];

// get uiNamespace variable names
_playerDeviceDisplayName = if (_playerDeviceInterface != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Interfaces" >> _playerDeviceInterface >> "displayName")) then {
        getText (configFile >> "ACE_BFT" >> "Interfaces" >> _playerDeviceInterface >> "displayName")
    } else {""};
} else {""};
_playerDeviceDialogName = if (_playerDeviceInterface != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Interfaces" >> _playerDeviceInterface >> "dialogName")) then {
        getText (configFile >> "ACE_BFT" >> "Interfaces" >> _playerDeviceInterface >> "dialogName")
    } else {""};
} else {""};
_vehicleDeviceDisplayName = if (_vehicleDeviceInterface != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Interfaces" >> _vehicleDeviceInterface >> "displayName")) then {
        getText (configFile >> "ACE_BFT" >> "Interfaces" >> _vehicleDeviceInterface >> "displayName")
    } else {""};
} else {""};
_vehicleDeviceDialogName = if (_vehicleDeviceInterface != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Interfaces" >> _vehicleDeviceInterface >> "dialogName")) then {
        getText (configFile >> "ACE_BFT" >> "Interfaces" >> _vehicleDeviceInterface >> "dialogName")
    } else {""};
} else {""};

diag_log str [_playerDeviceDisplayName,_playerDeviceDialogName,_vehicleDeviceDisplayName,_vehicleDeviceDialogName];

// logic to determine which interface to open
_selectedInterface = switch (_this) do {
    case 0: {
        // display first, vehicle device first
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceInterface,_playerDeviceDisplayName,_playerDeviceId,false]};
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceInterface,_playerDeviceDialogName,_playerDeviceId,true]};
        ["","","",false]
    };
    case 1: {
        // dialog first, vehicle device first
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceInterface,_playerDeviceDialogName,_playerDeviceId,true]};
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceInterface,_playerDeviceDisplayName,_playerDeviceId,false]};
        ["","","",false]
    };
    case 2: {
        // dialog first, player device first
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceInterface,_playerDeviceDialogName,_playerDeviceId,true]};
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceInterface,_playerDeviceDisplayName,_playerDeviceId,false]};
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceInterface,_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        ["","","",false]
    };
    default {["","","",false]};
};

_interface = _selectedInterface select 0;
_interfaceName = _selectedInterface select 1;
_deviceID = _selectedInterface select 2;
_isDialog = _selectedInterface select 3;

if (_interfaceName != "" && _interfaceName != _previousInterface) then {
    // queue the start up of the interface as we might still have one closing down
    [{
        if (I_CLOSED) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            ((_this select 0) + [ACE_player, vehicle ACE_player]) call FUNC(ifOpen);
        };
    },0,[_deviceID,_interface,_this,_interfaceName,_isDialog]] call CBA_fnc_addPerFrameHandler;
};

true