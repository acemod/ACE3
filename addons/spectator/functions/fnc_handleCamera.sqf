#include "script_component.hpp"

// Update camera values
GVAR(camera) camSetFov GVAR(camFOV);

// Commit changes
GVAR(camera) camCommit 0;
showCinemaBorder false;
cameraEffectEnableHUD true;

// If valid unit then apply camera view as appropriate
if ((GVAR(camUnit) in GVAR(unitList)) && !isNull GVAR(camUnit)) then {
    if (camMode == 1) then {
        GVAR(camUnit) switchCamera "internal";
    } else {
        GVAR(camera) camSetTarget GVAR(camUnit);
    };
};

// Don't recreate the PFH
if !(isNil QGVAR(camPFH)) exitWith {};

// Constantly handle camera manipulation
GVAR(camPFH) = [
{
    // Kill PFH when display is closed
    if (isNull (GETUVAR(GVAR(display),displayNull))) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; GVAR(camPFH) = nil; };

    // Different behaviour based on camera mode
    switch (GVAR(camMode)) do {
        case 0: { // Free
            _oldPos = getPosASL GVAR(camera);
            _mX = 0;
            _mY = 0;
            _mZ = 0;
            if (GVAR(camDolly) select 0) then { // Forward
                _mY = _mY + GVAR(camSpeed);
            };
            if (GVAR(camDolly) select 1) then { // Backward
                _mY = _mY - GVAR(camSpeed);
            };
            if (GVAR(camDolly) select 2) then { // Left
                _mX = _mX - GVAR(camSpeed);
            };
            if (GVAR(camDolly) select 3) then { // Right
                _mX = _mX + GVAR(camSpeed);
            };
            if (GVAR(camBoom) select 0) then { // Up
                _mZ = _mZ + 0.5;
            };
            if (GVAR(camBoom) select 1) then { // Down
                _mZ = _mZ - 0.5;
            };

            _pan = (GVAR(camPan) + 360) % 360;
            _x = (_oldPos select 0) + (_mX * cos(_pan)) + (_mY * sin(_pan));
            _y = (_oldPos select 1) - (_mX * sin(_pan)) + (_mY * cos(_pan));
            _z = (_oldPos select 2) + _mZ;

            // Prevent camera going under terrain
            GVAR(camPos) = [_x,_y,_z max (getTerrainHeightASL [_x,_y])];

            // Update camera position and rotation
            GVAR(camera) setPosASL GVAR(camPos);
            GVAR(camera) setDir GVAR(camPan);
            [GVAR(camera), GVAR(camTilt), GVAR(camBank)] call BIS_fnc_setPitchBank;
        };
        case 1: { // Internal

        };
    };
}, 0] call CBA_fnc_addPerFrameHandler;
