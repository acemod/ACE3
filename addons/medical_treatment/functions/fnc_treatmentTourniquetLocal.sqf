/*
 * Author: Glowbal
 * Apply a tourniquet to the patient, local callback.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Item used classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_tourniquetItem", "_selectionName"];

//If we're not already tracking vitals, start:
[_target] call EFUNC(medical,addVitalLoop);

private _part = [_selectionName] call EFUNC(medical,selectionNameToNumber);

// Place a tourniquet on the bodypart
private _tourniquets = _target getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]];
_tourniquets set [_part, CBA_missionTime];
_target setVariable [QEGVAR(medical,tourniquets), _tourniquets, true];
