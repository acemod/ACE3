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

params ["_unit", "_source", "_ammo", "_damage", ["_hitpointDamages",[]]];

if (alive _unit) then { _unit setDamage 0; };

private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
TRACE_6("Received hit",_unit,_source,_ammo,_typeOfDamage,_damage,_hitpointDamages);

// No damage to hitpoints - special cases or environmental damage
if (_hitpointDamages isEqualTo []) then {
    switch (_typeOfDamage) do
    {
        case "fire": {
            TRACE_4("Burning",_unit,_source,_instigator,_damage);        

            private _damageSelectionArray = [HITPOINT_INDEX_BODY, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1];
            private _damagedBodyPart = selectRandomWeighted _damageSelectionArray;

            [QEGVAR(medical,woundReceived), [
                _unit, 
                _damagedBodyPart, 
                _damage, 
                "unknown", 
                [[_damagedBodyPart, _damage / (GVAR(structuralDamageToBodyPartCoeff) select _damagedBodyPart)]]
                ]
            ] call CBA_fnc_localEvent;
        };
        case "drowning": {
            TRACE_5("Drowning",_unit,_source,_instigator,_damage,_newDamage);
            [QEGVAR(medical,woundReceived), [
                _unit, 
                1, 
                _damage, 
                "unknown", 
                [[1, _damage / GVAR(structuralDamageToBodyPartCoeff)#1]]
                ]
            ] call CBA_fnc_localEvent;
        };
        case "vehiclecrash":{
            TRACE_2("Applying vehicle crash damage",_unit,_damage);
            private _damageSelectionArray = [ 
                HITPOINT_INDEX_LARM, 0.1, HITPOINT_INDEX_RARM, 0.1, 
                HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1
            ];
            private _damagedBodyPart = selectRandomWeighted _damageSelectionArray;
            private _bodyPartDamage = [[_damagedBodyPart, (_damage min PENETRATION_THRESHOLD)  / (GVAR(structuralDamageToBodyPartCoeff) select _damagedBodyPart)]];

            // Significant damage suggests high relative velocity
            // Momentum transfers to body/head for worse wounding
            // Higher momentum results in higher chance for head to be hit for more lethality
            if (_damage > PENETRATION_THRESHOLD) then {
                private _headBodyDamage = _damage - PENETRATION_THRESHOLD;
                private _headHitWeight = (_headBodyDamage / 2) min 1;
                private _damageSelectionArray =  [HITPOINT_INDEX_BODY, (1 - _headHitWeight), HITPOINT_INDEX_HEAD, _headHitWeight];
                private _damagedBodyPart = selectRandomWeighted _damageSelectionArray;
                _bodyPartDamage pushBack [_damagedBodyPart, _headBodyDamage / (GVAR(structuralDamageToBodyPartCoeff) select _damagedBodyPart)];
            };

            [QEGVAR(medical,woundReceived), [
                _unit, 
                _damagedBodyPart, 
                _damage, 
                "vehiclecrash", 
                _bodyPartDamage
                ]
            ] call CBA_fnc_localEvent;

        };
        default {
            private _damageSelectionArray = [
                HITPOINT_INDEX_HEAD, 0.2, 
                HITPOINT_INDEX_BODY, 1, 
                HITPOINT_INDEX_LARM, 0.5, 
                HITPOINT_INDEX_RARM, 0.5, 
                HITPOINT_INDEX_LLEG, 0.5, 
                HITPOINT_INDEX_RLEG, 0.5
            ];
            private _damagedBodyPart = selectRandomWeighted _damageSelectionArray;

            TRACE_3("Unknown damage",_source,_damage,_damagedBodyPart);
            [QEGVAR(medical,woundReceived), [
                _unit, 
                _damagedBodyPart, 
                _damage, 
                _typeOfDamage, 
                [[_damagedBodyPart, _damage / (GVAR(structuralDamageToBodyPartCoeff) select _damagedBodyPart)]]
                ]
            ] call CBA_fnc_localEvent;
        };
    };
} else {
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
    TRACE_4("incoming",_typeOfDamage,_damage,_hpDamages,_isSelectionSpecific);


    // Sort descending all hitpoint first by real damage, then by inflicted damage
    // Hitpoint with most real damage is the place where bullet hit
    _hpDamages params (_hitPoints apply { ["_" + _x,[0,0,""]] });
    private _hpDamagesSorted = _hpDamages select { (!isNil {_x}) && { _x#2 in GVAR(usefulHitpoints) && _x#0 > 0} };
    _hpDamagesSorted sort false;

    (_hpDamagesSorted#0) params ["", "_receivedDamage", "_woundedHitPoint"];
    // hitdiaphragm and hitchest can receive same damage when bullet hits chest
    if (_woundedHitPoint isEqualTo "hitdiaphragm" && {_hpDamagesSorted#1#2 isEqualTo "hitchest" && _hpDamagesSorted#1#1 == _receivedDamage }) then {
        _woundedHitPoint = "hitchest";
    };
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

    // Unit hit inside vehicle can recieve only structural damage and no hitpoint damage
    if (isNil {_woundedHitPoint}) then {
        _woundedHitPoint = "Body";
        _receivedDamage = _damage / GVAR(structuralDamageToBodyPartCoeff)#1;
    } else {
        _woundedHitPoint = (GVAR(bodyPartsToHitpoints) select {_woundedHitPoint in _x#1})#0#0;
    };
    


    private _headHitpoints = GVAR(bodyPartsToHitpoints)#0#1;
    private _bodyHitpoints = GVAR(bodyPartsToHitpoints)#1#1;
    private _damageHead = (_hpDamagesSorted select { _x#2 in _headHitpoints }) param [0, [0,0,""]];
    private _damageBody = (_hpDamagesSorted select { _x#2 in _bodyHitpoints }) param [0, [0,0,""]];
    
    // No wounds for minor damage
    if (_receivedDamage > 1E-3) then {
        private _woundedHitPointIdx = ALL_BODY_PARTS find toLower _woundedHitPoint;

        private _bodyPartDamage = [
            [HITPOINT_INDEX_HEAD, _damageHead#1], 
            [HITPOINT_INDEX_BODY, _damageBody#1], 
            [HITPOINT_INDEX_LARM, _hitleftarm#1], 
            [HITPOINT_INDEX_RARM, _hitrightarm#1], 
            [HITPOINT_INDEX_LLEG, _hitleftleg#1], 
            [HITPOINT_INDEX_RLEG, _hitrightleg#1] 
        ] select { _x#1 > 0 } ;
        TRACE_4("received",_receivedDamage,_woundedHitPoint,_bodyPartDamage,_damage);

        private _sum = 0;
        {
            _sum = _sum + _x#1 * (GVAR(structuralDamageToBodyPartCoeff) select _x#0);
        } forEach _bodyPartDamage;

        // Sum of bodypart damage is too low
        if(_damage/_sum > 2) then { 
            private _additionalDamage = _damage - 2*_sum;
            private _additionalBodyPart = _woundedHitPointIdx;
            if(!_isSelectionSpecific) then {
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
            TRACE_2("received additional damage",_additionalDamage,_additionalBodyPart);

            _bodyPartDamage pushBack [_additionalBodyPart, _additionalDamage / (GVAR(structuralDamageToBodyPartCoeff) select _additionalBodyPart)];
        };

        [QEGVAR(medical,woundReceived), [
            _unit, 
            _woundedHitPointIdx, 
            _damage, 
            _typeOfDamage, 
            _bodyPartDamage]
        ] call CBA_fnc_localEvent;
    };
};