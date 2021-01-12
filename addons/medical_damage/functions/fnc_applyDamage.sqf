#include "script_component.hpp"
/*
 * Author: gandjustas
 * Converts hitpoint damages to body part damages, checks heart hit.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Source of damage <OBJECT>
 * 2: Ammo <STRING>
 * 3: Structural damage <NUMBER>
 * 4: Array of damage to hitpoints <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, objNull, "fire", 0.1] call ace_medical_damage_fnc_applyDamage
 *
 * Public: No
 */

params ["_unit", "_source", "_ammo", "_structuralDamage", ["_hitpointDamages",[]]];

if (alive _unit) then { _unit setDamage 0; };

private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
TRACE_6("Received hit",_unit,_source,_ammo,_typeOfDamage,_structuralDamage,_hitpointDamages);


private _damageTypeInfo = [GVAR(allDamageTypesData) getVariable _typeOfDamage] param [0, [[], false, []]];
_damageTypeInfo params ["", "_isSelectionSpecific", ""];

private _hitPoints = _unit getVariable QEGVAR(medical,HitPoints);
private _unitArmor = call FUNC(getArmor);

private _hpDamages = [];
{
    if (!isNil {_x}) then {
        private _realDamage = _x; 
        private _armor = _unitArmor select _forEachIndex;
        
        // Only for direct damage
        if (_isSelectionSpecific) then {
            _realDamage = _x * _armor;
        };
        _hpDamages set [_forEachIndex, [_realDamage, _x, _hitPoints select _forEachIndex]];
    };
} forEach _hitpointDamages;
TRACE_4("incoming",_typeOfDamage,_structuralDamage,_hpDamages,_isSelectionSpecific);


