#include "script_component.hpp"
/*
 * Author: xrufix, Glowbal
 * Handle set AimCoef calls. Will use the highest available setting.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Unique ID <STRING>
 * 2: Aim coefficient (a higher value causes more shaking) <NUMBER>
 * 3: Add (true) or remove (false) <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_advanced_fatigue", 1, true] call ace_common_fnc_setAimCoef
 *
 * Public: Yes
 */

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
