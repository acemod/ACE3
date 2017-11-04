/*
 * Author: commy2
 * Read laser distance measurement from engine.
 *
 * Arguments:
 * 0: Measurement Accuracy (default: 1) <NUMBER>
 * 1: Maximum measure distance (default: 5000) <NUMBER>
 * 2: Minimum measure distance (default: 0) <NUMBER>
 * 3: Blank display on range error (default: false) <BOOL>
 *
 * Return Value:
 * Measured distance <NUMBER>
 *
 * Example:
 * [5, 6, 7, true] call ace_fcs_fnc_getRange
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_accuracy",1], ["_maxDistance",5000], ["_minDistance",0], ["_blank",false]];

disableSerialization;
private _dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

private _distance = parseNumber ctrlText (_dlgRangefinder displayCtrl 151);

if (_distance == 0) then {
    _distance = _this call EFUNC(common,getTargetDistance);
} else {
    // Is distance out of bound?
    _distance = _distance min _maxDistance;
    _distance = _distance max _minDistance;

    // If don't let accuracy be less than 1
    _accuracy = _accuracy max 1;
    _distance = (round (_distance/_accuracy)) * _accuracy;
};

// Change the display if the range is out of bounds
if (_distance >= _maxDistance || _distance <= _minDistance) then {
    if (_blank) then {
        (_dlgRangefinder displayCtrl 1713151) ctrlSetText "----";
    } else {
        (_dlgRangefinder displayCtrl 1713151) ctrlSetText ([_distance, 4, 0] call CBA_fnc_formatNumber) + "*";
    };
} else {
    (_dlgRangefinder displayCtrl 1713151) ctrlSetText ([_distance, 4, 0] call CBA_fnc_formatNumber);
};

_distance
