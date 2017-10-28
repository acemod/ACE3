/*
 * Author: esteldunedain
 * Add line to draw on debug
 *
 * Arguments:
 * 0: Start point ASL <ARRAY>
 * 1: End point ASL <ARRAY>
 * 2: Color <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0,0,0], [1,1,0], [1,0,0,1]] call ace_common_fnc_addLineToDebugDraw;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_startASL", "_endASL", "_color"];

if (isNil QGVAR(debugLines)) then {
    GVAR(debugLines) = [];
    GVAR(debugLinesIndex) = 0;
};

if (count GVAR(debugLines) < 100) then {
    GVAR(debugLines) pushBack [ASLtoAGL _startASL, ASLtoAGL _endASL, _color];
    GVAR(debugLinesIndex) = 0;
} else {
    GVAR(debugLines) set [GVAR(debugLinesIndex), [ASLtoAGL _startASL, ASLtoAGL _endASL, _color]];
    GVAR(debugLinesIndex) = (GVAR(debugLinesIndex) + 1) mod 100;
};

if (isNil QGVAR(debugDrawHandler)) then {
    GVAR(debugDrawHandler) = addMissionEventHandler ["Draw3D", {
        if (GVAR(debugLines) isEqualTo []) exitWith {
            removeMissionEventHandler ["Draw3D", GVAR(debugDrawHandler)];
            GVAR(debugDrawHandler) = nil;
        };

        {
            _x params ["_start", "_end", "_color"];
            drawLine3D [_start, _end, _color];
        } forEach GVAR(debugLines);
    }];
};
