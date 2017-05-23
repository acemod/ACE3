/*
 * Author: commy2 and esteldunedain
 * Calculate the distance to the first intersection of a line
 *
 * Arguments:
 * 0: Pos ASL of origin (ARRAY>
 * 1: Direction <ARRAY>
 * 2: Max distance to search <Number>
 * 3: Shooter <OBJECT>
 *
 * Return Value:
 * Distance to intersection (999 if distance is greater than max) <NUMBER>
 *
 * Example:
 * [[1823.41,5729.05,6.66627], [-0.953255,0.109689,-0.281554], 15, ace_player] call ace_overpressure_fnc_getDistance
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_posASL", "_direction", "_maxDistance", "_shooter"];
TRACE_4("params",_posASL,_direction,_maxDistance, _shooter);

private _intersections = lineIntersectsSurfaces [_posASL, _posASL vectorAdd (_direction vectorMultiply _maxDistance), _shooter, objNull, true, 99];

TRACE_1("lineIntersectsSurfaces",_intersections);

private _distance = 999;

{
    _x params ["_intersectPosASL", "_surfaceNormal", "_intersectObject"];
    TRACE_3("Intersect",_intersectPosASL,_surfaceNormal,_intersectObject);

    //Hit something solid that can reflect - (Static covers Building)  [Need to manually filter out _shoot for FFV shots]
    if ((isNull _intersectObject) || {(_intersectObject != _shooter) && {(_intersectObject isKindOf "Static") || {_intersectObject isKindOf "AllVehicles"}}}) exitWith {
        _distance = _posASL vectorDistance _intersectPosASL;
        TRACE_3("hit solid object",_distance,_intersectObject,typeOf _intersectObject);

        if (isNull _intersectObject) then {  //Terrain:
            // Calculate the angle between the terrain and the back blast direction
            private _angle = 90 - acos (- (_surfaceNormal vectorDotProduct _direction));
            TRACE_3("Terrain Intersect",_surfaceNormal,_direction,_angle);
            // Angles is below 25deg, no backblast at all
            if (_angle < 25) exitWith {_distance = 999};
            // Angles is below 45deg the distance is increased according to the difference
            if (_angle < 45) exitWith {_distance = _distance * (5 - 4 * sqrt ((_angle - 25)/20))};
            // Angles above 45degcreate full backblast
        };
    };
} forEach _intersections;

_distance
