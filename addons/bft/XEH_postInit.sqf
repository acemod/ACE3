#include "script_component.hpp"

["bft_itemCreated", FUNC(handleItemCreated)] call EFUNC(common,addEventHandler);
["bft_addDeviceData", FUNC(handleAddDeviceData)] call EFUNC(common,addEventHandler);
["bft_updateDeviceOwner", FUNC(handleUpdateDeviceOwner)] call EFUNC(common,addEventHandler);
["bft_updateDeviceGroup", FUNC(handleUpdateDeviceGroup)] call EFUNC(common,addEventHandler);
["bft_updateDeviceElementType", FUNC(handleUpdateDeviceElementType)] call EFUNC(common,addEventHandler);
["bft_updateDeviceCallsign", FUNC(handleUpdateDeviceCallsign)] call EFUNC(common,addEventHandler);
["bft_updateDeviceKeys", FUNC(handleUpdateDeviceKeys)] call EFUNC(common,addEventHandler);
["bft_updateDeviceAppData", FUNC(handleUpdateDeviceAppData)] call EFUNC(common,addEventHandler);

["bft_syncedArrayDelete", FUNC(handleSyncedArrayDelete)] call EFUNC(common,addEventHandler);
["bft_syncedArrayPushback", FUNC(handleSyncedArrayPushback)] call EFUNC(common,addEventHandler);
["bft_syncedArrayUpdate", FUNC(handleSyncedArrayUpdate)] call EFUNC(common,addEventHandler);

["playerInventoryChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);
["playerChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);

if(!isServer) then {
    ["PlayerJip", {
        diag_log text format["[ACE] * JIP BFT Data synchronization initialized"];
        ["bft_requestAllData", [player]] call EFUNC(common,serverEvent);
    }] call EFUNC(common,addEventHandler);
} else {
    ["bft_requestAllData", FUNC(handleRequestAllData)] call EFUNC(common,addEventHandler);

    [QGVAR(messages), [0, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), ["0/1", "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [2, "Message content!"]] call FUNC(syncedArrayPushback);
    [QGVAR(messages), [3, "Message content!"]] call FUNC(syncedArrayPushback);

    [QGVAR(messages), [0, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), [2, "updated content!"]] call FUNC(syncedArrayUpdate);
    [QGVAR(messages), ["0/1", "another content!"]] call FUNC(syncedArrayUpdate);

    [QGVAR(messages), 0] call FUNC(syncedArrayDelete);
    [QGVAR(messages), "0/1"] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 2] call FUNC(syncedArrayDelete);
    [QGVAR(messages), 3] call FUNC(syncedArrayDelete);

    // this setvariable ["ace_bft_assignableInformation_MDFDevice", ["elementType", 0, "elementCallsign", 1]];
};

/*
 * Only call client code below here (not for HC). Possibly move to separate clientInit
*/
if (!hasInterface) exitWith {};

["bft_deviceDataChanged", {
    private ["_data", "_deviceID", "_displayData", "_encryptionKeys", "_deviceModes"];
    _data = _this select 0;
    _deviceID = D_GET_ID(_data);
    diag_log format["EVENT: bft_deviceDataChanged - %1", _this];
    if (isNull D_GET_OWNER(_data)) exitwith { // doesn't have an owner anymore, remove.
        if !(_this select 1) then {
            // remove from availableDevices
            {
                if (AD_GET_ID(_x) == _deviceID) exitwith {
                    GVAR(availableDevices) deleteAt _forEachIndex;
                };
            } foreach GVAR(availableDevices);
        };
    };
    _encryptionKeys = D_GET_ENCRYPTION(_data);
    _deviceModes = D_GET_DEVICEMODES(_data);

    if (_this select 1) then { // add new
        if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available
        if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available

        _displayData = _data call FUNC(deviceDataToMapData);
        if (count _displayData > 0) then {
            GVAR(availableDevices) pushback _displayData;
        };
    } else { // update existing
        {
            if (AD_GET_ID(_x) == _deviceID) exitwith { // device was already available
                if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {
                    GVAR(availableDevices) deleteAt _forEachIndex; // no longer a match, so we remove it from available devices
                };
                if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {
                    GVAR(availableDevices) deleteAt _forEachIndex; // no longer a match, so we remove it from available devices
                };
                // we don't know what info has changed, so we just replace it completely.
                _displayData = _data call FUNC(deviceDataToMapData);
                GVAR(availableDevices) set [_forEachIndex, _displayData];
            };
        } foreach GVAR(availableDevices);
    };
}] call EFUNC(common,addEventHandler);

// ToDo: protection against having this called before the previous event has finished probably required
["bft_registeredEncryptionKeysChanged", {
    private ["_add","_newEncryptionKeys"];
    
    _newEncryptionKeys = _this select 0;
    _add = _this select 1;
    
    // if _add is nil, rebuild list from scratch
    if (isNil "_add") then {
        // clear current list
        GVAR(availableDevices) = [];
        _add = true;
    };
    
    // exit if there is nothing to add / remove
    if (count _newEncryptionKeys == 0) exitWith {};
    
    if (_add) then {
        private ["_deviceModes","_encryptionKeys","_displayData"];
        
        // Adding a new key isn't nice. Now we got to add new shit and loop through the massive data collection. yay?
        {
            if !(isNull D_GET_OWNER(_x)) then {
                _encryptionKeys = D_GET_ENCRYPTION(_x);
                if !([_encryptionKeys, _newEncryptionKeys] call FUNC(encryptionKeyMatch)) exitWith {};
                
                _deviceModes = D_GET_DEVICEMODES(_x);
                if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};
                
                _displayData = _x call FUNC(deviceDataToMapData);
                if (count _displayData > 0) then {
                    GVAR(availableDevices) pushback _displayData;
                };
            };
        } foreach GVAR(deviceData);
    } else { // if we remove one, we only have to check the already available devices
        private ["_device","_i"];
        
        for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
            _device = GVAR(availableDevices) select _i;
            if !([AD_GET_ENCRYPTION(_device), GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) then {
                GVAR(availableDevices) deleteAt _i;
            };
        };
    };
}] call EFUNC(common,addEventHandler);

// ToDo: protection against having this called before the previous event has finished probably required
["bft_registeredModeChanged", {
    private ["_add","_viewModes"];
    
    _viewModes = _this select 0;
    _add = _this select 1;
    
    // if _add is nil, rebuild list from scratch
    if (isNil "_add") then {
        // clear current list
        GVAR(availableDevices) = [];
        _add = true;
    };
    
    // exit if there is nothing to add / remove
    if (count _viewModes == 0) exitWith {};
    
    if (_add) then {
        private ["_deviceModes","_encryptionKeys","_displayData"];
        
        {
            if !(isNull D_GET_OWNER(_x)) then {
                _deviceModes = D_GET_DEVICEMODES(_x);
                if !([_deviceModes, _viewModes] call FUNC(encryptionKeyMatch)) exitWith {};
                
                _encryptionKeys = D_GET_ENCRYPTION(_x);
                if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitWith {};
                
                _displayData = _x call FUNC(deviceDataToMapData);
                if (count _displayData > 0) then {
                    GVAR(availableDevices) pushback _displayData;
                };
            };
        } foreach GVAR(deviceData);
    } else { // if we remove one, we only have to check the already available devices
        private ["_device","_i"];
        
        for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
            _device = GVAR(availableDevices) select _i;
            if !([AD_GET_VIEWMOES(_device), GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) then {
                GVAR(availableDevices) deleteAt _i;
            };
        };
    };
}] call EFUNC(common,addEventHandler);

["bft_colorFilteringChanged", {
    {
        private ["_groupID","_color"];
        _groupID = (_x select 6) select 0;
        if (_groupID >= 0) then {
            _color = [_groupID] call FUNC(getGroupColor);
            (_x select 6) set [1, _color];
        };
    } foreach GVAR(availableDevices);
}] call EFUNC(common,addEventHandler);

["bft_deviceOpened", {
    private ["_deviceID","_refreshRateRX","_deviceData"];
    diag_log str ["deviceOpened",_this];
    // by default, consider the device not having a receiver
    _refreshRateRX = -1;
    
    _deviceID = _this select 0;
    _deviceData = [_deviceID] call FUNC(getDeviceData);
    if !(_deviceData isEqualTo []) then {
        _refreshRateRX = D_GET_REFRESH_RATE_RX(_deviceData);
        [D_GET_ENCRYPTION(_deviceData)] call FUNC(updateRegisteredEncryptionKeys);
    };
    
    [true,_refreshRateRX] call FUNC(updateAvailableDevicesPosition);
}] call EFUNC(common,addEventHandler);

["bft_deviceClosed", {
    [false] call FUNC(updateAvailableDevicesPosition);
}] call EFUNC(common,addEventHandler);