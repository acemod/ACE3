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
 * Example:
 * [bob, "leg", 2, kevin, "shot"] call ACE_medical_fnc_handleDamage_wounds
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_selectionName", "_damage", "_typeOfProjectile", "_typeOfDamage"];
TRACE_6("ACE_DEBUG: HandleDamage Called",_unit, _selectionName, _damage, _shooter, _typeOfProjectile,_typeOfDamage);

if (_typeOfDamage == "") then {_typeOfDamage = "unknown";};

// Administration for open wounds and ids
private _openWounds = _unit getVariable[QGVAR(openWounds), []];
private _woundID = _unit getVariable[QGVAR(lastUniqueWoundID), 1];

private _extensionOutput = "ace_medical" callExtension format ["HandleDamageWounds,%1,%2,%3,%4", _selectionName, _damage, _typeOfDamage, _woundID];

private _painToAdd = 0;
private _woundsCreated = [];

call compile _extensionOutput;
{
    _x params ["", "_toAddClassID", "_bodyPartNToAdd"];
    _foundIndex = -1;
    {
        _x params ["", "_compareId", "_comparyBodyPartN"];
        // Check if we have an id of the given class on the given bodypart already
        if (_compareId == _toAddClassID && {_comparyBodyPartN == _bodyPartNToAdd}) exitWith {
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

_unit setVariable [QGVAR(openWounds), _openWounds, true];

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setVariable [QGVAR(lastUniqueWoundID), _woundID, true];
};

private _painLevel = _unit getVariable [QGVAR(pain), 0];
_unit setVariable [QGVAR(pain), _painLevel + _painToAdd];
TRACE_6("ACE_DEBUG: HandleDamage_WoundsOLD",_unit, _painLevel, _painToAdd, _unit getVariable QGVAR(pain), _unit getVariable QGVAR(openWounds),_woundsCreated);
