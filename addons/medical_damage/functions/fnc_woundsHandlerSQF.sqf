#include "script_component.hpp"
/*
 * Author: Glowbal, commy2
 * Handling of the open wounds & injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Body Part <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Body", 0.5, "bullet"] call ace_medical_damage_fnc_woundsHandlerSQF
 *
 * Public: No
 */

params ["_unit", "_bodyPart", "_damage", "_typeOfDamage"];
TRACE_4("woundsHandlerSQF",_unit,_bodyPart,_damage,_typeOfDamage);

// Convert the selectionName to a number and ensure it is a valid selection.
private _bodyPartNToAdd = ALL_BODY_PARTS find toLower _bodyPart;
if (_bodyPartNToAdd < 0) exitWith { ERROR_1("invalid body part %1",_bodyPart); };

if !(_typeOfDamage in GVAR(damageTypeDetails)) then {
    WARNING_1("damage type not found",_typeOfDamage);
    _typeOfDamage = "unknown";
};

GVAR(damageTypeDetails) get _typeOfDamage params ["_thresholds", "", "", "_damageWoundDetails"];
// determine how many wounds to create
private _nWounds = [_damage, _thresholds, true] call FUNC(interpolatePoints);
if (_nWounds < 1) exitwith {TRACE_2("Damage created zero wounds",_damage,_typeOfDamage);};
private _dmgPerWound = _damage/_nWounds;

// find the available injuries for this damage type and damage amount
private _weightedWoundTypes = [];
{
    private _weighting = _x select 1;
    private _woundWeight = [_dmgPerWound, _weighting] call FUNC(interpolatePoints);
    _weightedWoundTypes pushBack _x;
    _weightedWoundTypes pushBack _woundWeight;
} forEach _damageWoundDetails;

if (_weightedWoundTypes isEqualTo []) exitwith {TRACE_2("No valid wounds",_damage,_typeOfDamage);};

// Administration for open wounds and ids
private _openWounds = GET_OPEN_WOUNDS(_unit);

private _updateDamageEffects = false;
private _painLevel = 0;
private _criticalDamage = false;
private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
private _bodyPartVisParams = [_unit, false, false, false, false]; // params array for EFUNC(medical_engine,updateBodyPartVisuals);

