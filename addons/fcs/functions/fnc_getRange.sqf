#include "..\script_component.hpp"
/*
 * Author: commy2
 * Read laser distance measurement from engine.
 *
 * Arguments:
 * 0: Measurement Accuracy <NUMBER> (default: 1)
 * 1: Maximum measure distance <NUMBER> (default: 5000)
 * 2: Minimum measure distance <NUMBER> (default: 0)
 * 3: Blank display on range error <BOOL> (default: false)
 *
 * Return Value:
 * Measured distance <NUMBER>
 *
 * Example:
 * [5, 6, 7, true] call ace_fcs_fnc_getRange
 *
 * Public: No
 */

params [["_accuracy",1], ["_maxDistance",5000], ["_minDistance",0], ["_blank",false]];

disableSerialization;
private _dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

private _distance = parseNumber ctrlText (_dlgRangefinder displayCtrl 151);

if (_distance == 0) then {
    _distance = call EFUNC(common,getTargetDistance);
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
