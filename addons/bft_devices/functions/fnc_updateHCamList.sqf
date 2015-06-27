/*
 * Author: Gundy
 *
 * Description:
 *   Temporary function to compile a list of units with matching side encryption key, that have ACE_HelmetCam in their inventory.
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_updateHCamList;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceData","_deviceEncryptionKey","_validSides","_hcamList"];

// bail if no interface is open
if (I_CLOSED) exitWith {true};

// get encryption key for currently open device
_deviceData = [I_GET_DEVICE] call EFUNC(bft,getDeviceData);
_deviceEncryptionKey = D_GET_ENCRYPTION(_deviceData);

// compile a list of valid sides
_validSides = [];
{
    if ([_deviceEncryptionKey,[_x] call EFUNC(bft,getEncryptionKey)] call EFUNC(bft,encryptionKeyMatch)) then {
        0 = _validSides pushBack _x;
    };
} count ["WEST","EAST","GUER","CIV"];

// compile list of units with the ACE_HelmetCam item
_hcamList = [];
{
    if (str side _x in _validSides) then {
        if ("ACE_HelmetCam" in items _x) then {
            0 = _hcamList pushBack _x;
        };
    };
} count allUnits;

GVAR(hCamList) = _hcamList;

true