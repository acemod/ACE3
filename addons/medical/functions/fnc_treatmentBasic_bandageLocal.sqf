/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"
#define BANDAGEHEAL 0.8

params ["_target", "_selectionName"];

_damageBodyParts = _target getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];

// Ensure it is a valid bodypart
_part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part < 0) exitwith {false};

if ((_damageBodyParts select _part) > 0) then {
    _damageOnPart = (_damageBodyParts select _part);
    // Temp quick fix to change in behaviour of basic medical bandaging
    if (_damageOnPart - BANDAGEHEAL > 0) then {
        _damageOnPart = _damageOnPart - (_damageOnPart * BANDAGEHEAL);
    } else {
        _damageOnPart = _damageOnPart - BANDAGEHEAL;
    };
    _damageBodyParts set [_part, _damageOnPart max 0];
    _target setVariable [QGVAR(bodyPartStatus), _damageBodyParts, true];
    TRACE_2("ACE_DEBUG: Treatment BASIC Bandage Broadcast value here",_unit, _target getVariable QGVAR(bodyPartStatus));
};

EXPLODE_6_PVT(_damageBodyParts,_headDamage,_torsoDamage,_handsDamageR,_handsDamageL,_legsDamageR,_legsDamageL);
_target setHitPointDamage ["hitHead", _headDamage min 0.95];
_target setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_target setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_target setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

{
    private _hitPointName = [_target, _x, true] call FUNC(translateSelections);
    _target setHitPointDamage [_hitPointName, (_damageBodyParts select _foreachIndex) min 0.95];
}foreach GVAR(SELECTIONS);

true;
