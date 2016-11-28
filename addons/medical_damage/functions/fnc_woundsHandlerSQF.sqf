/*
 * Author: Glowbal, commy2
 * Handling of the open wounds & injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Body Part <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter or source of the damage <OBJECT>
 * 4: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_bodyPart", "_damage", "_typeOfProjectile", "_typeOfDamage"];
TRACE_5("start",_unit,_bodyPart,_damage,_typeOfProjectile,_typeOfDamage);

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
        if ("All" in _selections || _bodyPart in _selections) then { // @todo, this is case sensitive!

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
private _woundID = _unit getVariable [QGVAR(lastUniqueWoundID), 1];

private _painToAdd = 0;
private _woundsCreated = [];

{
    if (_x select 0 <= _damage) exitWith {
        for "_i" from 0 to ((_x select 1)-1) do {

            // Find the injury we are going to add. Format [ classID, allowdSelections, bleedingRate, injuryPain]
            private _oldInjury = if (random 1 >= 0.85) then {
                _woundTypes select _highestPossibleSpot
            } else {
                selectRandom _allPossibleInjuries
            };

            _oldInjury params ["_woundClassIDToAdd", "", "_injuryBleedingRate", "_injuryPain"];

            private _bodyPartNToAdd = [floor random 6, _bodyPartN] select _isSelectionSpecific; // 6 == count ALL_BODY_PARTS

            // If the injury type is selection part specific, we will check if one of those injury types already exists and find the spot for it..
            private _foundIndex = -1;
            if (_isSelectionSpecific) then {
                {
                    // Check if we have an id of the given class on the given bodypart already
                    if ((_woundClassIDToAdd isEqualTo (_x select 1)) && {_bodyPartNToAdd isEqualTo (_x select 2)}) exitWith {
                        _foundIndex = _forEachIndex;
                    };
                } forEach _openWounds;
            };

            private _injury = [];
            if (_foundIndex < 0) then {
                // Create a new injury. Format [ID, classID, bodypart, percentage treated, bleeding rate]
                _injury = [_woundID, _woundClassIDToAdd, _bodyPartNToAdd, 1, _injuryBleedingRate];

                // Since it is a new injury, we will have to add it to the open wounds array to store it
                _openWounds pushBack _injury;

                // New injuries will also increase the wound ID
                _woundID = _woundID + 1;
            } else {
                // We already have one of these, so we are just going to increase the number that we have of it with a new one.
                _injury = _openWounds select _foundIndex;
                _injury set [3, (_injury select 3) + 1];
            };
    
            private _lethalities = (GVAR(woundsData) select _woundClassIDToAdd) select 7;
            {
                if (_x select 0 == _bodyPartNToAdd) exitWith {
                    private _lethality = _x select 1;
                    if (_lethality > random 1) then {
                        [QEGVAR(medical,InjuryFatal), _unit] call CBA_fnc_localEvent;
                    };
                };
            } forEach _lethalities;
    

            // Store the injury so we can process it later correctly.
            _woundsCreated pushBack _injury;

            // Collect the pain that is caused by this injury
            _painToAdd = _injuryPain + _painToAdd;
        };
    };
} forEach _thresholds;

_unit setVariable [QEGVAR(medical,openWounds), _openWounds, true];

[_unit, _bodyPart] call EFUNC(medical_engine,updateBodyPartVisuals);

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setVariable [QGVAR(lastUniqueWoundID), _woundID, true];
};

[_unit, _painToAdd] call EFUNC(medical,addPain);
[_unit, "hit", PAIN_TO_SCREAM(_painToAdd)] call EFUNC(medical_engine,playInjuredSound);

TRACE_5("exit",_unit, _painToAdd, _unit getVariable QEGVAR(medical,pain), _unit getVariable QEGVAR(medical,openWounds),_woundsCreated);
