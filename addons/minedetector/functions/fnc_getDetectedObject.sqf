/*
 * Author: Glowbal
 * Enables the mine detector
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

#define __DR 1.3

#include "script_component.hpp"

params ["_unit", "_detectorConfig"];
_detectorConfig params ["_type", "_radius", "_detectableTypes", "_sounds"];

private _worldPosition = _unit modelToWorld (_unit selectionPosition "granat");
private _direction = _unit weaponDirection "Put";

private _detectorPointAGL = _worldPosition vectorAdd (_direction vectorMultiply __DR);

private _mines = nearestObjects [_detectorPointAGL, _detectableTypes, _radius];

#ifdef DEBUG_MODE_FULL
GVAR(debugDetector) = [_detectorPointAGL, _mines];
#endif

private _isDetectable = false;
private _mine = objNull;
private _distance = -1;

{
    //Try all mines in range and use first detectable one:
    if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> QGVAR(detectable))) == 1) exitWith {
        _isDetectable = true;
        _mine = _x;
        _distance = _detectorPointAGL distance _x;
    };
    nil
} count _mines;

TRACE_3("return",_isDetectable, _mine, _distance);

[_isDetectable, _mine, _distance];
