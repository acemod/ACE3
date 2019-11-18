#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Manually Apply Damage to a unit (can cause lethal damage)
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Damage to Add <NUMBER>
 * 2: Body part ("Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg") <STRING>
 * 3: Projectile Type <STRING>
 * 4: Source <OBJECT>
 * 5: Non-directional damage source array (Optional) <ARRAY>
 *
 * Return Value:
 * Successful <BOOL>
 *
 * Example:
 * [player, 0.8, "rightleg", "bullet"] call ace_medical_fnc_addDamageToUnit
 * [cursorTarget, 1, "body", "stab", player] call ace_medical_fnc_addDamageToUnit
 *
 * Public: Yes
 */
// #define DEBUG_TESTRESULTS

params [["_unit", objNull, [objNull]], ["_damageToAdd", -1, [0]], ["_bodyPart", "", [""]], ["_typeOfDamage", "", [""]], ["_instigator", objNull, [objNull]], ["_damageSelectionArray", [], [[]]]];
TRACE_6("addDamageToUnit",_unit,_damageToAdd,_bodyPart,_typeOfDamage,_instigator,_damageSelectionArray);

_bodyPart = toLower _bodyPart;
private _bodyPartIndex = ALL_BODY_PARTS find _bodyPart;
if (_bodyPartIndex < 0) then { _bodyPartIndex = ALL_SELECTIONS find _bodyPart; }; // 2nd attempt with selection names ("hand_l", "hand_r", "leg_l", "leg_r")
if (_bodyPartIndex < 0) exitWith {ERROR_1("addDamageToUnit - bad selection %1", _this); false};
if (isNull _unit || {!local _unit} || {!alive _unit}) exitWith {ERROR_2("addDamageToUnit - badUnit %1 [local %2]", _this, local _unit); false};
if (_damageToAdd < 0) exitWith {ERROR_1("addDamageToUnit - bad damage %1", _this); false};

// Extension is case sensitive and expects this format (different from ALL_BODY_PARTS)
_bodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] select _bodyPartIndex;

if (_damageSelectionArray isEqualTo []) then { // this will only be used if damage type is not location specific
    _damageSelectionArray = [HITPOINT_INDEX_HEAD, 1, HITPOINT_INDEX_BODY, 1, HITPOINT_INDEX_LARM, 1, HITPOINT_INDEX_RARM, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1];
};

if (!isNull _instigator) then {
    _unit setVariable [QEGVAR(medical,lastDamageSource), _instigator];
    _unit setVariable [QEGVAR(medical,lastInstigator), _instigator];
};

#ifdef DEBUG_TESTRESULTS
private _startDmg = +(_unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]]);
private _startPain = GET_PAIN(_unit);
#endif

[QEGVAR(medical,woundReceived), [_unit, _bodyPart, _damageToAdd, _instigator, _typeOfDamage, _damageSelectionArray]] call CBA_fnc_localEvent;

#ifdef DEBUG_TESTRESULTS
private _endDmg = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
private _endPain = GET_PAIN(_unit);
private _typeOfDamageAdj = _typeOfDamage call EFUNC(medical_damage,getTypeOfDamage);
private _config = configFile >> "ACE_Medical_Injuries" >> "damageTypes" >> _typeOfDamageAdj;
private _selectionSpecific = true;
if (isClass _config) then {
    _selectionSpecific = (getNumber (_config >> "selectionSpecific")) == 1;
} else {
    WARNING_2("Damage type not in config [%1:%2]", _typeOfDamage, _config);
};
INFO_4("Debug AddDamageToUnit: Type [%1] - Selection Specific [%2] - HitPoint [%3 -> %4]",_typeOfDamage,_selectionSpecific,_startDmg select _bodyPartIndex,_endDmg select _bodyPartIndex);
INFO_4("Pain Change [%1 -> %2] - BodyPartDamage Change [%3 -> %4]",_startPain,_endPain,_startDmg,_endDmg);
#endif

true
