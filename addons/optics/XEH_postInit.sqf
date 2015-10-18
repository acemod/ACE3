// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(camera) = objNull;

0 = 0 spawn {
    waituntil {!isNull ACE_player};
    waituntil {sleep 1; {_x != GVAR(camera)} count allMissionObjects "camera" == 0 && {isNull curatorCamera}};

    GVAR(camera) cameraEffect ["TERMINATE", "BACK"];
    camDestroy GVAR(camera);

    // PiP technique by BadBenson
    GVAR(camera) = "camera" camCreate positionCameraToWorld [0,0,0];
    GVAR(camera) camSetFov 0.7;
    GVAR(camera) camSetTarget ACE_player;
    GVAR(camera) camCommit 1;

    "ace_optics_rendertarget0" setPiPEffect [0];
    GVAR(camera) cameraEffect ["INTERNAL", "BACK", "ace_optics_rendertarget0"];
};

// save control for fired EH
["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713001)) then {
        uiNamespace setVariable [QGVAR(RscWeaponInfo2D), _this select 0];
    };
}] call EFUNC(common,addEventHandler);

// camera has to be re-created every time another camera is created. Otherwise r2t is either black or transparent. @todo Add popular custom cameras to the event in ACE_common.
["activeCameraChanged", {
    if !(_this select 1) then {
        GVAR(camera) cameraEffect ["TERMINATE", "BACK"];
        camDestroy GVAR(camera);

        // PiP technique by BadBenson
        GVAR(camera) = "camera" camCreate positionCameraToWorld [0,0,0];
        GVAR(camera) camSetFov 0.7;
        GVAR(camera) camSetTarget ACE_player;
        GVAR(camera) camCommit 1;

        "ace_optics_rendertarget0" setPiPEffect [0];
        GVAR(camera) cameraEffect ["INTERNAL", "BACK", "ace_optics_rendertarget0"];
    };
}] call EFUNC(common,addEventHandler);
