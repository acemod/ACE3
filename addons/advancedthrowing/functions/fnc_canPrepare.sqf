/*
 * Author: Jonpas
 * Checks if a throwable can be prepared.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Prepare <BOOL>
 *
 * Example:
 * [unit] call ace_advancedthrowing_fnc_canPrepare
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(enabled) || {call EFUNC(common,isFeatureCameraActive)}) exitWith {false};

params ["_unit"];

[_unit, objNull, ["isNotInside", "isNotSitting", "isNotOnLadder"]] call EFUNC(common,canInteractWith)
