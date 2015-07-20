/*
 * Author: SilentSpike
 * Transitions the spectator camera view mode/unit
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 * 1: Camera unit <OBJECT>
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

params [["_newMode",GVAR(camMode)],["_newUnit",GVAR(camUnit)]];

// When no units available to spectate, exit to freecam
if (GVAR(unitList) isEqualTo []) then {
    _newMode = 0;
    _newUnit = objNull;
};

// Reset gun cam if not internal
if (_newMode != 1) then {
    GVAR(gunCam) = false;
};

if (_newMode == 0) then { // Free
    // Preserve camUnit value for consistency when manually changing view
    GVAR(camera) cameraEffect ["internal", "back"];

    // Switch to player to stop AI group chat
    ACE_Player switchCamera "internal";
    clearRadio;

    // HUD stuff
    showCinemaBorder false;
    cameraEffectEnableHUD false;

    // Handle camera movement
    if (isNil QGVAR(camHandler)) then { GVAR(camHandler) = [FUNC(handleCamera), 0] call CBA_fnc_addPerFrameHandler; };
} else {
    // When null unit is given choose random
    if (isNull _newUnit) then {
        _newUnit = GVAR(unitList) select floor(random(count GVAR(unitList)));
    };

    if (_newMode == 1) then { // Internal
        // Handle gun cam
        if (GVAR(gunCam)) then {
            _newUnit switchCamera "gunner";
        } else {
            _newUnit switchCamera "internal";
        };
    } else { // External
        _newUnit switchCamera "external";
    };

    GVAR(camUnit) = _newUnit;

    // Terminate camera view
    GVAR(camera) cameraEffect ["terminate", "back"];
    GVAR(camHandler) = nil;
    cameraEffectEnableHUD true;
};

GVAR(camMode) = _newMode;
