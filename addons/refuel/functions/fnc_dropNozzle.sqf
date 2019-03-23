#include "script_component.hpp"
/*
 * Author: GitHawk
 * Detaches the fuel nozzle, drops it and removes player variables.
 *
 * Arguments:
 * 0: Unit <OBJECT> (optional)
 * 1: Nozzle <OBJECT>
 * 2: Disconnect Only <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player,  nozzle, false] call ace_refuel_fnc_dropNozzle
 * [objNull, nozzle, false] call ace_refuel_fnc_dropNozzle
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_disconnectOnly", false, [false]]];
TRACE_3("dropNozzle",_unit,_nozzle,_disconnectOnly);

detach _nozzle;
_nozzle setVariable [QGVAR(isRefueling), false, true];

if (_disconnectOnly) exitWith {};
_nozzle setVelocity [0, 0, 0];

private _groundPosition = getPosASL _nozzle;
private _posA = (getPosASL _nozzle) vectorAdd [0,0,0.05];
private _posB = (getPosASL _nozzle) vectorAdd [0,0,-1000];
private _intersections = lineIntersectsSurfaces [_posA, _posB, _unit, _nozzle, true, 1, "GEOM"];
TRACE_1("",_intersections);
if (_intersections isEqualTo []) then {
    _groundPosition set [2, (getTerrainHeightASL _groundPosition) + 0.005];
} else {
    _groundPosition = ((_intersections select 0) select 0) vectorAdd [0,0,0.005];
};
_nozzle setPosASL _groundPosition;
TRACE_1("finalPos",getPosATL _nozzle);

if (isNull _unit) exitWith {};
_unit setVariable [QGVAR(isRefueling), false];
_unit setVariable [QGVAR(nozzle), objNull, true];
