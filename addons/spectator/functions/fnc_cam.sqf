/*
 * Author: Nelson Duarte, SilentSpike
 * Handles camera initialisation and destruction
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_init"];

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
    GVAR(camFast)               = false;
    GVAR(camLights)             = [];
    GVAR(camLight)              = false;

    // Create the camera
    private _camera = "CamCurator" camCreate eyePos player;

    if (isNull _camera) exitWith { ERROR("Camera wasn't created successfully"); };

    // Switch to the camera and set its attributes
    _camera cameraEffect ["internal", "back"];
    _camera setPosASL eyePos player;
    _camera setDir getDirVisual player;
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
    GVAR(camFast)               = nil;
    GVAR(camLights)             = nil;
    GVAR(camLight)              = nil;
};
