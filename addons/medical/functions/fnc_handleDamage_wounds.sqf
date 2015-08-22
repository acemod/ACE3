/*
 * Author: Glowbal
 * Handling of the open wounds & injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
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

private ["_bodyPartn", "_injuryTypeInfo", "_allInjuriesForDamageType", "_allPossibleInjuries", "_highestPossibleDamage", "_highestPossibleSpot", "_minDamage", "_openWounds", "_woundID", "_toAddInjury", "_painToAdd", "_bloodLoss", "_bodyPartNToAdd", "_classType", "_damageLevels", "_foundIndex", "_i", "_injury", "_maxDamage", "_pain", "_painLevel", "_selections", "_toAddClassID", "_woundsCreated"];
params ["_unit", "_selectionName", "_damage", "_typeOfProjectile", "_typeOfDamage"];

// Administration for open wounds and ids
_openWounds = _unit getvariable[QGVAR(openWounds), []];
_woundID = _unit getvariable[QGVAR(lastUniqueWoundID), 1];

_extensionOutput = "ace_medical" callExtension format ["HandleDamageWounds,%1,%2,%3,%4", _selectionName, _damage, _typeOfDamage, _woundID];

_painToAdd = 0;
_woundsCreated = [];

call compile _extensionOutput;
_foundIndex = -1;
{
    _x params ["_toAddClassID", "_bodyPartNToAdd"];
    {
        // Check if we have an id of the given class on the given bodypart already
        if (_x select 1 == _toAddClassID && {_x select 2 == _bodyPartNToAdd}) exitwith {
            _foundIndex = _foreachIndex;
        };
    } foreach _openWounds;

    if (_foundIndex < 0) then {
        // Since it is a new injury, we will have to add it to the open wounds array to store it
        _openWounds pushback _x;
    } else {
        // We already have one of these, so we are just going to increase the number that we have of it with a new one.
        _injury = _openWounds select _foundIndex;
        _injury set [3, (_injury select 3) + 1];
    };
} foreach _woundsCreated;

_unit setvariable [QGVAR(openWounds), _openWounds, true];

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setvariable [QGVAR(lastUniqueWoundID), _woundID, true];
};

_painLevel = _unit getvariable [QGVAR(pain), 0];
_unit setvariable [QGVAR(pain), _painLevel + _painToAdd];
