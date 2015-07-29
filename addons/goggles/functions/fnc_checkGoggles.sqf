/*
 * Author: Garth 'L-H' de Wet
 * Performs rain checks and checks to see whether goggle effects have been applied or not.
 * Checks for external camera and removes effects.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

_unit = GETUNIT;

// Detect if curator interface is open and disable effects
if !(isNull curatorCamera) exitWith {
    if (GVAR(effectsActive)) then {
        [] call FUNC(removeGlassesEffect);
    };
};

[] call DFUNC(checkGlasses);

if !([_unit] call FUNC(isGogglesVisible)) exitWith {
    if (GVAR(effectsActive)) then {
        [] call FUNC(removeGlassesEffect);
    };
};

if ([] call FUNC(externalCamera)) exitWith {
    if (GVAR(effectsActive)) then {
        [] call FUNC(removeGlassesEffect);
    };
};

if !(GVAR(effectsActive)) then {
    [_unit, goggles _unit] call FUNC(applyGlassesEffect);
} else {
    if ([goggles _unit] call FUNC(isDivingGoggles) && {underwater _unit}) then {
        [] call FUNC(removeRainEffect);
        [] call FUNC(removeDirtEffect);
        [] call FUNC(removeDustEffect);
    };
};
