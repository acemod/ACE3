/*
 * Author: Gundy
 *
 * Description:
 *   Delete helmet camera
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_deleteHelmetCam;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_cam"];

if (!isNil QGVAR(hCams)) then {
    _cam = GVAR(hCams) select 0;
    _cam cameraEffect ["TERMINATE","BACK"];
    camDestroy _cam;
    deleteVehicle (GVAR(hCams) select 1);
    GVAR(hCams) = nil;
};

true