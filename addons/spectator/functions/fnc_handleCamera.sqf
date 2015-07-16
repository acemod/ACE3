/*
 * Author: SilentSpike
 * Handles camera manipulation according to input
 *
 * Arguments:
 * None <NIL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleCamera, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

// Kill PFH when display is closed
if (isNull (GETUVAR(GVAR(display),displayNull))) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

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
        // Update view when state of unit changes
        if !(
            (alive GVAR(camUnit)) &&
            {vehicle GVAR(camUnit) == GVAR(camUnit)} &&
            {GVAR(camUnit) in GVAR(unitList)}
        ) then {
            call FUNC(updateView);
        };
    };
};
