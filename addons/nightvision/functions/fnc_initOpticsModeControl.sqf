#include "script_component.hpp"
/*
 * Author: commy2
 * Stores latest optics mode control in array for FUNC(isUsingOptic) and flushes null controls.
 *
 * Arguments:
 * 0: Optics mode helper control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_nightvision_fnc_initOpticsModeControl
 *
 * Public: No
 */

params ["_control"];

if (isNil QGVAR(OpticsModeControls)) then {
    GVAR(OpticsModeControls) = [];
};

GVAR(OpticsModeControls) = GVAR(OpticsModeControls) select {!isNull _x};
GVAR(OpticsModeControls) pushBack _control
