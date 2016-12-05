/*
 * Author: Glowbal
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Global Sync Values (bloodbags) <BOOL>
 *
 * ReturnValue:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_syncValues"];

private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME];
private _bloodVolumeChange = -(_unit call FUNC(getBloodLoss));

if (!isNil {_unit getVariable QGVAR(ivBags)}) then {
    if (_bloodVolume < DEFAULT_BLOOD_VOLUME) then {
        private _bloodBags = _unit getVariable [QGVAR(ivBags), []];

        _bloodBags = _bloodBags apply {
            _x params ["_bagVolumeRemaining"];

            private _bagChange = IV_CHANGE_PER_SECOND min _bagVolumeRemaining; // absolute value of the change in miliLiters
            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
            _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 1000);

            if (_bagVolumeRemaining < 0.01) then {
                []
            } else {
                [_bagVolumeRemaining];
            };
        };

        _bloodBags = _bloodBags - [[]]; // remove empty bags

        if (_bloodBags isEqualTo []) then {
            _unit setVariable [QGVAR(ivBags), nil, true]; // no bags left - clear variable (always globaly sync this)
        } else {
            _unit setVariable [QGVAR(ivBags), _bloodBags, _syncValues];
        };
    } else {
        _unit setVariable [QGVAR(ivBags), nil, true]; // blood volume = 100% - clear variable (always globaly sync this)
    };
};

_bloodVolumeChange
