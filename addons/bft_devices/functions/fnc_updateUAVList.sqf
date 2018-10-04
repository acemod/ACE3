#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Temporary function to get a list of UAVs that have a device configured and are match the encryption key
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_updateUAVList;
 *
 * Public: No
 */


// bail if no interface is open
if (I_CLOSED) exitWith {};

// get encryption keys for currently open device
private _deviceData = [I_GET_DEVICE] call EFUNC(bft,getDeviceData);
private _deviceEncryption = D_GET_ENCRYPTION(_deviceData);

GVAR(UAVlist) = [];

// interate through all UAVs and create a list containing [deviceID,[deviceData]]
{
    // check if UAV has a device
    private _uavDevices = [_x] call EFUNC(bft,getOwnedDevices);
    if !(_uavDevices isEqualTo []) then {
        private _uavDevice = _uavDevices select 0;
        private _uavDeviceData = [_uavDevice] call EFUNC(bft,getDeviceData);
        // check if UAV has matching encryption key
        private _uavEncryption = D_GET_ENCRYPTION(_uavDeviceData);
        if ([_deviceEncryption,_uavEncryption] call EFUNC(BFT,encryptionKeyMatch)) then {
            GVAR(UAVlist) pushBack [_uavDevice,_uavDeviceData];
        };
    };
} forEach allUnitsUAV;

true
