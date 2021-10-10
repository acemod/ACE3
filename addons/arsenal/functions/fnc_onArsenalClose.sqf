#include "script_component.hpp"
/*
 * Author: Alganthe
 * onUnLoad EH for arsenal.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

(_this select 1) params ["", "_exitCode"];

private _cameraData = [getposAtl GVAR(camera), (getposAtl GVAR(camera)) vectorFromTo (getposAtl GVAR(cameraHelper))];

[QGVAR(displayClosed), []] call CBA_fnc_localEvent;
removeMissionEventHandler ["draw3D", GVAR(camPosUpdateHandle)];

if (is3DEN) then {

    private _centerOriginParent = objectParent GVAR(centerOrigin);

    if !(isNull _centerOriginParent) then {
        _centerOriginParent hideObject false;
    };

    GVAR(centerOrigin) hideObject false;

    // Apply the loadout from the dummy to all selected units
    if (_exitCode == 1) then {
        {
            _x setUnitLoadout (getUnitLoadout GVAR(center));
        } foreach (get3DENSelected "object");

        save3DENInventory (get3DENSelected "object");
    };

    deleteVehicle GVAR(light);
    deleteVehicle GVAR(center);

    GVAR(centerOrigin) = nil;
    GVAR(light) = nil;

    get3DENCamera cameraEffect ["internal","back"];
    ["ShowInterface",true] call bis_fnc_3DENInterface;
    GVAR(visionMode) call bis_fnc_3DENVisionMode;
} else {
    // Select correct weapon
    switch GVAR(selectedWeaponType) do {
        case 0: {GVAR(center) selectWeapon primaryWeapon GVAR(center);};
        case 1: {GVAR(center) selectWeapon secondaryWeapon GVAR(center);};
        case 2: {GVAR(center) selectWeapon handgunWeapon GVAR(center);};
    };

    if (!(isnull curatorCamera) && {ACE_player == player}) then {
        curatorcamera cameraEffect ["internal","back"];
    } else {
        GVAR(camera) cameraEffect ["terminate","back"];
    };
};

deleteVehicle GVAR(cameraHelper);
camDestroy GVAR(camera);

if (!isNil QGVAR(moduleUsed)) then {
    GVAR(moduleUsed) = nil;
    objNull remoteControl GVAR(center);
};

ACE_player switchCamera GVAR(cameraView);

// Restore curator camera state
if (!isNull curatorCamera) then {
    GVAR(curatorCameraData) params ["_position", "_dirAndUp"];

    curatorCamera setPosASL _position;
    curatorCamera setVectorDirAndUp _dirAndUp;
};

if (isMultiplayer) then {
    [QGVAR(broadcastFace), [GVAR(center), GVAR(currentFace)], QGVAR(center) + "_face"] call CBA_fnc_globalEventJIP;
    [QGVAR(center) + "_face", GVAR(center)] call CBA_fnc_removeGlobalEventJIP;

    [QGVAR(broadcastVoice), [GVAR(center), GVAR(currentVoice)], QGVAR(center) + "_voice"] call CBA_fnc_globalEventJIP;
    [QGVAR(center) + "_voice", GVAR(center)] call CBA_fnc_removeGlobalEventJIP;
};

GVAR(currentBox) = objNull;

GVAR(camera) = nil;
GVAR(cameraHelper) = nil;

GVAR(curatorCameraData) = nil;

GVAR(mouseButtonState) = nil;
GVAR(currentLeftPanel) = nil;
GVAR(currentRightPanel) = nil;
GVAR(leftSearchbarFocus) = nil;
GVAR(rightSearchbarFocus) = nil;
GVAR(shiftState) = nil;
GVAR(leftTabFocus) = nil;
GVAR(rightTabFocus) = nil;
GVAR(rightTabLnBFocus) = nil;

GVAR(selectedWeaponType) = nil;
GVAR(virtualItems) = nil;
GVAR(virtualItemsFlat) = nil;
GVAR(currentItems) = nil;
GVAR(currentFace) = nil;
GVAR(currentVoice) = nil;
GVAR(currentInsignia) = nil;
GVAR(currentAction) = nil;

GVAR(showStats) = nil;
GVAR(statsPagesLeft) = nil;
GVAR(statsPagesRight) = nil;
GVAR(statsInfo) =  nil;

GVAR(center) = nil;
GVAR(centerNotPlayer) = nil;

[QUOTE(ADDON), []] call EFUNC(common,showHud);
