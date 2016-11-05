// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(camera) = objNull;

// save control for fired EH
["ace_infoDisplayChanged", {
    TRACE_1("ace_infoDisplayChanged",_this);
    if (!isNull ((_this select 0) displayCtrl 1713001)) then {
        uiNamespace setVariable [QGVAR(RscWeaponInfo2D), _this select 0];
    };
}] call CBA_fnc_addEventHandler;

// camera has to be re-created every time another camera is created. Otherwise r2t is either black or transparent. @todo Add popular custom cameras to the event in ACE_common.
["ace_activeCameraChanged", {
    params ["", "_isfeatureCameraActive"];
    TRACE_1("ace_activeCameraChanged",_isfeatureCameraActive);
    if (!_isfeatureCameraActive) then {
        //Destroy the camera, and it will be re-created in the onDrawScope2d helper
        if (!isNull GVAR(camera)) then {
            GVAR(camera) cameraEffect ["TERMINATE", "BACK"];
            camDestroy GVAR(camera);
            TRACE_1("destroying pip camera for restart",GVAR(camera));
        };
    };
}] call CBA_fnc_addEventHandler;

// Register fire event handler
["ace_firedPlayer", DFUNC(handleFired)] call CBA_fnc_addEventHandler;