// if (_damage > _thresholdMinDam) then {
for "_i" from 1 to _nWounds do {

    // Select the injury we are going to add
    selectRandomWeighted _weightedWoundTypes params ["_woundTypeToAdd", "", "_dmgMultiplier", "_bleedMultiplier", "_sizeMultiplier", "_painMultiplier", "_fractureMultiplier"];
    GVAR(woundDetails) get _woundTypeToAdd params ["","_injuryBleedingRate","_injuryPain","_causeLimping","_causeFracture"];
    private _woundClassIDToAdd = GVAR(woundClassNames) find _woundTypeToAdd;
    
    // Add a bit of random variance to wounds
    private _woundDamage = _dmgPerWound * _dmgMultiplier * random [0.9, 1, 1.1];

    _bodyPartDamage set [_bodyPartNToAdd, (_bodyPartDamage select _bodyPartNToAdd) + _woundDamage];
    _bodyPartVisParams set [[1,2,3,3,4,4] select _bodyPartNToAdd, true]; // Mark the body part index needs updating

    // Damage to limbs/head is scaled higher than torso by engine
    // Anything above this value is guaranteed worst wound possible
    private _worstDamage = [2, 1, 4, 4, 4, 4] select _bodyPartNToAdd;

    // Config specifies bleeding and pain for worst possible wound
    // Worse wound correlates to higher damage, damage is not capped at 1
    private _woundSize = linearConversion [0.1, _worstDamage, _woundDamage * _sizeMultiplier, 0.25, 1, true];
    
    private _pain = _woundSize * _painMultiplier * _injuryPain;
    _painLevel = _painLevel + _pain;

    private _bleeding = _woundSize * _bleedMultiplier * _injuryBleedingRate;

    // wound category (minor [0-0.35], medium [0.35-0.7], large [0.7+])
    private _category = floor linearConversion [0, 0.7, _woundSize, 0, 2, true];

    private _classComplex = 10 * _woundClassIDToAdd + _category;

    // Create a new injury. Format [0:classComplex, 1:bodypart, 2:amountOf, 3:bleedingRate, 4:woundDamage]
    private _injury = [_classComplex, _bodyPartNToAdd, 1, _bleeding, _woundDamage];

    if (_bodyPartNToAdd == 0 || {_bodyPartNToAdd == 1 && {_woundDamage > PENETRATION_THRESHOLD}}) then {
        _criticalDamage = true;
    };
    if ([_unit, _bodyPartNToAdd, _bodyPartDamage, _woundDamage] call FUNC(determineIfFatal)) then {
        if (!isPlayer _unit || {random 1 < EGVAR(medical,deathChance)}) then {
            TRACE_1("determineIfFatal returned true",_woundDamage);
            [QEGVAR(medical,FatalInjury), _unit] call CBA_fnc_localEvent;
        };
    };

    #ifdef DEBUG_MODE_FULL
    systemChat format["%1, damage: %2, peneration: %3, bleeding: %4, pain: %5", _bodyPart, _woundDamage toFixed 2, _woundDamage > PENETRATION_THRESHOLD, _bleeding toFixed 3, _pain toFixed 3];
    #endif

    switch (true) do {
        case (
            _causeFracture
            && {EGVAR(medical,fractures) > 0}
            && {_bodyPartNToAdd > 1}
            && {_woundDamage > FRACTURE_DAMAGE_THRESHOLD}
            && {random 1 < (_fractureMultiplier * EGVAR(medical,fractureChance))}
        ): {
            private _fractures = GET_FRACTURES(_unit);
            _fractures set [_bodyPartNToAdd, 1];
            _unit setVariable [VAR_FRACTURES, _fractures, true];

            [QEGVAR(medical,fracture), [_unit, _bodyPartNToAdd]] call CBA_fnc_localEvent;
            TRACE_1("Limb fracture",_bodyPartNToAdd);

            _updateDamageEffects = true;
        };
        case (
            _causeLimping
            && {EGVAR(medical,limping) > 0}
            && {_bodyPartNToAdd > 3}
            && {_woundDamage > LIMPING_DAMAGE_THRESHOLD}
        ): {
            _updateDamageEffects = true;
        };
    };

    // if possible merge into existing wounds
    private _createNewWound = true;
    {
        _x params ["_classID", "_bodyPartN", "_oldAmountOf", "_oldBleeding", "_oldDamage"];
        if (
                (_classComplex == _classID) &&
                {_bodyPartNToAdd == _bodyPartN} &&
                {(_bodyPartNToAdd != 1) || {(_woundDamage < PENETRATION_THRESHOLD) isEqualTo (_oldDamage < PENETRATION_THRESHOLD)}} && // penetrating body damage is handled differently
                {(_bodyPartNToAdd > 3) || {!_causeLimping} || {(_woundDamage <= LIMPING_DAMAGE_THRESHOLD) isEqualTo (_oldDamage <= LIMPING_DAMAGE_THRESHOLD)}} // ensure limping damage is stacked correctly
                ) exitWith {
            TRACE_2("merging with existing wound",_injury,_x);
            private _newAmountOf = _oldAmountOf + 1;
            _x set [2, _newAmountOf];
            private _newBleeding = (_oldAmountOf * _oldBleeding + _bleeding) / _newAmountOf;
            _x set [3, _newBleeding];
            private _newDamage = (_oldAmountOf * _oldDamage + _woundDamage) / _newAmountOf;
            _x set [4, _newDamage];
            _createNewWound = false;
        };
    } forEach _openWounds;

    if (_createNewWound) then {
        TRACE_1("adding new wound",_injury);
        _openWounds pushBack _injury;
    };
};

if (_updateDamageEffects) then {
    [_unit] call EFUNC(medical_engine,updateDamageEffects);
};

_unit setVariable [VAR_OPEN_WOUNDS, _openWounds, true];
_unit setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

[_unit] call EFUNC(medical_status,updateWoundBloodLoss);

_bodyPartVisParams call EFUNC(medical_engine,updateBodyPartVisuals);

[QEGVAR(medical,injured), [_unit, _painLevel]] call CBA_fnc_localEvent;

if (_criticalDamage || {_painLevel > PAIN_UNCONSCIOUS}) then {
    [_unit] call FUNC(handleIncapacitation);
};

TRACE_4("exit",_unit,_painLevel,GET_PAIN(_unit),GET_OPEN_WOUNDS(_unit));
