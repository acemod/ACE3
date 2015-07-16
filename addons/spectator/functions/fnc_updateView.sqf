#include "script_component.hpp"

params [["_newMode",GVAR(camMode)]];

// Reset gun cam if mode is changing
if (_newMode != GVAR(camMode)) then {
    GVAR(gunCam) = false;
    GVAR(camMode) = _newMode;
};

// When no units available to spectate, exit to freecam
if (GVAR(unitList) isEqualTo []) then {
    GVAR(camMode) = 0;
};

if (GVAR(camMode) == 0) then { // Free
    GVAR(camera) cameraEffect ["internal", "back"];

    // HUD stuff
    showCinemaBorder false;
    cameraEffectEnableHUD false;
} else {
    // First ensure valid unit is selected
    if !(GVAR(camUnit) in GVAR(unitList)) then {
        GVAR(camUnit) = GVAR(unitList) select floor(random(count GVAR(unitList)));
    };

    if (GVAR(camMode) == 1) then { // Internal
        // Handle gun cam
        if (GVAR(gunCam)) then {
            GVAR(camUnit) switchCamera "gunner";
        } else {
            GVAR(camUnit) switchCamera "internal";
        };
    } else { // External
        GVAR(camUnit) switchCamera "external";
    };

    // Terminate camera view
    GVAR(camera) cameraEffect ["terminate", "back"];
    cameraEffectEnableHUD true;
};
