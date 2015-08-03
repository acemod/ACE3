/*
 * Author: esteldunedain
 *
 * Add line to draw on debug
 *
 * Argument:
 * 0: Start point ASL (Array)
 * 1: End point ASL (Array)
 * 2: Color (Array)
 *
 * Return value:
 *
 */
#include "script_component.hpp"

if (isNil QGVAR(debugLines)) then {
    GVAR(debugLines) = [];
    GVAR(debugLinesIndex) = 0;
};

if (count GVAR(debugLines) < 100) then {
    GVAR(debugLines) pushBack _this;
    GVAR(debugLinesIndex) = 0;
} else {
    GVAR(debugLines) set [GVAR(debugLinesIndex), _this];
    GVAR(debugLinesIndex) = (GVAR(debugLinesIndex) + 1) mod 100;
};

if (isNil QGVAR(debugDrawHandler)) then {
    GVAR(debugDrawHandler) = addMissionEventHandler ["Draw3D", {
        if (count GVAR(debugLines) == 0) exitWith {
            removeMissionEventHandler ["Draw3D", GVAR(debugDrawHandler)];
            GVAR(debugDrawHandler) = nil;
        };

        {
            _p0 = _x select 0;
            if (!surfaceIsWater _p0) then {
                _p0 = ASLtoATL _p0;
            };
            _p1 = _x select 1;
            if (!surfaceIsWater _p1) then {
                _p1 = ASLtoATL _p1;
            };
            drawLine3D [_p0, _p1, _x select 2];
        } forEach GVAR(debugLines);
    }];
};
