#include "script_component.hpp"

GVAR(camera) camSetFOV GVAR(camFOV);

if (GVAR(camMode) == 0) then { // Free
    GVAR(camera) cameraEffect ["internal", "back"];
} else {
    // When no units available to spectate, exit to freecam
    if (unitList isEqualTo []) exitWith {
        GVAR(camMode) = 0;
        call FUNC(updateView);
    };

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
};

