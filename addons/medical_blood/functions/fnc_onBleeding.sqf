#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Handles periodically creating blood for a bleeding unit.
 * Called from the medical_blood state machine.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_blood_fnc_onBleeding
 *
 * Public: No
 */

params ["_unit"];

// Nothing to do if unit is not bleeding
if !(_unit call FUNC(isBleeding)) exitWith {};

// Don't bleed on the ground if in a vehicle
if (!isNull objectParent _unit && {!(vehicle _unit isKindOf "StaticWeapon")}) exitWith {};

if (CBA_missionTime > (_unit getVariable [QGVAR(nextTime), -10])) then {
    private _bloodLoss = ([damage _unit * 2, GET_BLOOD_LOSS(_unit) * 2.5] select GETEGVAR(medical,enabled,false)) min 6;
    _unit setVariable [QGVAR(nextTime), CBA_missionTime + 8 + random 2 - _bloodLoss];

    TRACE_2("Creating blood drop for bleeding unit",_unit,_bloodLoss);

    private _position = getPosASL _unit;
    _position = _position vectorAdd [random 0.4 - 0.2, random 0.4 - 0.2, 0];
    _position set [2, 0];

    private _bloodDrop = ["blooddrop_1", "blooddrop_2", "blooddrop_3", "blooddrop_4"] select floor (_bloodLoss min 3);
    [_bloodDrop, _position, _unit] call FUNC(createBlood);
};
