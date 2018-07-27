/*
 * Author: Orbis2358
 * Check if can treat Splint
 *
 * Arguments:
 * 1: The caller <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [caller, patient, "SelectionName"] call ace_medical_fnc_canTreatSAMSplint
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_part"];

if !(_part isEqualType 0) then {
    _part = [_part] call FUNC(selectionNameToNumber);
};

private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _hasDamage = (_damage select _part) > 0;

private _sam = _target getVariable [QGVAR(samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _hasSAM = ((_sam select _part) select 0) > 0;

private _tourniquets = _target getVariable [QGVAR(tourniquets), [0, 0, 0, 0, 0, 0]];
private _hasTourniquet = (_tourniquets select _part) != 0;

private _openWounds = _target getVariable [QGVAR(openWounds), []];
private _bleedingWound = {((_x select 2) isEqualTo _part) && ((_x select 4) * (_x select 3) > 0)} count _openWounds > 0;

(_hasDamage && !_hasSAM && (_hasTourniquet || !_bleedingWound))
