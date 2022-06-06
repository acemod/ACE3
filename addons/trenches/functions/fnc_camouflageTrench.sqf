#include "script_component.hpp"
/*
 * Author: Cyruz
 * Apply surfaceTexture to a completed trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj] call ace_trenches_fnc_camouflageTrench
 *
 * Public: No
 */

params ["_trench"];

_trench setObjectTextureGlobal [0, (surfaceTexture getPosATL _trench)];
_trench setVariable [QGVAR(camouflaged), true, true];
