/*
 * Author: Garth 'L-H' de Wet
 * Performs rain checks and checks to see whether glasses effects have been applied or not.
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
if (!alive ace_player) exitWith {};
// Detect if curator interface is open and disable effects
if (!isNull(findDisplay 312)) exitWith {
    if (GVAR(EffectsActive)) then {
        call FUNC(removeGlassesEffect);
    };
};
call FUNC(checkGlasses); 
if !([ace_player] call FUNC(isGogglesVisible)) exitWith {
    if (GVAR(EffectsActive)) then {
        call FUNC(removeGlassesEffect);
    };
};
if (call FUNC(externalCamera)) exitWith {
    if (GVAR(EffectsActive)) then {
        call FUNC(removeGlassesEffect);
    };
};
if !(GVAR(EffectsActive)) then {
    [goggles ace_player] call FUNC(applyGlassesEffect);
} else {
    if ([goggles ace_player] call FUNC(isDivingGoggles) && {underwater ace_player}) then {
        call FUNC(removeRainEffect);
        call FUNC(removeDirtEffect);
        call FUNC(removeDustEffect);
    };
};
