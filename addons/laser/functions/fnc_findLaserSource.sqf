#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Handler function for finding position and direction of a vanilla laser.
 *
 * Arguments:
 * 0: Vehicle (shooter of laser) <OBJECT>
 * 6: Method Args <ARRAY>
 *      0: Laser Source selection on Vehicle <STRING>
 *
 * Return Value:
 * [position, direction] <ARRAY>
 *
 * Example:
 * [player, x,x,x,x,x, ["pilot"]] call ace_laser_fnc_findLaserSource;
 *
 * Public: No
 */

params ["_vehicle", "", "", "", "", "", "_methodArgs"];
_methodArgs params ["_ownerSelection"];

// Get the laser target object stored in the unit
private _targetObject = _vehicle getVariable [QGVAR(targetObject), objNull];
private _targetPos = getPosASL _targetObject;
if (surfaceIsWater _targetPos && {(_targetPos select 2) < 0}) then {
    // Vanilla lasers seem to give position at ocean floor heigh, even though the x and y are correct??
    _targetPos set [2, 0.25];
};

private _povPos = _vehicle modelToWorldVisualWorld (_vehicle selectionPosition _ownerSelection);
private _povDir = _povPos vectorFromTo _targetPos;

TRACE_4("",_vehicle,_targetObject,_povPos,_povDir);

if(isNil "_povPos" || isNil "_povDir") exitWith {
    WARNING_2("bad data [%1][%2]",_povPos,_povDir);
    [-1,-1]
};

[_povPos, _povDir]
