/*
 * Author: commy2
 * Read laser distance measurement from engine.
 *
 * Argument:
 * 0: Measurement Accuracy (default: 1) <NUMBER>
 * 1: Maximum measure distance (default: 5000) <NUMBER>
 * 2: Minimum measure distance (default: 0) <NUMBER>
 *
 * Return value:
 * Measured distance <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_accuracy",1], ["_maxDistance",5000], ["_minDistance",0]];

disableSerialization;
private _dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

private _distance = parseNumber ctrlText (_dlgRangefinder displayCtrl 151);

if (isNil "_distance" || {_distance == 0}) then {
    _distance = _this call EFUNC(common,getTargetDistance);
} else {
    if (_distance > _maxDistance) then {
        _distance = _maxDistance;
    };

    if (_distance < _minDistance) then {
        _distance = _minDistance;
    };

    _accuracy = if(_accuracy < 1) then {1} else {_accuracy};
    _distance = (round (_distance/_accuracy)) * _accuracy;
};

_distance
