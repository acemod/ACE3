#include "script_component.hpp"
/*
* Author: PabstMirror
* Cleans up existing viewport display and camera
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call ace_viewports_fnc_viewCleanup
*
* Public: No
*/

TRACE_1("camCleanup",_this);

if (!isNull (missionNamespace getVariable [QGVAR(camera), objNull])) then {
    GVAR(camera) cameraEffect ["terminate", "back", QGVAR(pip0)];
    camDestroy GVAR(camera);
};

private _display = uiNamespace getVariable [QGVAR(display), displayNull];
if (!isNull _display) then {
    QGVAR(display) cutText ["", "PLAIN"];
};
