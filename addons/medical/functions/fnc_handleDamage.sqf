/**
 * fn_handleDamage.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_selectionName","_amountOfDamage","_sourceOfDamage", "_typeOfProjectile","_bodyPartn","_newDamage","_typeOfDamage","_caliber", "_hitPointName", "_returnDamage", "_varCheck"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfProjectile = _this select 4;
_returnDamage = _amountOfDamage;

_bodyPartn = [_selectionName] call FUNC(getBodyPartNumber);

// Check for vehicle crash
if (vehicle _unit != _unit && {_bodyPartn < 0} && {isNull _sourceOfDamage} && {_typeOfProjectile == ""} && {_selectionName == ""}) then {
    if (GVAR(setting_allowVehicleCrashInjuries)) then {
        _bodyPartn = if (random(1)>=0.5) then { 0 } else { 1 };
        _typeOfProjectile = "VehicleCrash";
    };
};

// If it is not a valid bodyPart number, exit because we cannot do anything with it.
if (_bodyPartn < 0) exitwith {0};

// Most likely taking exessive fire damage. Lets exit.
if (isNull _sourceOfDamage && (_selectionName == "head" || isBurning _unit) && _typeOfProjectile == "" && vehicle _unit == _unit) exitwith {
    0
}; // Prefent excessive fire damage

if (local _unit && {([_unit] call FUNC(hasMedicalEnabled))}) then {
    _returnDamage = 0;
    if (_amountOfDamage < 0) then {
        _amountOfDamage = 0;
    };

    // Ensure damage is being handled correctly.
    [_unit, _bodyPartn, _amountOfDamage] call FUNC(setDamageBodyPart);
    _newDamage = [_unit, _amountOfDamage, _bodyPartn] call FUNC(getNewDamageBodyPart);

    // figure out the type of damage so we can use that to determine what injures should be given.
    _typeOfDamage = [_typeOfProjectile] call FUNC(getTypeOfDamage);

    [_unit, _newDamage, _typeOfDamage, _bodyPartn] call FUNC(onInjury_assignOpenWounds);

    if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) > 0) then {
        //[_unit,_newDamage,_typeOfDamage,_bodyPartn] call FUNC(onInjury_assignFractures);
        if (GVAR(setting_allowAirwayInjuries)) then {
            [_unit, _amountOfDamage, _typeOfDamage, _bodyPartn] call FUNC(onInjury_assignAirwayStatus);
        };
    };
    [_unit, _newDamage, _bodyPartn] call FUNC(increasePain);

    if (([_unit, _bodyPartn] call FUNC(determineIfFatal)) || !(alive (vehicle _unit))) then {
        [_unit] call FUNC(setDead);
        _returnDamage = 1;
    } else {
        [_unit] call FUNC(addToInjuredCollection);
        if ([_unit, _bodyPartn] call FUNC(determineIfUnconscious)) then {
            [_unit] call EFUNC(common,setUnconsciousState);
        } else {
            [_unit,_newDamage] call FUNC(handleReactionHit);
        };
    };

    if (!(alive (vehicle _unit))) then {
        _returnDamage = 1;
        [_unit] call FUNC(setDead);
    };
    ["Medical_onHandleDamage", _this] call ace_common_fnc_localEvent;
} else {
    // handle damage thresholds
};

_returnDamage