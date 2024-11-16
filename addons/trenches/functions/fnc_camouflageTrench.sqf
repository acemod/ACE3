#include "..\script_component.hpp"
/*
 * Author: Cyruz
 * Apply surfaceTexture to a completed trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_camouflageTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];

_unit playActionNow "PutDown";

[{
    _this setObjectTextureGlobal [0, surfaceTexture getPosATL _this];
    _this setVariable [QGVAR(camouflaged), true, true];
}, _trench, 2] call CBA_fnc_waitAndExecute;
