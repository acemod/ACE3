/*
 * Author: Garth 'L-H' de Wet, commy2
 * Handles the player dying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (_unit != ACE_player) exitWith {true};

GVAR(PostProcessEyes) ppEffectEnable false;

SETGLASSES(_unit,GLASSESDEFAULT);

call FUNC(removeGlassesEffect);

GVAR(EffectsActive) = false;

_unit setVariable ["ACE_EyesDamaged", false];

[GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
GVAR(DustHandler) = -1;

true
