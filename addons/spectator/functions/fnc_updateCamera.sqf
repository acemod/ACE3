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
};

if (GVAR(camMode) == 0) then { // Free
    GVAR(camera) cameraEffect ["internal", "back"];

    GVAR(camUnit) = GVAR(camera);

    // HUD stuff
    showCinemaBorder false;
    cameraEffectEnableHUD false;
} else {
    // First ensure valid unit is selected
    if !(_newUnit in GVAR(unitList)) then {
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
    cameraEffectEnableHUD true;
};
