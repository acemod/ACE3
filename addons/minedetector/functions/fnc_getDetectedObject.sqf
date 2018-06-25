#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the distance to the nearest detectable object
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Configuration <ARRAY>
 *
 * Return Value:
 * [isDetected <BOOL>, mine <OBJECT>, distance <NUMBER>] <ARRAY>
 *
 * Example:
 * [ace_player, DETECTOR_CONFIG] call ace_minedetector_fnc_getDetectedObject
 *
 * Public: No
 */

params ["_unit", "_detectorConfig"];
_detectorConfig params ["", "_radius"];

private _worldPosition = _unit modelToWorld (_unit selectionPosition "granat");
private _ref = (_unit weaponDirection currentWeapon _unit) call EFUNC(common,createOrthonormalReference);
_ref params ["_v1", "_v2", "_v3"];
private _detectorPointAGL = _worldPosition vectorAdd
                                (_v1 vectorMultiply ( 0.9 * __DR)) vectorAdd
                                (_v2 vectorMultiply (-0.2 * __DR)) vectorAdd
                                (_v3 vectorMultiply ( 0.4 * __DR));

private _nearestObjects = nearestObjects [_detectorPointAGL, [], _radius];

#ifdef DEBUG_MODE_FULL
GVAR(debugDetector) = [_detectorPointAGL, _nearestObjects];
#endif

private _isDetectable = false;
private _mine = objNull;
private _distance = -1;

{
    private _objectType = typeOf _x;

    _isDetectable = GVAR(detectableClasses) getVariable _objectType;
    if (isNil "_isDetectable" || {(getModelInfo _x) select 0 == "empty.p3d"}) then {
        _isDetectable = false;
    };

    // If a nun-null object was detected exit the search
    if (_isDetectable && {!isNull _x}) exitWith {
        _distance = _detectorPointAGL distance _x;
        _mine = _x;
        TRACE_3("return", _isDetectable, _mine, _distance);
    };
} forEach _nearestObjects;

[_isDetectable, _mine, _distance];
