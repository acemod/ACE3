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
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_bodyPart", "_damage", "_typeOfDamage"];
TRACE_5("start",_unit,_bodyPart,_damage,_typeOfDamage);

// Convert the selectionName to a number and ensure it is a valid selection.
private _bodyPartN = ALL_BODY_PARTS find toLower _bodyPart;
if (_bodyPartN < 0) exitWith {};

if (_typeOfDamage isEqualTo "") then {
    _typeOfDamage = "unknown";
};

// Get the damage type information. Format: [typeDamage thresholds, selectionSpecific, woundTypes]
// WoundTypes are the available wounds for this damage type. Format [[classID, selections, bleedingRate, pain], ..]
private _damageTypeInfo = [GVAR(allDamageTypesData) getVariable _typeOfDamage] param [0, [[], false, []]];
_damageTypeInfo params ["_thresholds", "_isSelectionSpecific", "_woundTypes"];

// It appears we are dealing with an unknown type of damage.
if (count _woundTypes == 0) then {
    // grabbing the configuration for unknown damage type
    _damageTypeInfo = [GVAR(allDamageTypesData) getVariable "unknown"] param [0, [[], false, []]];
    _woundTypes = _damageTypeInfo select 2;
};

// find the available injuries for this damage type and damage amount
private _highestPossibleSpot = -1;
private _highestPossibleDamage = -1;
private _allPossibleInjuries = [];

{
    _x params ["", "_selections", "", "", "_damageExtrema"];
    _damageExtrema params ["_minDamage", "_maxDamage"];

    // Check if the damage is higher as the min damage for the specific injury
    if (_damage >= _minDamage && {_damage <= _maxDamage || _maxDamage < 0}) then {
        // Check if the injury can be applied to the given selection name
        if ("All" in _selections || {_bodyPart in _selections}) then { // @todo, this is case sensitive!

            // Find the wound which has the highest minimal damage, so we can use this later on for adding the correct injuries
            if (_minDamage > _highestPossibleDamage) then {
                _highestPossibleSpot = _forEachIndex;
                _highestPossibleDamage = _minDamage;
            };

            // Store the valid possible injury for the damage type, damage amount and selection
            _allPossibleInjuries pushBack _x;
        };
    };
} forEach _woundTypes;

// No possible wounds available for this damage type or damage amount.
if (_highestPossibleSpot < 0) exitWith {};

// Administration for open wounds and ids
private _openWounds = _unit getVariable [QEGVAR(medical,openWounds), []];
private _woundID = _unit getVariable [QEGVAR(medical,lastUniqueWoundID), 1];  // Unique wound ids are not used anywhere: ToDo Remove from openWounds array

