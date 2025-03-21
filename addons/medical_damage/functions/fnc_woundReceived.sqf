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

if !(_typeOfDamage in GVAR(damageTypeDetails)) exitWith {};

(GVAR(damageTypeDetails) get _typeOfDamage) params ["", "", "_woundHandlers"];
if (_woundHandlers isEqualTo []) exitWith {};

private _damageData = [_unit, _allDamages, _typeOfDamage, _ammo];
private _originalCount = count _damageData;
private _lastHandlerName = _woundHandlers select -1 select 0; // will usually be ace_medical_damage_woundsHandlerBase

{
    _x params ["_handlerName", "_handlerCode"];
    _damageData = _damageData call _handlerCode;
    TRACE_2("Wound handler returned",_damageData,_handlerName);

    // Done
    if (_handlerName == _lastHandlerName) then {
        break;
    };

    if ((count _damageData) == (_originalCount - 1)) then {
        ERROR_1("Wound handler '%1' missing latest param in return, readding. This will be deprecated in the future, check Medical Framework wiki.",_handlerName);
        _damageData pushBack _ammo;
    };

    // If invalid return and not the last handler, log an error and exit
    if (isNil "_damageData" || {!(_damageData isEqualType [])} || {(count _damageData) < _originalCount}) then {
        ERROR_2("Return for handler '%1' invalid - '%2', skipping wound handling",_handlerName,_damageData);
        break;
    };
} forEach _woundHandlers;
