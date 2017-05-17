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

    // Ticking related
    GVAR(camDeltaTime)          = 0;
    GVAR(camLastTickTime)       = 0;
    GVAR(camHasTarget)          = false;
    GVAR(camTargetInVehicle)    = false;

    // Drawing related
    GVAR(drawProjectiles)       = false;
    GVAR(drawUnits)             = true;
    GVAR(grenades)              = [];
    GVAR(projectiles)           = [];
    GVAR(thingsToDraw)          = [];

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

    // If camera didn't move slower closer to the ground it would be jarring
    _camera camCommand "surfaceSpeed on";

    // Store camera
    GVAR(camera) = _camera;

    // Create dummy target used for follow camera
    // TODO: Check if a camera object works here
    GVAR(camDummy) = "Land_HelipadEmpty_F" createVehicleLocal getPosASLVisual GVAR(camTarget);

    // Start ticking
    GVAR(camPFH) = [LINKFUNC(cam_updateThingsToDraw), 0.2] call CBA_fnc_addPerFrameHandler;
    GVAR(draw3D) = addMissionEventHandler ["Draw3D", {call FUNC(cam_draw3D)}];

    // Set the initial camera mode (could be pre-set)
    [GVAR(camMode)] call FUNC(cam_setCameraMode);
} else {
    // Stop ticking
    removeMissionEventHandler ["Draw3D", GVAR(draw3D)];
    GVAR(draw3D) = nil;

    // Stop updating things to draw
    [GVAR(camPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(camPFH) = nil;

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
    GVAR(camDeltaTime)          = nil;
    GVAR(camLastTickTime)       = nil;
    GVAR(camHasTarget)          = nil;
    GVAR(camTargetInVehicle)    = nil;
    GVAR(drawProjectiles)       = nil;
    GVAR(drawUnits)             = nil;
    GVAR(grenades)              = nil;
    GVAR(projectiles)           = nil;
    GVAR(thingsToDraw)          = nil;
    GVAR(camDistance)           = nil;
    GVAR(camDistanceTemp)       = nil;
    GVAR(camYaw)                = nil;
    GVAR(camPitch)              = nil;
    GVAR(camFast)               = nil;
    GVAR(camLights)             = nil;
    GVAR(camLight)              = nil;
};
