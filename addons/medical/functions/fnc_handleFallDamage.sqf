/*
 * Author: Glowbal
 * Handle fall damage to unit
 *
 * Arguments:
 * 0: Unit for which the hitpoint damage will be sorted out <OBJECT>
 * 1: new damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_newDamage"];

private _part = ["leg_l"] call FUNC(selectionNameToNumber);
private _part2 = ["leg_r"] call FUNC(selectionNameToNumber);

// Store the new damage values in our damageBodyParts store
private _damageBodyParts = _unit getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];
_damageBodyParts set [_part, (_damageBodyParts select _part) + _newDamage];
_damageBodyParts set [_part2, (_damageBodyParts select _part2) + _newDamage];
_unit setVariable [QGVAR(bodyPartStatus), _damageBodyParts];

// our unconscious calculation for selection damages
if (alive _unit && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
    // If it reaches this, we can assume that the hit did not kill this unit, as this function is called some time after the damage has been passed.
    if ([_unit, _part, _newDamage * 1.3] call FUNC(determineIfFatal)) then {
        [_unit, true, 0.5+random(10)] call FUNC(setUnconscious);
    } else {
        if ([_unit, _part2, _newDamage * 1.3] call FUNC(determineIfFatal)) then {
            [_unit, true, 0.5+random(10)] call FUNC(setUnconscious);
        };
    };
};

if (GVAR(level) > 1) then { // advanced medical is enabled
    [_unit, "leg_l", _newDamage, "", "falling"] call FUNC(handleDamage_assignWounds); // cover both left and right legs
    [_unit, "leg_r", _newDamage, "", "falling"] call FUNC(handleDamage_assignWounds);
} else {
    // New pain values
    _pain = _unit getVariable [QGVAR(pain), 0];
    _pain = _pain + (_newDamage / 4) * (1 - (_unit getVariable [QGVAR(morphine), 0]));
    _unit setVariable [QGVAR(pain), _pain min 1, true];
};

// Store the hitpoint values so blood ends up on the unit textures
_unit setVariable [QGVAR(bodyPartStatus), _damageBodyParts, true];
TRACE_2("ACE_DEBUG: HandleSelectionDamage Broadcast value here", _unit, _unit getVariable QGVAR(bodyPartStatus));

EXPLODE_6_PVT(_damageBodyParts,_headDamage,_torsoDamage,_handsDamageR,_handsDamageL,_legsDamageR,_legsDamageL);
_unit setHitPointDamage ["hitHead", _headDamage min 0.95];
_unit setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_unit setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_unit setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

{
    private _hitPointName = [_unit, _x, true] call FUNC(translateSelections);
    _unit setHitPointDamage [_hitPointName, (_damageBodyParts select _foreachIndex) min 0.95];
}foreach GVAR(SELECTIONS);
