#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Get drone's target location, if aimed at infinity it will return a virtual point
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * [PosASL <ARRAY>, Real <BOOL>]
 *
 * Example:
 * [v] call ace_aircraft_fnc_droneGetTurretTargetPos
 *
 * Public: No
 */

params ["_vehicle"];
private _turret = [0];
TRACE_2("droneGetTurretTargetPos",_vehicle,_turret);

private _turretConfig = [_vehicle, _turret] call CBA_fnc_getTurret;

private _gunBeg = _vehicle selectionPosition getText (_turretConfig >> "gunBeg");
private _gunEnd = _vehicle selectionPosition getText (_turretConfig >> "gunEnd");

if (_gunEnd isEqualTo _gunBeg) then {
    // e.g. Darter doesn't have valid gunBeg/gunEnd
    private _vehicleConfig = configOf _vehicle;
    _gunBeg = _vehicle selectionPosition getText (_vehicleConfig >> "uavCameraGunnerDir");
    _gunEnd = _vehicle selectionPosition getText (_vehicleConfig >> "uavCameraGunnerPos");
};

_gunBeg = AGLToASL (_vehicle modelToWorld _gunBeg);
_gunEnd = AGLToASL (_vehicle modelToWorld _gunEnd);
private _turretDir = _gunEnd vectorFromTo _gunBeg;
private _farPoint = _gunEnd vectorAdd (_turretDir vectorMultiply 4999);

private _intersections = lineIntersectsSurfaces [_gunEnd, _farPoint, _vehicle, objNull, true, 1];
if (_intersections isNotEqualTo []) then {
    [_intersections select 0 select 0, true]
} else {
    // Not looking at anything, just get a virtual point where the camera is pointing
    _farPoint set [2, 0 max getTerrainHeightASL _farPoint];
    [_farPoint, false]
};
