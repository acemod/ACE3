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
 *   [] call ace_bft_devices_ifOnload;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_mapScale","_ifType","_player","_playerKilledEhId","_vehicle","_vehicleGetOutEhId","_draw3dEhId","_aceUnconciousEhId","_acePlayerInventoryChangedEhId","_acePlayerChangedEhId","_backgroundPosition","_backgroundPositionX","_backgroundPositionY","_backgroundConfigPositionX","_backgroundConfigPositionY","_xOffset","_yOffset","_backgroundOffset"];

// remove helmet and UAV cameras
//[] call FUNC(deleteHelmetCam);
//[] call FUNC(deleteUAVcam);

if !(I_CLOSED) then {
    // [_deviceID,_ifType,_displayName,_player,_playerKilledEhId,_vehicle,_vehicleGetOutEhId]
    _deviceID = I_GET_DEVICE;
    _ifType = I_GET_TYPE;
    _displayName = I_GET_NAME;
    _player = GVAR(ifOpen) select 3;
    _playerKilledEhId = GVAR(ifOpen) select 4;
    _vehicle = GVAR(ifOpen) select 5;
    _vehicleGetOutEhId = GVAR(ifOpen) select 6;
    _draw3dEhId = GVAR(ifOpen) select 7;
    _aceUnconciousEhId = GVAR(ifOpen) select 8;
    _aceUpdateDeviceOwnerEhId = GVAR(ifOpen) select 9;
    _acePlayerChangedEhId = GVAR(ifOpen) select 10;
    
    if (!isNil "_playerKilledEhId") then {_player removeEventHandler ["killed",_playerKilledEhId]};
    if (!isNil "_vehicleGetOutEhId") then {_vehicle removeEventHandler ["GetOut",_vehicleGetOutEhId]};
    if (!isNil "_draw3dEhId") then {removeMissionEventHandler ["Draw3D",_draw3dEhId]};
    if (!isNil "_aceUnconciousEhId") then {["medical_onUnconscious",_aceUnconciousEhId] call EFUNC(common,removeEventHandler)};
    if (!isNil "_aceUpdateDeviceOwnerEhId") then {["bft_updateDeviceOwner",_aceUpdateDeviceOwnerEhId] call EFUNC(common,removeEventHandler)};
    if (!isNil "_acePlayerChangedEhId") then {["playerChanged",_acePlayerChangedEhId] call EFUNC(common,removeEventHandler)};
    
    // remove notification system related PFHs
    if !(isNil QGVAR(processNotificationsPFH)) then {
        [GVAR(processNotificationsPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(processNotificationsPFH) = nil;
    };
    
    // don't call this part if we are closing down before setup has finished
    if (!GVAR(ifOpenStart)) then {
        if ([_displayName] call FUNC(isDialog)) then {
            // convert mapscale to km
            _mapScale = GVAR(mapScale) * GVAR(mapScaleFactor) / 0.86 * (safezoneH * 0.8);
            
            // get the current position of the background control
            _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
            _backgroundPositionX = _backgroundPosition select 0 select 0;
            _backgroundPositionY = _backgroundPosition select 0 select 1;
            
            // get the original position of the background control
            _backgroundConfigPositionX = _backgroundPosition select 1 select 0;
            _backgroundConfigPositionY = _backgroundPosition select 1 select 1;
            
            // calculate x and y as offsets to the original
            _xOffset = _backgroundPositionX - _backgroundConfigPositionX;
            _yOffset = _backgroundPositionY - _backgroundConfigPositionY;
            
            // figure out if the interface position has changed
            _backgroundOffset = if (_xOffset != 0 || _yOffset != 0) then {
                [_xOffset,_yOffset]
            } else {
                []
            };
            
            // Save mapWorldPos, mapScaleDlg and background offset of current dialog so it can be restored later
            [_displayName,[["mapWorldPos",GVAR(mapWorldPos)],["mapScaleDlg",_mapScale],["dlgIfPosition",_backgroundOffset]],false] call FUNC(setSettings);
        };
    };
    
    // send "bft_deviceClosed" event
    ["bft_deviceClosed",[I_GET_DEVICE]] call EFUNC(common,localEvent);
    
    uiNamespace setVariable [_displayName, displayNull];
    GVAR(ifOpen) = nil;
};

GVAR(cursorOnMap) = false;
GVAR(ifOpenStart) = false;

true