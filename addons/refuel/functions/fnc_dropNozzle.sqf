#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Detaches the fuel nozzle, drops it and removes player variables.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Nozzle <OBJECT>
 * 2: Disconnect Only <BOOL> (default: false)
 * 3: Ground position to drop to (default: nozzle's current position)
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

// Remove claim on nozzle
[objNull, _nozzle] call EFUNC(common,claim);

if (!isNull _unit) then {
    _unit setVariable [QGVAR(isRefueling), false];
    _unit setVariable [QGVAR(nozzle), objNull, true];
};

if (_disconnectOnly) exitWith {};
_nozzle setVelocity [0, 0, 0];

private _nozzlePosition = getPosASL _nozzle;
private _startPosition = param [3, _nozzlePosition];
private _posA = _startPosition vectorAdd [0, 0, 0.05];
private _posB = _startPosition vectorAdd [0, 0, -((_nozzle getVariable [QGVAR(source), objNull]) getVariable [QGVAR(hoseLength), GVAR(hoseLength)])];
private _intersections = lineIntersectsSurfaces [_posA, _posB, _unit, _nozzle, true, 3, "ROADWAY", "GEOM"];
TRACE_1("",_intersections);
private _groundPosition = [];
if (_intersections isNotEqualTo []) then {
    private _index = _intersections findIf {!((_x select 2) isKindOf QGVAR(fuelHoseSegment)) && {!((_x select 2) isKindOf "CAManBase")}};

    if (_index != -1) then {
        _groundPosition = ((_intersections select _index) select 0) vectorAdd [0, 0, 0.005];
    };
};

if (_groundPosition isEqualTo []) then {
    WARNING_1("no ground intersections for nozzle drop @ %1",_nozzlePosition);
    if (!isNull _unit) then {
        _groundPosition = getPosASL _unit; // place at unit's feet
    } else {
        _groundPosition set [2, (getTerrainHeightASL _nozzlePosition) + 0.005];
    };
};

_nozzle setPosASL _groundPosition;
TRACE_1("finalPos",getPosATL _nozzle);
