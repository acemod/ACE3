#include "..\script_component.hpp"
/*
 * Author: Pterolatypus
 * Handle woundReceived event and pass to individual wound handlers
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Shooter <OBJECT>
 * 3: Ammo classname or damage type <STRING>
 *
 * ReturnValue:
 * None
 *
 * Example:
 * [_target, [[0.5, "LeftLeg", 1]], _shooter, "B_65x39_Caseless"] call ace_medical_damage_fnc_woundReceived
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_shooter", "_ammo"];

private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
if (_typeOfDamage in GVAR(damageTypeDetails)) then {
    (GVAR(damageTypeDetails) get _typeOfDamage) params ["", "", "_woundHandlers"];

    private _damageData = [_unit, _allDamages, _typeOfDamage];
    {
        _damageData = _damageData call _x;
        TRACE_1("Wound handler returned",_damageData);
        if !(_damageData isEqualType [] && {(count _damageData) >= 3}) exitWith {
            TRACE_1("Return invalid, terminating wound handling",_damageData);
        };
    } forEach _woundHandlers;
};
