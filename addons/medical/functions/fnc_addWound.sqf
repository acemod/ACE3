#include "..\script_component.hpp"
/*
 * Author: Cplhardcore
 * Adds an entry to the specified medical log of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Bodypart <STRING>
 * 2: Wound to add <ARRAY>
 *  2.0: Wound Type <STRING>
 *  2.1: Amount <NUMBER>
 *  2.2: Size (0 - 2) <NUMBER>
 *  2.3: Wound Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "body", ["Avulsion", 1, 2, 1]] call ace_medical_fnc_addWound
 *
 * Public: Yes
 */

params ["_unit", "_bodyPart", "_woundParams"];
_woundParams params ["_woundType", "_amountOf", "_size", "_woundDamage"];
TRACE_1("_woundParams",_woundParams);
private _bodyPartNToAdd = ALL_BODY_PARTS find _bodyPart;
if (_bodyPartNToAdd < 0) exitWith {
    ERROR_1("invalid body part %1",_bodyPart);
};
private _createdWounds = false;
private _painLevel = 0;
private _bodyPartVisParams = [_unit, false, false, false, false];
private _openWounds = GET_OPEN_WOUNDS(_unit);
private _existingWounds = _openWounds getOrDefault [_bodyPart, [], true];
private _bodyPartDamage = GET_BODYPART_DAMAGE(_unit);
EGVAR(medical_damage,woundDetails) get _woundType params ["","_injuryBleedingRate","_injuryPain"];
TRACE_1("_injuryBleedingRate",_injuryBleedingRate);
private _woundClassIDToAdd = EGVAR(medical_damage,woundClassNames) find _woundType;
TRACE_1("_woundClassIDToAdd",_woundClassIDToAdd);
private _pain = _size * _injuryPain;
_painLevel = _painLevel + _pain;
private _bleeding = _size * _injuryBleedingRate;
private _classComplex = 10 * _woundClassIDToAdd + _size;
private _injury = [_classComplex, _amountOf, _bleeding, 1];
private _createNewWound = true;
{
    _x params ["_classID", "_oldAmountOf", "_oldBleeding", "_oldDamage"];
    if (_classComplex == _classID) exitWith {
        TRACE_2("merging with existing wound",_injury,_x);
        private _newAmountOf = _oldAmountOf + 1;
        _x set [1, _newAmountOf];
        private _newBleeding = (_oldAmountOf * _oldBleeding + _bleeding) / _newAmountOf;
        _x set [2, _newBleeding];
        private _newDamage = (_oldAmountOf * _oldDamage + _woundDamage) / _newAmountOf;
        _x set [3, _newDamage];
        _createNewWound = false;
    };
} forEach _existingWounds;
if (_createNewWound) then {
    TRACE_1("adding new wound",_injury);
    _existingWounds pushBack _injury;
};
_createdWounds = true;
_bodyPartVisParams set [[1,2,3,3,4,4] select _bodyPartNToAdd, true];
if (_createdWounds) then {
    _unit setVariable [VAR_OPEN_WOUNDS, _openWounds, true];
    _bodyPartDamage set [_bodyPartNToAdd, (_bodyPartDamage select _bodyPartNToAdd) + _woundDamage];
    _unit setVariable [VAR_BODYPART_DAMAGE, _bodyPartDamage, true];
    _bodyPartVisParams call EFUNC(medical_engine,updateBodyPartVisuals);
    [QEGVAR(medical,injured), [_unit, _painLevel]] call CBA_fnc_localEvent;
};
_unit call EFUNC(medical_status,updateWoundBloodLoss);
