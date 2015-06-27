/*
 * Author: Gundy
 *
 * Description:
 *   Set up helmet camera and display on supplied render target
 *
 * Arguments:
 *   0: Render target <STRING>
 *   1: Name of unit with helmet camera (format used from `str unitObject`) <STRING>
 *
 * Return Value:
 *   If helmet cam could be set up or not <BOOL>
 *
 * Example:
 *   ["rendertarget12",str ACE_player] call ace_bft_devices_fnc_createHelmetCam;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_renderTarget","_data","_newHost","_camOffSet","_targetOffSet","_oldCam","_oldHost","_nop","_target","_cam"];

_renderTarget = _this select 0;
_data = _this select 1;

_newHost = objNull;
_camOffSet = [];
_targetOffSet = [];

// see if given unit name is still in the list of units with valid helmet cams
{
    if (_data == str _x) exitWith {_newHost = _x;};
} count GVAR(hCamList);

call {
    // should unit not be in a vehicle
    if (vehicle _newHost isKindOf "CAManBase" || {vehicle _newHost isKindOf "ParachuteBase"}) exitWith {
        _camOffSet = [0.12,0,0.15];
        _targetOffSet = [0,8,1];
    };
    // if unit is in a vehilce, see if 3rd person view is allowed
    if (difficultyEnabled "3rdPersonView") exitWith {
        _newHost = vehicle _newHost;
        // Might want to calculate offsets based on the actual vehicle dimensions in the future
        _camOffSet = [0,-8,4];
        _targetOffSet = [0,8,2];
    };
    // if unit is in a vehicle and 3rd person view is not allowed
    _newHost = objNull;
};

// if there is no valid unit or we are not allowed to set up a helmet cam in these conditions, return FALSE
if (isNull _newHost) exitWith {false};

// make sure there is no camera currently set up
[] call FUNC(deleteHelmetCam);

_target = "Sign_Sphere10cm_F" createVehicleLocal position player;
hideObject _target;
_target attachTo [_newHost,_targetOffSet];

_cam = "camera" camCreate getPosATL _newHost;
_cam camPrepareFov 0.700;
_cam camPrepareTarget _target;
_cam camCommitPrepared 0;
if (vehicle _newHost == _newHost) then {
    _cam attachTo [_newHost,_camOffSet,"Head"];
} else {
    _cam attachTo [_newHost,_camOffSet];
};
_cam cameraEffect ["INTERNAL","BACK",_renderTarget];

GVAR(hCams) = [_cam,_target,_newHost];

true