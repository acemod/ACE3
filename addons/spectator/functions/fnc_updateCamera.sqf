#include "script_component.hpp"

params [["_newMode",GVAR(camMode)],["_newUnit",GVAR(camUnit)]];

// Reset gun cam if mode is changing
if (_newMode != GVAR(camMode)) then {
    GVAR(gunCam) = false;
    GVAR(camMode) = _newMode;
};

// When no units available to spectate, exit to freecam
if (GVAR(unitList) isEqualTo []) then {
    GVAR(camMode) = 0;
    GVAR(camUnit) = objNull;
};

if (GVAR(camMode) == 0) then { // Free
    // Preserve camUnit value for consistency when manually changing view
    GVAR(camera) cameraEffect ["internal", "back"];

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

    if (GVAR(camMode) == 1) then { // Internal
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
