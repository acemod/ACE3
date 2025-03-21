#include "..\script_component.hpp"
/*
 * Author: Glowbal, LinkIsGrim
 * Calculates fluid intake and consumes unit's IVs.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (IVs) <BOOL>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1, true] call ace_medical_vitals_fnc_consumeIVs
 *
 * Public: No
 */

params ["_unit", "_deltaT", "_syncValues"];

private _ivBags = _unit getVariable [QEGVAR(medical,ivBags), []];

if (_ivBags isEqualTo []) exitWith {0};

private _tourniquets = GET_TOURNIQUETS(_unit);
private _bloodVolumeChange = 0;
private _consumedIVs = [];

{
    _x params ["_bagVolumeRemaining", "_type", "_bodyPartIndex", "_treatment", "_rateCoef", "_item"];

    if (_tourniquets select _bodyPartIndex > 0) then {
        continue
    };

    private _bagChange = (_deltaT * EGVAR(medical,ivFlowRate) * IV_CHANGE_PER_SECOND * _rateCoef) min _bagVolumeRemaining; // absolute value of the change in milliliters
    _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
    _consumedIVs pushBack [_type, _treatment, _bagChange, _item];

    if (_type in ["Blood", "Plasma", "Saline"]) then {
        _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 1000);
    };

    if (_bagVolumeRemaining >= 0.01) then {
        _x set [0, _bagVolumeRemaining];
    } else {
        _ivBags deleteAt _forEachIndex;
    };
} forEachReversed _ivBags;

[QEGVAR(medical,consumedIVs), [_unit, _consumedIVs]] call CBA_fnc_localEvent;

if (_ivBags isEqualTo []) then {
    _unit setVariable [QEGVAR(medical,ivBags), nil, true];
} else {
    _unit setVariable [QEGVAR(medical,ivBags), _ivBags, _syncValues];
};

_bloodVolumeChange // return
