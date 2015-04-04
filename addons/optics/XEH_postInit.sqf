// by commy2
#include "script_component.hpp"

// PiP technique by BadBenson
GVAR(camera) = "camera" camCreate positioncameratoworld [0,0,0];
GVAR(camera) camSetFov 0.7;
GVAR(camera) camSetTarget ACE_player;
GVAR(camera) camCommit 1;

"ace_optics_rendertarget0" setPiPEffect [2, 1.0, 1.0, 1.0, 0.0, [0.0, 1.0, 0.0, 0.25], [1.0, 0.0, 1.0, 1.0], [0.199, 0.587, 0.114, 0.0]];
GVAR(camera) cameraEffect ["INTERNAL", "BACK", "ace_optics_rendertarget0"];

// save control for fired EH
["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713001)) then {
        uiNamespace setVariable [QGVAR(RscWeaponInfoPIP), _this select 0];
    };
}] call EFUNC(common,addEventHandler);
