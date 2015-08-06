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

if (_newMode == 0) then { // Free
    // Preserve camUnit value for consistency when manually changing view
    GVAR(camera) cameraEffect ["internal", "back"];
    showCinemaBorder false;
    cameraEffectEnableHUD true;

    // Apply the camera zoom
    GVAR(camera) camSetFov -(linearConversion [0.01,2,GVAR(camZoom),-2,-0.01,true]);
    GVAR(camera) camCommit 0;

    // Agent is switched to in free cam to hide death table and prevent AI chat while allowing icons to draw
    // However, map click events don't fire in free cam for some reason...
    // (Why is so much stuff tied into the current camera unit BI?!)
    if (isNull GVAR(camAgent)) then {
        GVAR(camAgent) = createAgent ["VirtualMan_F",markerPos QGVAR(respawn),[],0,""];
    };

    GVAR(camAgent) switchCamera "internal";
    clearRadio;

    // If new vision isn't available then keep current (unless current also isn't)
    if !(_newVision in GVAR(availableVisions)) then {
        _newVision = GVAR(availableVisions) select ((GVAR(availableVisions) find GVAR(camVision)) max 0);
    };

    // Vision mode only applies to free cam
    if (_newVision < 0) then {
        false setCamUseTi 0;
        camUseNVG (_newVision >= -1);
    } else {
        true setCamUseTi _newVision;
    };
    GVAR(camVision) = _newVision;

    // Handle camera movement
    if (isNil QGVAR(camHandler)) then { GVAR(camHandler) = [FUNC(handleCamera), 0] call CBA_fnc_addPerFrameHandler; };

    // Handle unit icons
    if (GVAR(unitIcons)) then {
        if (isNil QGVAR(iconHandler)) then { GVAR(iconHandler) = [FUNC(handleIcons), 0] call CBA_fnc_addPerFrameHandler; };
    };
} else {
    // When null unit is given choose random
    if (isNull _newUnit) then {
        _newUnit = GVAR(unitList) select floor(random(count GVAR(unitList)));
    };

    if (_newMode == 1) then { // Internal
        // Handle gun cam
        if (GVAR(camGun)) then {
            _newUnit switchCamera "gunner";
        } else {
            _newUnit switchCamera "internal";
        };
    } else { // External
        _newUnit switchCamera "external";
    };

    // Clear radio if group changed
    if (group _newUnit != group GVAR(camUnit)) then {
        clearRadio;
    };

    GVAR(camUnit) = _newUnit;

    // Terminate camera view
    GVAR(camera) cameraEffect ["terminate", "back"];
    GVAR(camHandler) = nil;
    GVAR(iconHandler) = nil;
    cameraEffectEnableHUD true;
};

GVAR(camMode) = _newMode;
