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

_worldPosition params ["_posX", "_posY", "_posZ"];
_direction params ["_dirX", "_dirY", "_dirZ"];

private _dPnt = [_posX + __DR * _dirX, _posY + __DR * _dirY, _posZ + __DR * _dirZ];

private _mines = nearestObjects [_dPnt, _detectableTypes, _radius];
if (_mines isEqualTo []) exitwith {
    [false, objNull, -1];
};

// guaranteed to have at least one element. Lets get the first
private _mine = _mines select 0;
private _distance = _dPnt distance _mine;

private _isDetectable = getNumber (configFile >> "CfgVehicles" >> typeOf _mine >> QGVAR(detectable));

[(_isDetectable > 0), _mine, _distance];
