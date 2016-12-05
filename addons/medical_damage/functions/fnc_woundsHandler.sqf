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
    _x params ["", "_woundClassIDToAdd", "_bodyPartNToAdd", "", "_bleeding"];
    
    // How much pain and bleeding does the wound induce?
    private _nastiness = random(round(_damage ^ 2));
    // 10 % baseline damage + 90 % random damage
    private _inducedDamage = (0.1 * _damage) + (0.9 * _damage) * (1 - (0.99 ^ _nastiness));

    _x set [4, _bleeding * _inducedDamage];
    
    private _pain = ((GVAR(woundsData) select _woundClassIDToAdd) select 3) * _inducedDamage / 3;
    _x pushBack _pain;
    _painToAdd = _painToAdd + _pain;
    
    _x pushBack _inducedDamage;
    
    if (_bodyPartNToAdd == 0 && {_damage > 1}) then {
        [QEGVAR(medical,InjuryFatal), _unit] call CBA_fnc_localEvent;
    };
    
    private _causeLimping = (GVAR(woundsData) select _woundClassIDToAdd) select 7;
    if (_causeLimping == 1 && {_inducedDamage > 0.3} && {_bodyPartNToAdd > 3}) then {
        [_unit, true] call EFUNC(medical_engine,setLimping);
    };
    
    // @todo merge into existing wounds in an intelligent manner
    _openWounds pushBack _x;
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
