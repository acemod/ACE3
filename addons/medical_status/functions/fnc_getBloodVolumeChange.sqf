/*
 * Author: Glowbal
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (bloodbags) <BOOL>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1, true] call ACE_medical_status_fnc_getBloodVolumeChange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_deltaT", "_syncValues"];

private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME];
private _bloodVolumeChange = -_deltaT * GET_BLOOD_LOSS(_unit);

if (!isNil {_unit getVariable QGVAR(ivBags)}) then {
    private _bloodBags = _unit getVariable [QGVAR(ivBags), []];
    private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

    _bloodBags = _bloodBags apply {
        _x params ["_bagVolumeRemaining", "_type", "_bodyPart"];

        if (_tourniquets select _bodyPart == 0) then {
            private _bagChange = (_deltaT * EGVAR(medical,ivFlowRate) * IV_CHANGE_PER_SECOND) min _bagVolumeRemaining; // absolute value of the change in miliLiters
            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
            _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 1000);
        };

        if (_bagVolumeRemaining < 0.01) then {
            []
        } else {
            [_bagVolumeRemaining, _type, _bodyPart]
        };
    };

    _bloodBags = _bloodBags - [[]]; // remove empty bags

    if (_bloodBags isEqualTo []) then {
        _unit setVariable [QGVAR(ivBags), nil, true]; // no bags left - clear variable (always globaly sync this)
    } else {
        _unit setVariable [QGVAR(ivBags), _bloodBags, _syncValues];
    };
};

_bloodVolumeChange
