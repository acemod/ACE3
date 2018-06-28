/*
 * Author: Orbis2358
 * Splint timeout check
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: SelectionName <STRING>
 * 2: The time SAM Splint was applied <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [patient, "SelectionName", CBA_missionTime] call ace_medical_fnc_treatmentSAMSplintTimeout
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target", "_part", "_timeOld"];

private _splint = _target getVariable [QGVAR(samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];

if (_splint select _part select 0 isEqualTo _timeOld) then {
    private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
    _damage set [_part, (_damage select _part) + (_splint select _part select 1)];
    _splint = _splint set [_part, [0, 0]];
    _target setVariable [QGVAR(bodyPartStatus), _damage, true];
    _target setVariable [QGVAR(samSplint), _splint, true];
};

[_target] call FUNC(handleDamage_advancedSetDamage);
