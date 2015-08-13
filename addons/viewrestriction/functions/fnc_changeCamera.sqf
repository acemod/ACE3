/*
 * Author: Jonpas
 * Change camera based on setting.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewrestriction_fnc_changeCamera
 *
 * Public: No
 */
#include "script_component.hpp"

if (!call FUNC(canChangeCamera)) exitWith {};

TRACE_1("View Restricted",GVAR(mode));

// FirstPerson
if (GVAR(mode) == 1) exitWith {
    cameraOn switchCamera "Internal";
};

// ThirdPerson
if (GVAR(mode) == 2) exitWith {
    cameraOn switchCamera "External";
};

// Selective
if (GVAR(mode) == 3) exitWith {
    call FUNC(selectiveChangeCamera);
};
