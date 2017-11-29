/*
 * Author: xrufix, Glowbal
 * Handle set AimCoef calls. Will use highest available setting.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: id <STRING>
 * 2: settings <NUMBER>
 * 3: add [true] OR remove [false] (default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player,"ace_advanced_fatigue", 1, true] call ace_common_fnc_setAimCoef
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_id", "_setting", ["_add", true]];

private _exists = false;
private _highestCoef = 1;
private _map = _unit getVariable [QGVAR(setAimCoefMap), []];

_map = _map select {
    _x params ["_xID", "_xSetting"];
    if (_id == _xID) then {
        _exists = true;
        if (_add) then {
            _x set [1, _setting];
            _highestCoef = _highestCoef max _setting;
            true
        } else {
            false
        };
    } else {
        _highestCoef = _highestCoef max _xSetting;
        true
    };
};

if (!_exists && _add) then {
    _highestCoef = _highestCoef max _setting;
    _map pushBack [_id, _setting];
};

// Update the value
_unit setVariable [QGVAR(setAimCoefMap), _map];
_unit setCustomAimCoef _highestCoef;
