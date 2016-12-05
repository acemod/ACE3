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

// todo: Make the pain and bleeding calculations part of the extension again
private _painLevel = 0;
{
    _x params ["", "_woundClassIDToAdd", "_bodyPartNToAdd", "", "_bleeding"];

    // The higher the nastiness likelihood the higher the change to get a painful and bloody wound 
    private _nastinessLikelihood = if (_damage > 1) then {
        (_damage ^ 0.33)
    } else {
        (0.1 max _damage)
    };
    private _bloodiness   = 0.01 + 0.99 * (1 - random[0, 1, 0.9]) ^ (1 / _nastinessLikelihood);
    private _painfullness = 0.05 + 0.95 * (1 - random[0, 1, 0.5]) ^ (1 / _nastinessLikelihood);
    
    _bleeding = _bleeding * _bloodiness;
    
    _x set [4, _bleeding];
    _x set [5, _damage];
    
    private _pain = ((GVAR(woundsData) select _woundClassIDToAdd) select 3) * _painfullness;
    _painLevel = _painLevel max _pain;
    
#ifdef DEBUG_MODE_FULL
    systemChat format["%1, damage: %2, peneration: %3, bleeding: %4, pain: %5", _bodyPart, round(_damage * 100) / 100, _damage > PENETRATION_THRESHOLD, round(_bleeding * 1000) / 1000, round(_pain * 1000) / 1000];
#endif

    if (_bodyPartNToAdd == 0 && {_damage > 1}) then {
        [QEGVAR(medical,FatalInjury), _unit] call CBA_fnc_localEvent;
    };

    // todo `forceWalk` based on leg damage
    private _causeLimping = (GVAR(woundsData) select _woundClassIDToAdd) select 7;
    if (_causeLimping == 1 && {_damage > 0.3} && {_bodyPartNToAdd > 3}) then {
        [_unit, true] call EFUNC(medical_engine,setLimping);
    };

    _openWounds pushBack _x;
} forEach _woundsCreated;

_unit setVariable [QEGVAR(medical,openWounds), _openWounds, true];

[_unit, _bodyPart] call EFUNC(medical_engine,updateBodyPartVisuals);

// Only update if new wounds have been created
if (count _woundsCreated > 0) then {
    _unit setVariable [QEGVAR(medical,lastUniqueWoundID), _woundID, true];
    [_unit] call EFUNC(medical,handleIncapacitation);
};

[_unit, _painLevel] call EFUNC(medical,adjustPainLevel);
[_unit, "hit", PAIN_TO_SCREAM(_painLevel)] call EFUNC(medical_engine,playInjuredSound);

TRACE_5("exit",_unit,_painLevel,_unit getVariable QEGVAR(medical,pain),_unit getVariable QEGVAR(medical,openWounds),_woundsCreated);
