/*
 * Author: Orbis2358
 * Check if can treat Cast
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: SelectionName <STRING>
 * 2: (Optional) Check bandaged wounds too (default: true) <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [patient, "SelectionName", false] call ace_medical_fnc_canTreatOrthopedicCast
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _target = _this select 0;
private _part = _this select 1;
private _bandagedAlso = param [2, true];

if !(_part isEqualType 0) then {
    _part = [_part] call FUNC(selectionNameToNumber);
};

private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _hasDamage = (_damage select _part) > 0;

private _sam = _target getVariable [QGVAR(orbis_samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _hasSAM = ((_sam select _part) select 0) > 0;

private _openWounds = _target getVariable [QGVAR(openWounds), []];
private _bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];
private _bleedingWound = {((_x select 2) isEqualTo _part) && ((_x select 4) * (_x select 3) > 0)} count ([_openWounds, _openWounds + _bandagedWounds] select _bandagedAlso) > 0;

((_hasDamage || _hasSAM) && !_bleedingWound)
