/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to perform camera ticks
 *
 * Updates camera position in follow mode
 * Updates camera focus if current focus becomes null (in unit modes)
 * Updates camera when focus enters/exits a vehicle
 * Updates camera lights position
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * addMissionEventHandler ["EachFrame", {call ace_spectator_fnc_cam_tick}]
 *
 * Public: No
 */

#include "script_component.hpp"

BEGIN_COUNTER(camTick);
private _cameraMode = GVAR(camMode);
private _camTarget = GVAR(camFocus);

// UI mouse handler makes use of delta time between camera ticks
private _currentTime = diag_tickTime;
GVAR(camDeltaTime) = _currentTime - GVAR(camLastTickTime);
GVAR(camLastTickTime) = _currentTime;


// If no focus in unit camera modes try to find a new one
if (_cameraMode != MODE_FREE) then {
    private _focus = if (isNull _camTarget) then {
        private _testFocus = ([] call FUNC(getTargetEntities)) select 0;
        if (isNil "_testFocus") then {
            objNull
        } else {
            _testFocus
        }
    } else {
        _camTarget
    };

    // If new focus was found then switch to it
    if (!isNull _focus && {_focus != _camTarget}) then {
        [_focus] call FUNC(setFocus);
    };

    // Update the follow camera position
    if (!isNull _focus && {_cameraMode == MODE_FOLLOW}) then {
        [_focus] call FUNC(cam_prepareTarget);
    };
};

// Refresh the local variable
_camTarget = GVAR(camFocus);

// Focus get in / out of vehicle state
if !(isNull _camTarget) then {
    private _targetInVeh = GVAR(camTargetInVehicle);

    if (GVAR(camHasTarget)) then {
        if (!_targetInVeh && { vehicle _camTarget != _camTarget }) then {
            [_camTarget] call FUNC(cam_setTarget);
            GVAR(camTargetInVehicle) = true;
        };

        if (_targetInVeh && { vehicle _camTarget == _camTarget }) then {
            [_camTarget] call FUNC(cam_setTarget);
            GVAR(camTargetInVehicle) = false;
        };
    };
} else {
    GVAR(camTargetInVehicle) = false;
};

// Camera lights
if (count GVAR(camLights) > 1) then {
    (GVAR(camLights) select 1) setPosASL (AGLToASL (screenToWorld getMousePosition));
};
END_COUNTER(camTick);
