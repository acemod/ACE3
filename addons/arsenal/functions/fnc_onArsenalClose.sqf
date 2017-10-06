#include "script_component.hpp"

GVAR(camera) cameraEffect ["terminate","back"];
private _cameraData = [getposatl GVAR(camera), (getposatl GVAR(camera)) vectorfromto (getposatl GVAR(cameraHelper))];

camDestroy GVAR(camera);
player switchCamera GVAR(cameraView);
deleteVehicle GVAR(cameraHelper);

if !(isnull curatorCamera) then {
    curatorcamera setPosAtl (_cameraData select 0);
    curatorcamera setVectorDir (_cameraData select 1);
    curatorcamera cameraEffect ["internal","back"];
};

// Select correct weapon
switch GVAR(selectedWeaponType) do {
    case 0: {GVAR(center) selectWeapon primaryWeapon GVAR(center);};
    case 1: {GVAR(center) selectWeapon secondaryWeapon GVAR(center);};
    case 2: {GVAR(center) selectWeapon handgunWeapon GVAR(center);};
};

GVAR(camera) = nil;
GVAR(cameraPosition) = nil;
GVAR(cameraHelper) = nil;
GVAR(cameraView) = nil;
GVAR(center) = nil;
GVAR(cameraPosition) = nil;
GVAR(selectedWeaponType) = nil;
GVAR(visionMode) = nil;
GVAR(mouseButtonState) = nil;
removeMissionEventHandler ["draw3D", GVAR(camPosUpdateHandle)];

showHUD true;