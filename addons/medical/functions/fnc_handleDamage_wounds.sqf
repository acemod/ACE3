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
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit", "_selectionName", "_damage", "_typeOfProjectile", "_typeOfDamage", "_bodyPartn", "_woundType", "_injuryTypeInfo", "_allInjuriesForDamageType", "_allPossibleInjuries", "_highestPossibleDamage", "_highestPossibleSpot", "_minDamage", "_openWounds", "_woundID", "_toAddInjury"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_typeOfProjectile = _this select 3;
_typeOfDamage = _this select 4;
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

if (_bodyPartn < 0) exitwith {};

_injuryTypeInfo = missionNamespace getvariable [format[QGVAR(woundInjuryType_%1), _typeOfDamage],[[],[]]];
_allInjuriesForDamageType = _injuryTypeInfo select 2;
_highestPossibleSpot = -1;
_highestPossibleDamage = 0;
_allPossibleInjuries = [];
{
    /*_classType = _x select 0;
    _selections = _x select 1;
    _bloodLoss = _x select 2;
    _pain = _x select 3;*/
    _minDamage = _x select 4;
    if (_damage >= _minDamage) then {
        if (_minDamage > _highestPossibleDamage) then {
            _highestPossibleSpot = _foreachIndex;
            _highestPossibleDamage = _minDamage;
        };
        _allPossibleInjuries pushback _x;
    };
}foreach _allInjuriesForDamageType;

if (_highestPossibleSpot < 0) exitwith {
    // It appears we are dealing with an unknown type of damage.
    if (count _allInjuriesForDamageType == 0) then {

    };
};
_openWounds = _unit getvariable[QGVAR(openWounds), []];
_woundID = 1;
_amountOf = count _openWounds;
if (_amountOf > 0) then { _woundID = (_openWounds select (_amountOf - 1) select 0) + 1; };

{
    if (_x select 0 <= _damage) exitwith {
        for "_i" from 0 to (1+ floor(random(_x select 1)-1)) /* step +1 */ do {
            _toAddInjury =  _allPossibleInjuries select (floor(random (count _allPossibleInjuries)));
            // ID, classname, bodypart, percentage treated, bloodloss rate
            _openWounds pushback [_woundID, _toAddInjury select 0, if (_injuryTypeInfo select 1) then {_bodyPartn} else {floor(random(6))}, 1, _toAddInjury select 2];
            _woundID = _woundID + 1;
        };
    };
}foreach (_injuryTypeInfo select 0);

_unit setvariable [GVAR(openWounds), _openWounds, true];
