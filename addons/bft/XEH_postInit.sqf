#include "script_component.hpp"

private ["_color", "_ctrl", "_device", "_groupID", "_i", "_newEncryptionKeys", "_viewModes"];

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

["bft_deviceDataChanged", {
    private ["_data", "_deviceID", "_displayData", "_encryptionKeys", "_deviceModes"];
    _data = _this select 0;
    _deviceID = _data select 0;
    diag_log format["EVENT: bft_deviceDataChanged - %1", _this];
    if (isNull(_data select 5)) exitwith { // doesn't have an owner anymore, remove.
        if !(_this select 1) then {
            // remove from availableDevices
            {
                if (_x select 0 == _deviceID) exitwith {
                    GVAR(availableDevices) deleteAt _forEachIndex;
                };
            }foreach GVAR(availableDevices);
        };
    };
    _encryptionKeys = (_data select 1) select 1;
    _deviceModes = _data select 9;

    if (_this select 1) then { // add new
        if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available
        if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available

        _displayData = _data call FUNC(deviceDataToMapData);
        if (count _displayData > 0) then {
            GVAR(availableDevices) pushback _displayData;
        };
    } else { // update existing
        {
            if (_x select 0 == _deviceID) exitwith { // device was already available
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
        }foreach GVAR(availableDevices);
    };
}] call EFUNC(common,addEventHandler);

["bft_registeredEncryptionKeysChanged", {
    if (_this select 0) then {
        _newEncryptionKeys = _this select 1;

        // Adding a new key isn't nice. Now we got to add new shit and loop through the massive data collection. yay?
        {
            if !(isNull(_x select 5)) then { // has an owner
                _encryptionKeys = (_x select 1) select 1;
                 if !([_encryptionKeys, _newEncryptionKeys] call FUNC(encryptionKeyMatch)) exitwith {};
                _deviceModes = _x select 9;
                if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {};
                _displayData = _x call FUNC(deviceDataToMapData);
                if (count _displayData > 0) then {
                    GVAR(availableDevices) pushback _displayData;
                };
            };
        }foreach GVAR(deviceData);
    } else { // if we remove one, we only have to check the already available devices
        private "_count";
        _count = 0;
        for "_i" from 0 to count GVAR(availableDevices)-1 step +1 do {
            _device = GVAR(availableDevices) select (_i - _count);
            if !([_device select 5, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) then {
                GVAR(availableDevices) deleteAt (_i - _count);
                _count = _count + 1;
            };
        };
    };
}] call EFUNC(common,addEventHandler);


["bft_registeredModeChanged", {
    if (_this select 0) then {
        _viewModes = _this select 1;

        {
            if !(isNull(_x select 5)) then { // has an owner
                _deviceModes = _x select 9;
                if !([_deviceModes, _viewModes] call FUNC(encryptionKeyMatch)) exitwith {};

                _encryptionKeys = (_x select 1) select 1;
                 if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {};

                _displayData = _x call FUNC(deviceDataToMapData);
                if (count _displayData > 0) then {
                    GVAR(availableDevices) pushback _displayData;
                };
            };
        }foreach GVAR(deviceData);
    } else { // if we remove one, we only have to check the already available devices
        private "_count";
        _count = 0;
        for "_i" from 0 to count GVAR(availableDevices)-1 step +1 do {
            _device = GVAR(availableDevices) select (_i - _count);
            if !([_device select 11, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) then {
                GVAR(availableDevices) deleteAt (_i - _count);
                _count = _count + 1;
            };
        };
    };
}] call EFUNC(common,addEventHandler);

["bft_colorFilteringChanged", {
    {
        _groupID = (_x select 6) select 0;
        if (_groupID >= 0) then {
            _color = [_groupID] call FUNC(getGroupColor);
            (_x select 6) set [1, _color];
        };
    }foreach GVAR(availableDevices);
}] call EFUNC(common,addEventHandler);


[{

    /*{
        if (local _x && {_x != ACE_player}) then {
            [_x] call FUNC(validateInventory);
        };
    } forEach allUnits;*/

    if (GVAR(updateAvailableDevicesPositions)) then {
        {
            if (time - (_x select 8) >= (_x select 9)) then {
                //systemChat format["updating a device position: %1", _x];
                _x set [8, time];
                _x set [4, getPosASL (_x select 10)];
            };
        }foreach GVAR(availableDevices);
    };

}, 0.1, []] call cba_fnc_addPerFrameHandler;







// Here for debug purpose until we have an interface implemented
{
    [{
        private ["_args","_idd","_idc"];
        _args = _this select 0;
        _idd = _args select 0;
        _idc = _args select 1;

        if (!isNull (findDisplay _idd)) then {
            (findDisplay _idd displayCtrl _idc) ctrlAddEventhandler (_args select 2);

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, _x] call CBA_fnc_addPerFrameHandler;
} forEach [[12,51,["Draw",{
    _ctrl = _this select 0;
    {
        _ctrl drawIcon [_x select 2, (_x select 6) select 1, _x select 4, 30, 30, 0, _x select 1, 0, 0.05, 'PuristaMedium', 'right'];
    }foreach GVAR(availableDevices);

}]]];