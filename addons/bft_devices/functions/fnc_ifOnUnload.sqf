#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Closes the currently open interface and remove any previously registered eventhandlers
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_ifOnload;
 *
 * Public: No
 */


// remove helmet and UAV cameras
[] call FUNC(deleteHelmetCam);
[] call FUNC(deleteUAVcam);

if !(I_CLOSED) then {
    // [_deviceID,_interfaceConfigName,_interfaceID,_ifType,_displayName,_isDialog,_player,_playerKilledEhId,_vehicle,_vehicleGetOutEhId]
    private _deviceID = I_GET_DEVICE;
    private _interfaceConfigName = I_GET_CONFIGNAME;
    private _interfaceID = I_GET_ID;
    private _ifType = I_GET_TYPE;
    private _displayName = I_GET_NAME;
    private _isDialog = I_GET_ISDIALOG;
    private _player = GVAR(ifOpen) select 6;
    private _playerKilledEhId = GVAR(ifOpen) select 7;
    private _vehicle = GVAR(ifOpen) select 8;
    private _vehicleGetOutEhId = GVAR(ifOpen) select 9;
    private _draw3dEhId = GVAR(ifOpen) select 10;
    private _aceUnconciousEhId = GVAR(ifOpen) select 11;
    private _aceUpdateDeviceOwnerEhId = GVAR(ifOpen) select 12;
    private _acePlayerChangedEhId = GVAR(ifOpen) select 13;

    if (!isNil "_playerKilledEhId") then {_player removeEventHandler ["killed",_playerKilledEhId]};
    if (!isNil "_vehicleGetOutEhId") then {_vehicle removeEventHandler ["GetOut",_vehicleGetOutEhId]};
    if (!isNil "_draw3dEhId") then {removeMissionEventHandler ["Draw3D",_draw3dEhId]};
    if (!isNil "_aceUnconciousEhId") then {["medical_onUnconscious",_aceUnconciousEhId] call CBA_fnc_removeEventHandler};
    if (!isNil "_aceUpdateDeviceOwnerEhId") then {["bft_updateDeviceOwner",_aceUpdateDeviceOwnerEhId] call CBA_fnc_removeEventHandler};
    if (!isNil "_acePlayerChangedEhId") then {["playerChanged",_acePlayerChangedEhId] call CBA_fnc_removeEventHandler};

    // remove notification system related PFHs
    if !(isNil QGVAR(processNotificationsPFH)) then {
        [GVAR(processNotificationsPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(processNotificationsPFH) = nil;
    };

    // don't call this part if we are closing down before setup has finished
    if (!GVAR(ifOpenStart)) then {
        if (_isDialog) then {
            // convert mapscale to km
            private _mapScale = GVAR(mapScale) * GVAR(mapScaleFactor) / 0.86 * (safezoneH * 0.8);

            // get the current position of the background control
            private _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
            private _backgroundPositionX = _backgroundPosition select 0 select 0;
            private _backgroundPositionY = _backgroundPosition select 0 select 1;

            // get the original position of the background control
            private _backgroundConfigPositionX = _backgroundPosition select 1 select 0;
            private _backgroundConfigPositionY = _backgroundPosition select 1 select 1;

            // calculate x and y as offsets to the original
            private _xOffset = _backgroundPositionX - _backgroundConfigPositionX;
            private _yOffset = _backgroundPositionY - _backgroundConfigPositionY;

            // figure out if the interface position has changed
            private _backgroundOffset = [[], [_xOffset, _yOffset]] select (_xOffset != 0 || _yOffset != 0);

            // Save mapWorldPos, mapScaleDlg and background offset of current dialog so it can be restored later
            [_interfaceID,[["mapWorldPos",GVAR(mapWorldPos)],["mapScaleDlg",_mapScale],["dlgIfPosition",_backgroundOffset]],false] call FUNC(setSettings);
        };
    };

    private _deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
    private _deviceOwner = D_GET_OWNER(_deviceData);

    // if the device is a personal device, save settings to device appData store
    if (_deviceOwner isKindOf "ParachuteBase" || _deviceOwner isKindOf "CAManBase") then {
        [_deviceID,[-1, [GVAR(settings),_interfaceID] call CBA_fnc_hashGet]] call EFUNC(bft,handleUpdateDeviceAppData);
    };

    // send "bft_deviceClosed" event
    ["bft_deviceClosed",[_deviceID]] call CBA_fnc_localEvent;

    uiNamespace setVariable [_displayName, displayNull];
    GVAR(ifOpen) = nil;
};

GVAR(cursorOnMap) = false;
GVAR(ifOpenStart) = false;

true
