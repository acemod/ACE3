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

private _woundedBodyPartIdx = HITPOINT_INDEX_BODY;
private _bodyPartDamage = [];

if (_hitpointDamages isEqualTo []) then {
    // Special cases
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
} else {
    // Translate hitpoint damages to bodypart damages
    private _headHipoints = _unit getVariable QEGVAR(medical,HeadHitPointIdxs);
    private _bodyHipoints = _unit getVariable QEGVAR(medical,BodyHitPointIdxs);
    private _hitleftarmIdx = _unit getVariable "hitleftarmIdx";
    private _hitrightarmIdx = _unit getVariable "hitrightarmIdx";
    private _hitleftlegIdx = _unit getVariable "hitleftlegIdx",
    private _hitrightlegIdx = _unit getVariable "hitrightlegIdx";

    _bodyPartDamage append ([
        [HITPOINT_INDEX_HEAD, selectMax (_headHipoints apply { _hitpointDamages select _x })], 
        [HITPOINT_INDEX_BODY, selectMax (_bodyHipoints apply { _hitpointDamages select _x })], 
        [HITPOINT_INDEX_LARM, _hitpointDamages param [_hitleftarmIdx]], 
        [HITPOINT_INDEX_RARM, _hitpointDamages param [_hitrightarmIdx]], 
        [HITPOINT_INDEX_LLEG, _hitpointDamages param [_hitleftlegIdx]], 
        [HITPOINT_INDEX_RLEG, _hitpointDamages param [_hitrightlegIdx]] 
    ] select { _x#1 > 0 });

    // If damage is selection-specific try to find wounded hitpoint
    if (_isSelectionSpecific) then {
        private _hitPoints = _unit getVariable QEGVAR(medical,HitPoints);
        private _unitArmor = call FUNC(getArmor);
        private _usefulHitpoints = _unit getVariable QEGVAR(medical,UsefulHitpoints);
        if (isNil { _usefulHitpoints }) then {
            _usefulHitpoints = _headHipoints + _bodyHipoints + [
                _hitleftarmIdx, _hitrightarmIdx,
                _hitleftlegIdx, _hitrightlegIdx
            ];
            _unit setVariable [QEGVAR(medical,UsefulHitpoints), _usefulHitpoints];
        };

        private _hpDamagesSorted = [];
        {
            if (!isNil {_x} && _forEachIndex in _usefulHitpoints) then {
                private _armor = _unitArmor select _forEachIndex;
                private _realDamage = _x * _armor; 
                _hpDamagesSorted pushBack [_x * _armor, _x, _hitPoints select _forEachIndex];
            };
        } forEach _hitpointDamages;

        // Sort descending all hitpoint first by real damage, then by inflicted damage
        // Hitpoint with most real damage is the place where bullet hit
        _hpDamagesSorted sort false;
        (_hpDamagesSorted#0) params ["", "_receivedDamage", "_woundedHitPoint"];
        
        // hitdiaphragm and hitchest can receive same damage when bullet hits chest
        if (_woundedHitPoint isEqualTo "hitdiaphragm" && count _hpDamagesSorted > 1 && {
            _hpDamagesSorted#1#2 isEqualTo "hitchest" && _hpDamagesSorted#1#1 == _receivedDamage 
        }) then {
            _woundedHitPoint = "hitchest";
        };
        TRACE_3("Detected hit",_woundedHitPoint,_receivedDamage,_hpDamagesSorted);

        // Detect heartshot
        if (EGVAR(medical,fatalDamageSource) in [0, 2] && _woundedHitPoint isEqualTo "hitchest") then {
            // Emulate damage to vital organs -  random torso shots
            if (_receivedDamage >= ORGAN_DAMAGE_THRESHOLD && {random 1 < HEART_HIT_CHANCE}) then {
                // Heart shot is lethal
                TRACE_1("applyDamage: lethal heartshot",_receivedDamage);
                [QEGVAR(medical,FatalInjury), _unit] call CBA_fnc_localEvent;
            };
        };

        if (!isNil { _woundedHitPoint }) then {
            _woundedBodyPartIdx = GVAR(bodyPartsToHitpoints) findIf {_woundedHitPoint in _x};
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
