/*
 * Author: Jonpas
 * Checks if a throwable can be thrown.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Throw <BOOL>
 *
 * Example:
 * [unit] call ace_advancedthrowing_fnc_canThrow
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Disable throwing from non FFV seats due to surface detection issues
if (!GVAR(inHand) || {!(_unit call CBA_fnc_canUseWeapon)}) exitWith {false};

if (vehicle _unit != _unit) exitWith {
    private _startPos = eyePos _unit;
    private _aimLinePos = AGLToASL (positionCameraToWorld [0, 0, 1]);
    private _intersections = lineIntersectsSurfaces [_startPos, _aimLinePos, _unit, objNull, false];
    //TRACE_1("Intersections",_intersections);

    (_intersections select {(vehicle _unit) in (_x select 3)}) isEqualTo []
};

true
