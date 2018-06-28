/*
 * Author: Orbis2358
 * Splint Treatment local callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [medic, patient, "SelectionName"] call ace_medical_fnc_treatmentSAMSplintLocal
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target", "_item", "_selectionName"];

//If we're not already tracking vitals, start:
[_target] call FUNC(addVitalLoop);

private _part = [_selectionName] call FUNC(selectionNameToNumber);

private _sam = _target getVariable [QGVAR(orbis_samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];

_sam set [_part, [CBA_missionTime, _damage select _part]];
_dagage set [_part, 0];
_target setVariable [QGVAR(orbis_samSplint), _sam, true];
_target setVariable [QGVAR(bodyPartStatus), _dagage, true];

[_target] call FUNC(handleDamage_advancedSetDamage);

private _time = 480 + (CBA_missionTime random 240);
[{_this call orbis_fnc_treatmentSAMSplintTimeout}, [_target, _part, CBA_missionTime], _time] call CBA_fnc_waitAndExecute;
