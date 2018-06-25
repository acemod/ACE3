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
 * [UNIT] call ace_medical_blood_fnc_onBleeding
 *
 * Public: No
 */

params ["_unit"];

if (((vehicle _unit) != _unit) && {!((vehicle _unit) isKindOf "StaticWeapon")}) exitWith {}; // Don't bleed on ground if mounted

private _lastTime = _unit getVariable [QGVAR(lastTime), -10];
private _bloodLoss = (if (GVAR(useAceMedical)) then {([_unit] call EFUNC(medical,getBloodLoss)) * 2.5} else {getDammage _unit * 2}) min 6;

if ((CBA_missionTime - _lastTime) + _bloodLoss >= 8 + random 2) then {
    _unit setVariable [QGVAR(lastTime), CBA_missionTime];

    private _position = getPosASL _unit;
    _position = _position vectorAdd [
        random 0.4 - 0.2,
        random 0.4 - 0.2,
        0
    ];
    _position set [2, 0];

    private _bloodDrop = ["blooddrop_1", "blooddrop_2", "blooddrop_3", "blooddrop_4"] select floor (_bloodLoss min 3);
    [_bloodDrop, _position, getDir _unit] call FUNC(createBlood);
};
