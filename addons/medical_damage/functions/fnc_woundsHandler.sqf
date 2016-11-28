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

if (_typeOfDamage isEqualTo "") then {
    _typeOfDamage = "unknown";
};

// Administration for open wounds and ids
private _openWounds = _unit getVariable [QEGVAR(medical,openWounds), []];
private _woundID = _unit getVariable [QEGVAR(medical,lastUniqueWoundID), 1];

private _extensionOutput = "ace_medical" callExtension format ["HandleDamageWounds,%1,%2,%3,%4", _bodyPart, _damage, _typeOfDamage, _woundID];
TRACE_1("",_extensionOutput);

// these are default values and modified by _extensionOutput
private _painToAdd = 0;
private _woundsCreated = [];

call compile _extensionOutput;

{
    _x params ["", "_woundClassIDToAdd", "_bodyPartNToAdd"];

    private _lethalities = (GVAR(woundsData) select _woundClassIDToAdd) select 7;
    {
        if (_x select 0 == _bodyPartNToAdd) exitWith {
            private _lethality = _x select 1;
            if (_lethality > random 1) then {
                [QEGVAR(medical,InjuryFatal), _unit] call CBA_fnc_localEvent;
            };
        };
    } forEach _lethalities;
    
    _foundIndex = -1;
    {
        // Check if we have an id of the given class on the given bodypart already
        if ((_woundClassIDToAdd isEqualTo (_x select 1)) && {_bodyPartNToAdd isEqualTo (_x select 2)}) exitWith {
            _foundIndex = _forEachIndex;
        };
    } forEach _openWounds;

    if (_foundIndex < 0) then {
        // Since it is a new injury, we will have to add it to the open wounds array to store it
        _openWounds pushBack _x;
    } else {
        // We already have one of these, so we are just going to increase the number that we have of it with a new one.
        private _injury = _openWounds select _foundIndex;
        _injury set [3, (_injury select 3) + 1];
    };
} forEach _woundsCreated;

_unit setVariable [QEGVAR(medical,openWounds), _openWounds, true];

[_unit, _bodyPart] call EFUNC(medical_engine,updateBodyPartVisuals);

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setVariable [QEGVAR(medical,lastUniqueWoundID), _woundID, true];
};

[_unit, _painToAdd] call EFUNC(medical,addPain);
[_unit, "hit", PAIN_TO_SCREAM(_painToAdd)] call EFUNC(medical_engine,playInjuredSound);

TRACE_5("exit",_unit, _painToAdd, _unit getVariable QEGVAR(medical,pain), _unit getVariable QEGVAR(medical,openWounds),_woundsCreated);
