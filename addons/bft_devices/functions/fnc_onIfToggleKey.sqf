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

private ["_handled","_previousInterface","_playerDevices","_vehicleDevices","_playerDeviceId","_vehicleDeviceId","_playerDeviceData","_vehicleDeviceData","_playerDeviceClassName","_vehicleDeviceClassName","_playerDeviceDisplayName","_playerDeviceDialogName","_vehicleDeviceDisplayName","_vehicleDeviceDialogName","_selectedInterface","_interfaceName","_deviceID","_isDialog"];

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

// get class name for device
_playerDeviceClassName = if !(_playerDeviceData isEqualTo []) then {D_GET_DEVICETYPE(_playerDeviceData)} else {""};
_vehicleDeviceClassName = if !(_vehicleDeviceData isEqualTo []) then {D_GET_DEVICETYPE(_vehicleDeviceData)} else {""};

// get uiNamespace variable names
_playerDeviceDisplayName = if (_playerDeviceClassName != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Devices" >> _playerDeviceClassName >> QGVAR(displayName))) then {
        getText (configFile >> "ACE_BFT" >> "Devices" >> _playerDeviceClassName >> QGVAR(displayName))
    } else {""};
} else {""};
_playerDeviceDialogName = if (_playerDeviceClassName != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Devices" >> _playerDeviceClassName >> QGVAR(dialogName))) then {
        getText (configFile >> "ACE_BFT" >> "Devices" >> _playerDeviceClassName >> QGVAR(dialogName))
    } else {""};
} else {""};
_vehicleDeviceDisplayName = if (_vehicleDeviceClassName != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Devices" >> _vehicleDeviceClassName >> QGVAR(displayName))) then {
        getText (configFile >> "ACE_BFT" >> "Devices" >> _vehicleDeviceClassName >> QGVAR(displayName))
    } else {""};
} else {""};
_vehicleDeviceDialogName = if (_vehicleDeviceClassName != "") then {
    if (isText (configFile >> "ACE_BFT" >> "Devices" >> _vehicleDeviceClassName >> QGVAR(dialogName))) then {
        getText (configFile >> "ACE_BFT" >> "Devices" >> _vehicleDeviceClassName >> QGVAR(dialogName))
    } else {""};
} else {""};

// logic to determine which interface to open
_selectedInterface = switch (_this) do {
    case 0: {
        // display first, vehicle device first
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceDisplayName,_playerDeviceId,false]};
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceDialogName,_playerDeviceId,true]};
        []
    };
    case 1: {
        // dialog first, vehicle device first
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceDialogName,_playerDeviceId,true]};
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceDisplayName,_playerDeviceId,false]};
        []
    };
    case 2: {
        // dialog first, player device first
        if (_playerDeviceDialogName != "") exitWith {[_playerDeviceDialogName,_playerDeviceId,true]};
        if (_vehicleDeviceDialogName != "") exitWith {[_vehicleDeviceDialogName,_vehicleDeviceId,true]};
        if (_playerDeviceDisplayName != "") exitWith {[_playerDeviceDisplayName,_playerDeviceId,false]};
        if (_vehicleDeviceDisplayName != "") exitWith {[_vehicleDeviceDisplayName,_vehicleDeviceId,false]};
        []
    };
    default {[]};
};

_interfaceName = _selectedInterface select 0;
_deviceID = _selectedInterface select 1;
_isDialog = _selectedInterface select 2;

if (_interfaceName != "" && _interfaceName != _previousInterface) then {
    // queue the start up of the interface as we might still have one closing down
    [{
        if (I_CLOSED) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            ((_this select 0) + [ACE_player, vehicle ACE_player]) call FUNC(ifOpen);
        };
    },0,[_deviceID,_this,_interfaceName,_isDialog]] call CBA_fnc_addPerFrameHandler;
};

true