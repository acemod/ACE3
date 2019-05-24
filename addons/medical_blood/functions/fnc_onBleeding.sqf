#include "script_component.hpp"
/*
 * Author: Glowbal
 * handle bleeding state (state machine)
 *
 * Arguments:
 * 0: unit <TYPE>
 *
 * Return Value:
 * is Bleeding <BOOL>
 *
 * Example:
 * [player] call ace_medical_blood_fnc_onBleeding
 *
 * Public: No
 */

params ["_unit"];

if (!([_unit] call FUNC(isBleeding))) exitWith {};
if (((vehicle _unit) != _unit) && {!((vehicle _unit) isKindOf "StaticWeapon")}) exitWith {}; // Don't bleed on ground if mounted

if (CBA_missionTime > (_unit getVariable [QGVAR(nextTime), -10])) then {
    private _bloodLoss = (if (GVAR(useAceMedical)) then {GET_BLOOD_LOSS(_unit) * 2.5} else {getDammage _unit * 2}) min 6;
    TRACE_2("",_unit,_bloodLoss);
    _unit setVariable [QGVAR(nextTime), CBA_missionTime + 8 + random 2 - _bloodLoss];

    private _position = getPosASL _unit;
    _position = _position vectorAdd [
        random 0.4 - 0.2,
        random 0.4 - 0.2,
        0
    ];
    _position set [2, 0];

    private _bloodDrop = ["blooddrop_1", "blooddrop_2", "blooddrop_3", "blooddrop_4"] select floor (_bloodLoss min 3);
    [_bloodDrop, _position] call FUNC(createBlood);
};
