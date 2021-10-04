#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Adds an entry to the unit's triage card.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_morphine"] call ace_medical_treatment_fnc_addToTriageCard
 *
 * Public: No
 */

params ["_unit", "_item"];

if (!local _unit) exitWith {
    [QGVAR(addToTriageCard), _this, _unit] call CBA_fnc_targetEvent;
};

private _triageCard = _unit getVariable [QEGVAR(medical,triageCard), []];
private _index = _triageCard findIf {_x select 0 == _item};

if (_index == -1) then {
    _triageCard pushBack [_item, 1, CBA_missionTime];
} else {
    _triageCard set [_index, [_item, (_triageCard select _index select 1) + 1, CBA_missionTime]];
};

_unit setVariable [QEGVAR(medical,triageCard), _triageCard, true];

// todo: add amount of item to event args?
["ace_triageCardItemAdded", [_unit, _item]] call CBA_fnc_localEvent;
