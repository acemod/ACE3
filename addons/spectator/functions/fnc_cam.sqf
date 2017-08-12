/*
 * Author: Nelson Duarte, SilentSpike
 * Handles camera initialisation and destruction
 *
 * Arguments:
 * 0: Init/Terminate <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_spectator_fnc_cam
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_init"];

// No change
if (_init isEqualTo !isNil QGVAR(camera)) exitWith {};

// Note that init and destroy intentionally happen in reverse order
// Init: Vars > Camera > Camera Stuff
// Destroy: Camera Stuff > Camera > Vars
if (_init) then {
    // Start tracking camera attributes if not pre-set by public function
    ISNILS(GVAR(camMode),MODE_FREE);
    ISNILS(GVAR(camVision),VISION_NORM);
    ISNILS(GVAR(camTarget),objNull);
    ISNILS(GVAR(camOnLocation),false);

    // Ticking related
    GVAR(camDeltaTime)          = 0;
    GVAR(camLastTickTime)       = 0;
    GVAR(camHasTarget)          = false;
    GVAR(camTargetInVehicle)    = false;

    // Follow camera related
    GVAR(camDistance)           = 0;
    GVAR(camDistanceTemp)       = 0;
    GVAR(camYaw)                = 0;
    GVAR(camPitch)              = 0;

    // Toggles
    GVAR(camSlow)               = false;
    GVAR(camLights)             = [];
    GVAR(camLight)              = false;

    // Handle pre-set pos and dir (delete GVARs when done)
    private _pos = if (isNil QGVAR(camPos)) then {eyePos player} else {GVAR(camPos)};
    private _dir = if (isNil QGVAR(camDir)) then {getDirVisual player} else {GVAR(camDir)};
    GVAR(camPos) = nil;
    GVAR(camDir) = nil;

    // Create the camera (CamCurator required for engine driven controls)
    private _camera = "CamCurator" camCreate _pos;

    if (isNull _camera) exitWith { ERROR("Camera wasn't created successfully"); };

    // Switch to the camera and set its attributes
    _camera cameraEffect ["internal", "back"];
    _camera setPosASL _pos;
    _camera setDir _dir;
    _camera camCommand "maxPitch 89";
    _camera camCommand "minPitch -89";
    _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
    _camera camCommand format ["speedMax %1", SPEED_FAST];
    _camera camCommand "ceilingHeight 5000";
    cameraEffectEnableHUD true;

    // If camera followed terrain it would be annoying to track units, etc.
    _camera camCommand "atl off";

    // Camera speed should be consistent irrespective of height (painfully slow otherwise)
    _camera camCommand "surfaceSpeed off";

    // Store camera
    GVAR(camera) = _camera;

    // Create dummy target used for follow camera
    GVAR(camDummy) = "Logic" createVehicleLocal getPosASLVisual GVAR(camTarget);

    // Handle initial camera mode limitation
    if !(GVAR(camMode) in GVAR(availableModes)) then {
        GVAR(camMode) = GVAR(availableModes) select 0;
    };

    // If inital camera mode is not free cam and no focus, find initial focus
    if (GVAR(camMode) != MODE_FREE && isNull GVAR(camTarget)) then {
        [true] call FUNC(setFocus);
    };

    // Set the initial camera mode (could be pre-set or limited)
    [GVAR(camMode)] call FUNC(cam_setCameraMode);

    // Handle initial vision mode limitation
    if !(GVAR(camVision) in GVAR(availableVisions)) then {
        GVAR(camVision) = GVAR(availableVisions) select 0;
    };

    // Set the initial vision mode (could be pre-set or limited)
    [GVAR(camVision)] call FUNC(cam_setVisionMode);

    // Start ticking (follow camera requires EachFrame to avoid jitter)
    GVAR(camTick) = addMissionEventHandler ["EachFrame", {call FUNC(cam_tick)}];
} else {
    // Stop ticking
    removeMissionEventHandler ["EachFrame", GVAR(camTick)];
    GVAR(camTick) = nil;

    // Return to player view
    if !(isNull GVAR(camera)) then {
        GVAR(camera) cameraEffect ["terminate", "back"];
        deleteVehicle GVAR(camera);
    };
    player switchCamera "internal";

    // Remove camera variable
    GVAR(camera) = nil;

    // Destroy dummy target
    deleteVehicle (GVAR(camDummy));
    GVAR(camDummy) = nil;

    // Stop tracking everything
    GVAR(camMode)               = nil;
    GVAR(camVision)             = nil;
    GVAR(camTarget)             = nil;
    GVAR(camOnLocation)         = nil;
    GVAR(camDeltaTime)          = nil;
    GVAR(camLastTickTime)       = nil;
    GVAR(camHasTarget)          = nil;
    GVAR(camTargetInVehicle)    = nil;
    GVAR(camDistance)           = nil;
    GVAR(camDistanceTemp)       = nil;
    GVAR(camYaw)                = nil;
    GVAR(camPitch)              = nil;
    GVAR(camSlow)               = nil;
    GVAR(camLights)             = nil;
    GVAR(camLight)              = nil;
};
