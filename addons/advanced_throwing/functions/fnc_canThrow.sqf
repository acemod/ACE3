#include "..\script_component.hpp"
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
 * [unit] call ace_advanced_throwing_fnc_canThrow
 *
 * Public: No
 */

params ["_unit"];

if !(_unit getVariable [QGVAR(inHand), false]) exitWith {false};

if (!isNull objectParent _unit) exitWith {
    private _startPos = eyePos _unit;
    private _aimLinePos = AGLToASL (positionCameraToWorld [0, 0, 1]);
    private _intersections = lineIntersectsSurfaces [_startPos, _aimLinePos, _unit, objNull, false];
    //TRACE_1("Intersections",_intersections);

    (_intersections select {(vehicle _unit) in (_x select 3)}) isEqualTo []
};

true
