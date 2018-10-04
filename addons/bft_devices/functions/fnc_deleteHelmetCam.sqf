#include "script_component.hpp"
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


if (!isNil QGVAR(hCams)) then {
    private _cam = GVAR(hCams) select 0;
    _cam cameraEffect ["TERMINATE","BACK"];
    camDestroy _cam;
    deleteVehicle (GVAR(hCams) select 1);
    GVAR(hCams) = nil;
};

true
