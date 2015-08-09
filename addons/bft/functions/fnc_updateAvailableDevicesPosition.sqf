/*
 * Author: Glowbal, Gundy
 *
 * Description:
 *   Start or stop a PFEH to update the position of available devices (icons to draw)
 *
 * Arguments:
 *   0: Start = TRUE, Stop = FALSE <BOOL>
 *   1: Refresh rate to run the update loop at (equals the device's RX refresh rate), ignored on stop <FLOAT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   // start the loop with a 5 second update interval
 *   [true,5] call ace_bft_fnc_updateAvailableDevicesPostion;
 *
 *   // stop the loop
 *   [false] call ace_bft_fnc_updateAvailableDevicesPostion;
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_startNewLoop,_refreshRateRX)

if (_startNewLoop) then {
    // if there is an ongoing position update loop running, close it down first
    if (!isNil QGVAR(positionUpdatePFEH)) then {
        [GVAR(positionUpdatePFEH)] call cba_fnc_removePerFrameHandler;
    };

    // bail if this device does not have a receiver
    if (_refreshRateRX < 0) exitWith {false};

    // do not let the refresh rate sink below 0.1
    _refreshRateRX = _refreshRateRX max 0.1;

    // start a new position update loop
    GVAR(positionUpdatePFEH) = [{
            {
                if (ACE_time - (AD_GET_TIME(_x)) >= (AD_GET_REFRESH_RATE(_x))) then {
                    if (AD_GET_DEVICE_STATE_VALUE(_x) isEqualTo STATE_NORMAL) then {
                        //if (!(D_GET_OWNER(_x) isKindOf "CAManBAse") && {!(isEngineOn D_GET_OWNER(_x))}) exitwith {};
                        //systemChat format["updating a device position: %1", _x];
                        _x set [8, ACE_time];
                        _x set [4, getPosASL AD_GET_OWNER(_x)];
                        _x set [12, direction AD_GET_OWNER(_x)];
                    } else {
                        private ["_deviceState"];
                        _deviceState = AD_GET_DEVICE_STATE(_x);
                        (_x select 6) set [1, [0.6, 0.6, 0.6, (1 - ((ACE_time - (_deviceState select 3)) / 100)) max 0.4]];
                        _x set [4, _deviceState select 1];
                        _x set [12, _deviceState select 2];
                    };
                };
            } foreach GVAR(availableDevices);
    }, _refreshRateRX, []] call cba_fnc_addPerFrameHandler;
} else {
    // close down the position update loop
    if (!isNil QGVAR(positionUpdatePFEH)) then {
        [GVAR(positionUpdatePFEH)] call cba_fnc_removePerFrameHandler;
    };
    GVAR(positionUpdatePFEH) = nil;
};

true