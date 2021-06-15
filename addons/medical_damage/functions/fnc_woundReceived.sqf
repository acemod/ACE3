#include "script_component.hpp"
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
 * [_target, [[0.5, "LeftLeg"]], _shooter, "B_65x39_Caseless"] call ace_medical_damage_fnc_woundReceived
 *
 * Public: No
 */
params ["_unit", "_allDamages", "", "_ammo"];

private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
if (_typeOfDamage in GVAR(damageTypeDetails)) then {
    (GVAR(damageTypeDetails) get _typeOfDamage) params ["", "_selectionSpecific", "_woundsHandler", ""];
    private _handlerFnc = missionNamespace getVariable [_woundsHandler, FUNC(defaultWoundHandler)];

    if (_selectionSpecific > 0) then {
        _allDamages = [_allDamages select 0];
    };
    [_unit, _allDamages, _typeOfDamage] call _handlerFnc;
};