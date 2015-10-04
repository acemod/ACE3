/*
 * Author: SilentSpike
 * Transitions the spectator camera vision/view/unit
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 * 1: Camera unit <OBJECT>
 * 2: Vision mode <NUMBER>
 *   - -2: Normal
 *   - -1: NV
 *   -  0: White hot
 *   -  1: Black hot
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0,objNull] call ace_spectator_fnc_transitionCamera
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newMode",GVAR(camMode)], ["_newUnit",GVAR(camUnit)], ["_newVision",GVAR(camVision)]];

// If new mode isn't available then keep current (unless current also isn't)
if !(_newMode in GVAR(availableModes)) then {
    _newMode = GVAR(availableModes) select ((GVAR(availableModes) find GVAR(camMode)) max 0);
};

// When no units available to spectate, exit to freecam
if ((GVAR(unitList) isEqualTo []) && (alive _newUnit || isNull _newUnit)) then {
    _newMode = 0;
    _newUnit = objNull;
};

// Reset gun cam if not internal
if (_newMode != 1) then {
    GVAR(camGun) = false;
};

private ["_camera"];
if (_newMode == 0) then { // Free
    _camera = GVAR(freeCamera);

    // Preserve camUnit value for consistency when manually changing view
    _camera cameraEffect ["internal", "back"];

    // Apply the camera zoom
    _camera camSetFov -(linearConversion [0.01,2,GVAR(camZoom),-2,-0.01,true]);
    _camera camCommit 0;

    // Agent is switched to in free cam to hide death table and prevent AI chat while allowing icons to draw (also prevents systemChat and unit HUD)
    // (Why is so much stuff tied into the current camera unit BI?!)
    if (isNull GVAR(camAgent)) then {
        GVAR(camAgent) = createAgent ["VirtualMan_F",markerPos QGVAR(respawn),[],0,""];
    };

    GVAR(camAgent) switchCamera "internal";
    clearRadio;
} else {
    _camera = GVAR(unitCamera);

    // When null unit is given choose random
    if (isNull _newUnit) then {
        _newUnit = GVAR(unitList) select floor(random(count GVAR(unitList)));
    };

    // Switch camera view to internal unit view (external uses the camera)
    if (GVAR(camGun)) then {
        _newUnit switchCamera "gunner";
    } else {
        _newUnit switchCamera "internal";
    };

    // Handle camera differently for internal/external view
    if (_newMode == 1) then {
        // Terminate camera view
        _camera cameraEffect ["terminate", "back"];
        GVAR(camHandler) = nil;
    } else {
        // Switch to the camera
        _camera cameraEffect ["internal", "back"];
    };

    // Clear radio if group changed
    if (group _newUnit != group GVAR(camUnit)) then {
        clearRadio;
    };

    GVAR(camUnit) = _newUnit;
};

if (_newMode in [0,2]) then {
    // Set up camera UI
    showCinemaBorder false;
    cameraEffectEnableHUD true;

    // Handle camera movement
    if (isNil QGVAR(camHandler)) then { GVAR(camHandler) = [FUNC(handleCamera), 0] call CBA_fnc_addPerFrameHandler; };

    // If new vision isn't available then keep current (unless current also isn't)
    if !(_newVision in GVAR(availableVisions)) then {
        _newVision = GVAR(availableVisions) select ((GVAR(availableVisions) find GVAR(camVision)) max 0);
    };

    // Vision mode applies to free and external cam
    if (_newVision < 0) then {
        false setCamUseTi 0;
        camUseNVG (_newVision >= -1);
    } else {
        true setCamUseTi _newVision;
    };
    GVAR(camVision) = _newVision;
};

GVAR(camMode) = _newMode;
