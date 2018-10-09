#include "script_component.hpp"
/*
 * Author: commy2
 * Helper function for updating the 2d and 3d scope controls
 * Called from a dummy map controls onDraw.
 *
 * Arguments:
 * 0: Display (RscInGameUI for a weapon) <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_RscWeapon_Arco's Display] call ace_optics_fnc_onDrawScope2D
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

// @todo, all weapon types
private _optic = (primaryWeaponItems ACE_player) select 2;
private _isPIP = (getText (configFile >> "CfgWeapons" >> _optic >> "ItemInfo" >> "modelOptics")) == QPATHTOF(models\ace_optics_pip.p3d);

if (_isPIP) then {
    GVAR(pipLastFrame) = diag_frameno;
    if (isNull GVAR(camera)) then {
        if ((({_x != GVAR(camera)} count allMissionObjects "camera") > 0) || {!isNull curatorCamera}) exitWith {
            TRACE_1("waiting for feature camera to end",GVAR(camera));
        };

        // PiP technique by BadBenson
        GVAR(camera) = "camera" camCreate positionCameraToWorld [0, 0, 0];
        GVAR(camera) camSetFov 0.7;
        GVAR(camera) camSetTarget ACE_player;
        GVAR(camera) camCommit 1;

        QGVAR(rendertarget0) setPiPEffect [0];
        GVAR(camera) cameraEffect ["INTERNAL", "BACK", QGVAR(rendertarget0)];

        TRACE_2("created new pip camera",GVAR(camera),isNull GVAR(camera));

        // Start a waitUntil to handle destruction after GVAR(pipLastFrame) is no longer updated
        [{
            (abs (diag_frameno - GVAR(pipLastFrame))) > 1
        }, {
            GVAR(camera) cameraEffect ["TERMINATE", "BACK"];
            camDestroy GVAR(camera);
            TRACE_2("destroyed pip camera",GVAR(camera),isNull GVAR(camera));
        }, []] call CBA_fnc_waitUntilAndExecute;
    };
};

//If we are not zoomed into the actual scope (not collimator)
if (!ctrlShown (_display displayCtrl 154)) exitWith {
    (_display displayCtrl 1713001) ctrlShow false;
    (_display displayCtrl 1713002) ctrlShow false;
    (_display displayCtrl 1713005) ctrlShow false;
    (_display displayCtrl 1713006) ctrlShow false;
    (_display displayCtrl 1713010) ctrlShow false;
    (_display displayCtrl 1713011) ctrlShow false;
};

if (_isPIP) then {
    GVAR(camera) setPosATL positionCameraToWorld [0, 0, 0.4];
    GVAR(camera) camPrepareTarget positionCameraToWorld [0, 0, 50];
    GVAR(camera) camCommitPrepared 0;

    // @todo, check if that needs to be done at all
    if (cameraView == "GUNNER") then {
        GVAR(camera) camsetFOV 0.7;
        GVAR(camera) camcommit 0;
    } else {
        GVAR(camera) camsetFOV 0.01;
        GVAR(camera) camcommit 0;
    };
};

// Calculate lighting
private _dayOpacity = call EFUNC(common,ambientBrightness);
private _nightOpacity = [1, 0] select (_dayOpacity == 1);

// Apply lighting and make layers visible
(_display displayCtrl 1713001) ctrlSetTextColor [1, 1, 1, 1];
(_display displayCtrl 1713002) ctrlSetTextColor [1, 1, 1, [0, 1] select (_dayOpacity < 0.5)];
(_display displayCtrl 1713005) ctrlSetTextColor [1, 1, 1, _dayOpacity];
(_display displayCtrl 1713006) ctrlSetTextColor [1, 1, 1, _nightOpacity];

/*
(_display displayCtrl 1713001) ctrlCommit 0;
(_display displayCtrl 1713002) ctrlCommit 0;
(_display displayCtrl 1713005) ctrlCommit 0;
(_display displayCtrl 1713006) ctrlCommit 0;
 */

(_display displayCtrl 1713001) ctrlShow true;
(_display displayCtrl 1713002) ctrlShow true;
(_display displayCtrl 1713005) ctrlShow true;
(_display displayCtrl 1713006) ctrlShow true;
(_display displayCtrl 1713010) ctrlShow _isPIP;
(_display displayCtrl 1713011) ctrlShow _isPIP;