private _painLevel = 0;
private _critialDamage = false;
private _bodyPartDamage = _unit getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
private _bodyPartVisParams = [_unit, false, false, false, false]; // params array for EFUNC(medical_engine,updateBodyPartVisuals);
private _woundsCreated = [];
{
    _x params ["_thresholdMinDam", "_thresholdWoundCount"];
    if (_thresholdMinDam <= _damage) exitWith {
        private _woundDamage = _damage / (_thresholdWoundCount max 1); // If the damage creates multiple wounds
        for "_i" from 0 to (_thresholdWoundCount-1) do {
            // Find the injury we are going to add. Format [ classID, allowdSelections, bleedingRate, injuryPain]
            private _oldInjury = if (random 1 >= 0.85) then {
                _woundTypes select _highestPossibleSpot
            } else {
                selectRandom _allPossibleInjuries
            };

            _oldInjury params ["_woundClassIDToAdd", "", "_injuryBleedingRate", "_injuryPain"];

            private _bodyPartNToAdd = [floor random 6, _bodyPartN] select _isSelectionSpecific; // 6 == count ALL_BODY_PARTS

            _bodyPartDamage set [_bodyPartNToAdd, (_bodyPartDamage select _bodyPartNToAdd) + _woundDamage];
            _bodyPartVisParams set [[1,2,3,3,4,4] select _bodyPartNToAdd, true]; // Mark the body part index needs updating

            // Create a new injury. Format [ID, classID, bodypart, percentage treated, bleeding rate]
            _injury = [_woundID, _woundClassIDToAdd, _bodyPartNToAdd, 1, _injuryBleedingRate];

            // The higher the nastiness likelihood the higher the change to get a painful and bloody wound
            private _nastinessLikelihood = linearConversion [0, 20, (_woundDamage / _thresholdWoundCount), 0.5, 30, true];
            private _bleedingModifier = 0.25 + 8 * exp ((random [-4.5, -5, -6]) / _nastinessLikelihood);
            private _painModifier = 0.05 + 2 * exp (-2 / _nastinessLikelihood);

            _bleeding = _injuryBleedingRate * _bleedingModifier;
            private _pain = _injuryPain * _painModifier;
            _painLevel = _painLevel + _pain;

            // wound category (minor [0..0.5], medium[0.5..1.0], large[1.0+])
            private _category = floor linearConversion [0, 1, _bleedingModifier, 0, 2, true];

             // wound category (minor, medium, large)
            private _category = floor ((0 max _bleeding min 0.1) / 0.05);

            _injury set [4, _bleeding];
            _injury set [5, _woundDamage];
            _injury set [6, _category];

            if (_bodyPartNToAdd == 0 || {_bodyPartNToAdd == 1 && {_woundDamage > PENETRATION_THRESHOLD}}) then {
                _critialDamage = true;
            };
#ifdef DEBUG_MODE_FULL
            systemChat format["%1, damage: %2, peneration: %3, bleeding: %4, pain: %5", _bodyPart, _woundDamage toFixed 2, _woundDamage > PENETRATION_THRESHOLD, _bleeding toFixed 3, _pain toFixed 3];
#endif

            // Find the weighted combined wound damage
            private _lethalPercent = _woundDamage * (BODY_PART_DAMAGE_WEIGHTS select _bodyPartNToAdd);
            {
                _x params ["", "", "_bodyPartN", "", "", "_damage"];
                _lethalPercent = _lethalPercent + _damage * (BODY_PART_DAMAGE_WEIGHTS select _bodyPartN);
            } forEach _openWounds;
#ifdef DEBUG_MODE_FULL
            systemChat format["lethal percentage: %1%%", (_lethalPercent * 100) toFixed 0 ];
#endif

            // Handle case where damage becomes lethal (respects lethal injury setting)
            if (_lethalPercent > LETHAL_DAMAGE_THRESHOLD) then {
                [QEGVAR(medical,FatalInjury), _unit] call CBA_fnc_localEvent;
            };

            // todo `forceWalk` based on leg damage
            private _causeLimping = (GVAR(woundsData) select _woundClassIDToAdd) select 7;
            if (_causeLimping == 1 && {_woundDamage > LIMPING_DAMAGE_THRESHOLD} && {_bodyPartNToAdd > 3}) then {
                [_unit, true] call EFUNC(medical_engine,setLimping);
            };

            // if possible merge into existing wounds
            private _createNewWound = true;
            {
                _x params ["", "_classID", "_bodyPartN", "_oldAmountOf", "_oldBleeding", "_oldDamage", "_oldCategory"];
                if (_woundClassIDToAdd == _classID && {_bodyPartNToAdd == _bodyPartN && {(_woundDamage < PENETRATION_THRESHOLD) isEqualTo (_oldDamage < PENETRATION_THRESHOLD)}}) then {
                    if (_oldCategory == _category) exitWith {
                        private _newAmountOf = _oldAmountOf + 1;
                        _x set [3, _newAmountOf];
                        private _newBleeding = (_oldAmountOf * _oldBleeding + _bleeding) / _newAmountOf;
                        _x set [4, _newBleeding];
                        private _newDamage = (_oldAmountOf * _oldDamage + _woundDamage) / _newAmountOf;
                        _x set [5, _newDamage];
                        _createNewWound = false;
                    };
                };
            } forEach _openWounds;

            if (_createNewWound) then {
                _openWounds pushBack _injury;
            };

            // New injuries will also increase the wound ID
            _woundID = _woundID + 1;

            // Store the injury so we can process it later correctly.
            _woundsCreated pushBack _injury;
        };
    };
} forEach _thresholds;

_unit setVariable [QEGVAR(medical,openWounds), _openWounds, true];
_unit setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

_bodyPartVisParams call EFUNC(medical_engine,updateBodyPartVisuals);

[_unit, _painLevel] call EFUNC(medical,adjustPainLevel);
[QEGVAR(medical,injured), [_unit, _painLevel]] call CBA_fnc_localEvent;

if (_critialDamage || {_painLevel > PAIN_UNCONSCIOUS}) then {
    [_unit] call FUNC(handleIncapacitation);
};

TRACE_5("exit",_unit,_painLevel,GET_PAIN(_unit),_unit getVariable QEGVAR(medical,openWounds),_woundsCreated);
