/*
 * Author: Gundy
 *
 * Description:
 *   Delete UAV camera
 *
 * Arguments:
 *   Optional:
 *      0: Camera to delete <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   // delete all UAV cameras
 *   [] call ace_bft_devices_fnc__fnc_deleteUAVcam;
 *      
 *   // delete a specific UAV camera
 *   [_cam] call ace_bft_devices_fnc__fnc_deleteUAVcam;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_cam","_camToDelete","_i"];

_camToDelete = if (count _this == 1) then {_this select 0} else {objNull};

// remove cameras
for "_i" from (count GVAR(UAVcams) -1) to 0 step -1 do {
    _cam = GVAR(UAVcams) select _i select 2;
    if (isNull _camToDelete || {_cam == _camToDelete}) then {
        0 = GVAR(UAVcams) deleteAt _i;
        _cam cameraEffect ["TERMINATE","BACK"];
        camDestroy _cam;
    };
};

// remove camera direction update event handler if no more cams are present
if (count GVAR(UAVcams) == 0) then {
    if (!isNil QGVAR(UAVEventHandle)) then {
        removeMissionEventHandler ["Draw3D",GVAR(UAVEventHandle)];
        GVAR(UAVEventHandle) = nil;
    };
};

true