/*
 * Author: Gundy
 *
 * Description:
 *   Set up UAV camera and display on supplied render target
 *   Modified to include lessons learned from KK's excellent tutorial: http://killzonekid.com/arma-scripting-tutorials-uav-r2t-and-pip/
 *
 * Arguments:
 *   0: Device ID <STRING>
 *   1: List of arrays with seats with render targets <ARRAY>
 *       0: Seat <INTEGER>
 *           0 = DRIVER
 *           1 = GUNNER
 *       1: Name of render target <STRING>
 *
 * Return Value:
 *   If UAV cam could be set up or not <BOOL>
 *
 * Example:
 *   ["deviceID",[[0,"rendertarget8"],[1,"rendertarget9"]]] call ace_bft_devices_fnc_createUavCam;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_renderTarget","_deviceID","_seat","_uav","_uavCams","_seatName","_camPosMemPt","_camDirMemPt","_cam","_uavDeviceData"];

_uav = objNull;
_deviceID = _this select 0;

// see if given UAV name is still in the list of valid UAVs
{
    if (_deviceID == (_x select 0)) exitWith {
        // get the owner of the device (aka the UAV)
        _uavDeviceData = _x select 1;
        _uav = D_GET_OWNER(_uavDeviceData);
    };
} count GVAR(UAVlist);

// remove exisitng UAV cameras
[] call FUNC(deleteUAVcam);

// exit if requested UAV could not be found
if (isNull _uav) exitWith {false};

// exit if requested UAV is not alive
if (!alive _uav) exitWith {false};

_uavCams = _this select 1;
{
    _seat = _x select 0;
    _renderTarget = _x select 1;
    // check existing cameras
    _cam = objNull;
    _camPosMemPt = "";
    _camDirMemPt = "";
    
    _seatName = call {
        if (_seat == 0) exitWith {"Driver"};
        if (_seat == 1) exitWith {"Gunner"};
        ""
    };
    if (_seatName != "") then {
        // retrieve memory point names from vehicle config
        _camPosMemPt = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "uavCamera" + _seatName + "Pos");
        _camDirMemPt = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "uavCamera" + _seatName + "Dir");
    };
    // If memory points could be retrieved, create camera
    if ((_camPosMemPt != "") && (_camDirMemPt != "")) then {
        _cam = "camera" camCreate [0,0,0];
        _cam attachTo [_uav,[0,0,0],_camPosMemPt];
        // set up cam on render target
        _cam cameraEffect ["INTERNAL","BACK",_renderTarget];
        call {
            if (_seat == 1) exitWith {
                _renderTarget setPiPEffect [2]; // IR mode
                _cam camSetFov 0.1; // set zoom
            };
            _cam camSetFov 0.5; // set default zoom
        };
        0 = GVAR(UAVcams) pushBack [_uav,_renderTarget,_cam,_camPosMemPt,_camDirMemPt];
    };
} count _uavCams;

// set up event handler
if !(GVAR(UAVcams) isEqualTo []) exitWith {
    if (isNil QGVAR(UAVEventHandle)) then {
        GVAR(UAVEventHandle) = addMissionEventHandler ["Draw3D",{
            {
                if !(isNil "_x") then {
                    _uav = _x select 0;
                    _cam = _x select 2;
                    if (alive _uav) then {
                        _dir = (_uav selectionPosition (_x select 3)) vectorFromTo (_uav selectionPosition (_x select 4));
                        _cam setVectorDirAndUp [_dir,_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
                    } else {
                        [_cam] call FUNC(deleteUAVcam);
                    };
                };
            } count GVAR(UAVcams);
        }];
    };
    GVAR(actUav) = _uav;
    true
};

false