/*
 * Author: Nelson Duarte, AACO
 * Function used to handle mouse down event
 *
 * Public: No
 */

#include "script_component.hpp"
TRACE_1("Params",_this);

params ["", "_button"];

// Left click
if (_button == 0) exitWith {
    if (isNull GVAR(cursorObject)) then {
        if (!isNull GVAR(camTarget)) then {
            playsound "ReadoutHideClick1";
        };
    } else {
        playsound "ReadoutClick";
        setMousePosition [0.5, 0.5];
    };
    [GVAR(cursorObject)] call FUNC(setFocus);
};

// Right click
if (_button == 1) then {
    if (GVAR(camMode) == MODE_FREE && { !isNull GVAR(camTarget) } && { !isNull (attachedTo GVAR(camDummy)) }) then {
        [] call FUNC(cam_resetTarget);
    };
    GVAR(holdingRMB) = true;
};
