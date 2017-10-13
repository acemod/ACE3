#include "script_component.hpp"

GVAR(camera) cameraEffect ["terminate", "back"];
private _cameraData = [getposAtl GVAR(camera), (getposAtl GVAR(camera)) vectorFromTo (getposAtl GVAR(cameraHelper))];

camDestroy GVAR(camera);
GVAR(center) switchCamera GVAR(cameraView);
deleteVehicle GVAR(cameraHelper);

if (isMultiplayer) then {
    [QGVAR(broadcastFace), [GVAR(center), GVAR(currentFace)], QGVAR(center) + "_face"] call CBA_fnc_globalEventJIP;
    [QGVAR(center) + "_face", GVAR(center)] call CBA_fnc_removeGlobalEventJIP;

    [QGVAR(broadcastVoice), [GVAR(center), GVAR(currentVoice)], QGVAR(center) + "_voice"] call CBA_fnc_globalEventJIP;
    [QGVAR(center) + "_voice", GVAR(center)] call CBA_fnc_removeGlobalEventJIP;
};

// Select correct weapon
switch GVAR(selectedWeaponType) do {
    case 0: {GVAR(center) selectWeapon primaryWeapon GVAR(center);};
    case 1: {GVAR(center) selectWeapon secondaryWeapon GVAR(center);};
    case 2: {GVAR(center) selectWeapon handgunWeapon GVAR(center);};
};

if !(isnull curatorCamera) then {
    curatorcamera setPosAtl (_cameraData select 0);
    curatorcamera setVectorDir (_cameraData select 1);
    curatorcamera cameraEffect ["internal","back"];
};

GVAR(camera) = nil;
GVAR(cameraPosition) = nil;
GVAR(cameraHelper) = nil;
GVAR(cameraView) = nil;
GVAR(cameraPosition) = nil;
GVAR(visionMode) = nil;

GVAR(mouseButtonState) = nil;
GVAR(mode) = nil;
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(searchbarFocus) = nil;
GVAR(shiftState) = nil;

GVAR(selectedWeaponType) = nil;
GVAR(virtualItems) = nil;
GVAR(currentItems) = nil;
GVAR(currentFace) = nil;
GVAR(currentVoice) = nil;
GVAR(currentInsignia) = nil;
GVAR(currentAction) = nil;

GVAR(center) = nil;

removeMissionEventHandler ["draw3D", GVAR(camPosUpdateHandle)];

showHUD true;