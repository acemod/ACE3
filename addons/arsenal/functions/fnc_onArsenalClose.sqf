#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * onUnLoad EH for arsenal.
 *
 * Arguments:
 * 0: Not used
 * 1: Args <ARRAY>
 * - 0: Not used
 * - 1: Exit code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

(_this select 1) params ["", "_exitCode"];

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
        private _extendedLoadout = GVAR(center) call CBA_fnc_getLoadout;
        private _objects = get3DENSelected "object";

        {
            [_x, _extendedLoadout] call CBA_fnc_setLoadout;
        } forEach _objects;

        save3DENInventory _objects;
    };

    deleteVehicle GVAR(light);
    deleteVehicle GVAR(center);

    GVAR(centerOrigin) = nil;
    GVAR(light) = nil;

    get3DENCamera cameraEffect ["Internal", "BACK"];
    ["ShowInterface", true] call BIS_fnc_3DENInterface;
    GVAR(visionMode) call BIS_fnc_3DENVisionMode;
} else {
    // Select correct weapon
    switch (GVAR(selectedWeaponType)) do {
        case 0: {GVAR(center) selectWeapon (primaryWeapon GVAR(center))};
        case 1: {GVAR(center) selectWeapon (secondaryWeapon GVAR(center))};
        case 2: {GVAR(center) selectWeapon (handgunWeapon GVAR(center))};
    };

    if (!isNull curatorCamera && {ACE_player == player}) then {
        curatorCamera cameraEffect ["Internal", "BACK"];
    } else {
        GVAR(camera) cameraEffect ["Terminate", "BACK"];
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

// Make face and voice selection JIP compatible; 3DEN doesn't need this though
if (isMultiplayer && {!is3DEN}) then {
    private _id = [QGVAR(broadcastFace), [GVAR(center), GVAR(currentFace)], QGVAR(centerFace_) + netId GVAR(center)] call CBA_fnc_globalEventJIP;
    [_id, GVAR(center)] call CBA_fnc_removeGlobalEventJIP;

    _id = [QGVAR(broadcastVoice), [GVAR(center), GVAR(currentVoice)], QGVAR(centerVoice_) + netId GVAR(center)] call CBA_fnc_globalEventJIP;
    [_id, GVAR(center)] call CBA_fnc_removeGlobalEventJIP;
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
GVAR(liveUpdateSearch) = nil;
GVAR(shiftState) = nil;
GVAR(leftTabFocus) = nil;
GVAR(rightTabFocus) = nil;
GVAR(rightTabLnBFocus) = nil;
GVAR(ignoreFirstSortPanelCall) = nil;
GVAR(refreshing) = nil;

GVAR(selectedWeaponType) = nil;
GVAR(virtualItems) = nil;
GVAR(virtualItemsFlat) = nil;
GVAR(virtualItemsFlatAll) = nil;
GVAR(currentItems) = nil;
GVAR(currentFace) = nil;
GVAR(currentVoice) = nil;
GVAR(currentInsignia) = nil;
GVAR(currentAction) = nil;

GVAR(showStats) = nil;
GVAR(currentStatPage) = nil;
GVAR(statsInfo) =  nil;

GVAR(showActions) = nil;
GVAR(currentActionPage) = nil;

profileNamespace setVariable [QGVAR(favorites), GVAR(favorites)];
GVAR(favoritesOnly) = nil;
GVAR(favorites) = nil;

GVAR(center) = nil;
GVAR(centerNotPlayer) = nil;

GVAR(ignoredVirtualItems) = nil;

[QUOTE(ADDON), []] call EFUNC(common,showHud);