// Sort descending all hitpoint first by real damage, then by inflicted damage
// Hitpoint with most real damage is the place where bullet hit
private _hpDamagesSorted = _hpDamages select { (!isNil {_x}) && { _x#2 in GVAR(usefulHitpoints) && _x#0 > 0} };
_hpDamagesSorted sort false;

(_hpDamagesSorted#0) params ["", "_receivedDamage", "_woundedHitPoint"];
// hitdiaphragm and hitchest can receive same damage when bullet hits chest
if (_woundedHitPoint isEqualTo "hitdiaphragm" && {_hpDamagesSorted#1#2 isEqualTo "hitchest" && _hpDamagesSorted#1#1 == _receivedDamage }) then {
    _woundedHitPoint = "hitchest";
};
private _woundedBodyPartIdx = HITPOINT_INDEX_BODY;
private _bodyPartDamage = [];

if (!isNil {_woundedHitPoint}) then {
    TRACE_2("Detected hit",_woundedHitPoint,_receivedDamage);

    // Detect heartshot
    if (_isSelectionSpecific && EGVAR(medical,fatalDamageSource) in [0, 2] && _woundedHitPoint isEqualTo "hitchest") then {
        // Emulate damage to vital organs -  random torso shots
        if (_receivedDamage >= ORGAN_DAMAGE_THRESHOLD && {random 1 < HEART_HIT_CHANCE}) then {
            // Heart shot is lethal
            TRACE_1("applyDamage: lethal heartshot",_receivedDamage);
            [QEGVAR(medical,FatalInjury), _unit] call CBA_fnc_localEvent;
        };
    };

    private _woundedBodyPart = (GVAR(bodyPartsToHitpoints) select {_woundedHitPoint in _x#1})#0#0;
    _woundedBodyPartIdx = ALL_BODY_PARTS find toLower _woundedBodyPart;

    _hpDamages params (_hitPoints apply { ["_" + _x,[0,0,""]] });
    private _headHitpoints = GVAR(bodyPartsToHitpoints)#HITPOINT_INDEX_HEAD#1;
    private _bodyHitpoints = GVAR(bodyPartsToHitpoints)#HITPOINT_INDEX_BODY#1;
    private _damageHead = selectMax (_hpDamages select { _x#2 in _headHitpoints } apply { _x#1 });
    private _damageBody = selectMax (_hpDamages select { _x#2 in _bodyHitpoints } apply { _x#1 });

    _bodyPartDamage append ([
        [HITPOINT_INDEX_HEAD, _damageHead], 
        [HITPOINT_INDEX_BODY, _damageBody], 
        [HITPOINT_INDEX_LARM, _hitleftarm#1], 
        [HITPOINT_INDEX_RARM, _hitrightarm#1], 
        [HITPOINT_INDEX_LLEG, _hitleftleg#1], 
        [HITPOINT_INDEX_RLEG, _hitrightleg#1] 
    ] select { _x#1 > 0 });
} else {
    switch (_ammo) do {
        case "fire": {
            TRACE_2("Burning",_unit,_structuralDamage);        
            _woundedBodyPartIdx = selectRandomWeighted [HITPOINT_INDEX_BODY, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1];
            _bodyPartDamage pushBack [_woundedBodyPartIdx, _structuralDamage / (GVAR(structuralDamageToBodyPartCoeff) select _woundedBodyPartIdx)];
        };
        case "drowning": {
            TRACE_2("Drowning",_unit,_structuralDamage);
            _woundedBodyPartIdx = HITPOINT_INDEX_BODY;
            _bodyPartDamage pushBack [HITPOINT_INDEX_BODY, _structuralDamage / GVAR(structuralDamageToBodyPartCoeff)#1];
        };
        case "vehiclecrash":{
            TRACE_2("Vehicle crash",_unit,_structuralDamage);
            private _damageSelectionArray = [ 
                HITPOINT_INDEX_LARM, 0.1, HITPOINT_INDEX_RARM, 0.1, 
                HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1
            ];
            _woundedBodyPartIdx = selectRandomWeighted _damageSelectionArray;
            _bodyPartDamage pushBack [_woundedBodyPartIdx, (_structuralDamage min PENETRATION_THRESHOLD) / (GVAR(structuralDamageToBodyPartCoeff) select _woundedBodyPartIdx)];

            // Significant damage suggests high relative velocity
            // Momentum transfers to body/head for worse wounding
            // Higher momentum results in higher chance for head to be hit for more lethality
            if (_structuralDamage > PENETRATION_THRESHOLD) then {
                private _headBodyDamage = _structuralDamage - PENETRATION_THRESHOLD;
                private _headHitWeight = (_headBodyDamage / 2) min 1;
                private _damageSelectionArray =  [HITPOINT_INDEX_BODY, (1 - _headHitWeight), HITPOINT_INDEX_HEAD, _headHitWeight];
                _woundedBodyPartIdx = selectRandomWeighted _damageSelectionArray;
                _bodyPartDamage pushBack [_woundedBodyPartIdx, _headBodyDamage / (GVAR(structuralDamageToBodyPartCoeff) select _woundedBodyPartIdx)];
            };
        };
    };
};

private _woundedBodyPart = ALL_BODY_PARTS select _woundedBodyPartIdx;
TRACE_3("received",_structuralDamage,_woundedBodyPart,_bodyPartDamage);

private _sum = 0;
{
    _sum = _sum + _x#1 * (GVAR(structuralDamageToBodyPartCoeff) select _x#0);
} forEach _bodyPartDamage;

// Vehicle crew can receive only structural damage without hitpoit damage
if (_structuralDamage > 2 * _sum) then { 
    private _additionalDamage = _structuralDamage - 2 * _sum;
    private _additionalBodyPart = _woundedBodyPartIdx;
    if (!_isSelectionSpecific) then {
        private _damageSelectionArray = [
            HITPOINT_INDEX_HEAD, 0.2, 
            HITPOINT_INDEX_BODY, 1, 
            HITPOINT_INDEX_LARM, 0.5, 
            HITPOINT_INDEX_RARM, 0.5, 
            HITPOINT_INDEX_LLEG, 0.5, 
            HITPOINT_INDEX_RLEG, 0.5
        ];

        _additionalBodyPart = selectRandomWeighted _damageSelectionArray;
    };

    private _bodyPart = ALL_BODY_PARTS select _additionalBodyPart;
    private _damage = _additionalDamage / (GVAR(structuralDamageToBodyPartCoeff) select _additionalBodyPart);
    TRACE_2("Sum of bodypart damages is too low, adding damage",_bodyPart,_damage);
    _bodyPartDamage pushBack [_additionalBodyPart, _damage];
};

// No wounds for minor damage
if (_structuralDamage > 1E-3 or (count _bodyPartDamage) > 0) then {
    [QEGVAR(medical,woundReceived), [
        _unit, 
        _woundedBodyPartIdx, 
        _structuralDamage, 
        _typeOfDamage, 
        _bodyPartDamage
    ]] call CBA_fnc_localEvent;
};

