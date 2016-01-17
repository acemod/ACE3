/*
 * Author: Glowbal, Commy2 & KoffeinFlummi
 * Sets the hitpoint damage for an unit to the correct values
 *
 * Arguments:
 * 0: Unit for which the hitpoint damage will be sorted out <OBJECT>
 * 1: Selection name <STRING>
 * 2: new damage <NUMBER>
 * 3: projectile <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_selection", "_newDamage", "_projectile"];

// private _totalDamage = (_unit getHit _selection) + _newDamage;
systemChat format["handleSelectionDamage: %1", _this];

private _part = [_selection] call FUNC(selectionNameToNumber);
if (_part < 0) exitwith {systemchat format["Selection name part is below 0"]};

// Store the new damage values in our damageBodyParts store
private _damageBodyParts = _unit getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];
_damageBodyParts set [_part, (_damageBodyParts select _part) + _newDamage];
_unit setVariable [QGVAR(bodyPartStatus), _damageBodyParts];

// our unconscious calculation for selection damages
if (alive _unit && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
    // If it reaches this, we can assume that the hit did not kill this unit, as this function is called some time after the damage has been passed.
    if ([_unit, _part, if (_part > 1) then {_newDamage * 1.3} else {_newDamage * 2}] call FUNC(determineIfFatal)) then {
        [_unit, true, 0.5+random(10)] call FUNC(setUnconscious);
    };
};

if (GVAR(level) > 1) then { // advanced medical is enabled
    systemChat format["LEVEL OF MEDICAL SYSTEM IS ADVANCED"];
    _typeOfDamage = [_projectile] call FUNC(getTypeOfDamage); // Get the exact type of damage
    [_unit, _selection, _newDamage, _projectile, _typeOfDamage] call FUNC(handleDamage_assignWounds);

    // TODO Disabled until implemented fully
    //if (GVAR(enableAirway)) then {
    //    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_airway);
    //};
    //if (GVAR(enableFractures)) then {
    //    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_fractures);
    //};
    //if (GVAR(enableInternalBleeding)) then {
    //    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_internalInjuries);
    //};
} else {
    systemChat format["LEVEL OF MEDICAL SYSTEM IS BASIC"];
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
