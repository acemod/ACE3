/**
 * fn_handleDamage_CMS.sqf
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

_bodyPartn = [_selectionName] call FUNC(getBodyPartNumber_CMS);

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

if (local _unit && {([_unit] call FUNC(hasMedicalEnabled_CMS))}) then {
	_returnDamage = 0;
	if (_amountOfDamage < 0) then {
		_amountOfDamage = 0;
	};

	// Ensure damage is being handled correctly.
	[_unit, _bodyPartn, _amountOfDamage] call FUNC(damageBodyPart_CMS);
	_newDamage = [_unit, _amountOfDamage, _bodyPartn] call FUNC(getNewDamageBodyPart_CMS);

	// figure out the type of damage so we can use that to determine what injures should be given.
	_typeOfDamage = [_typeOfProjectile] call FUNC(getTypeOfDamage_CMS);

	[_unit, _newDamage, _typeOfDamage, _bodyPartn] call FUNC(assignOpenWounds_CMS);

	if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) > 0) then {
		//[_unit,_newDamage,_typeOfDamage,_bodyPartn] call FUNC(assignFractures_CMS);
		if (GVAR(setting_allowAirwayInjuries)) then {
			[_unit, _amountOfDamage, _typeOfDamage, _bodyPartn] call FUNC(assignAirwayStatus_CMS);
		};
	};
	[_unit,_newDamage,_bodyPartn] call FUNC(increasePain_CMS);

	if (([_unit, _bodyPartn] call FUNC(determineIfFatal_CMS)) || !(alive (vehicle _unit))) then {
		[_unit] call FUNC(setDead_CMS);
		_returnDamage = 1;
	} else {
		[_unit] call FUNC(unitLoop_CMS);
		if ([_unit, _bodyPartn] call FUNC(determineIfUnconscious_CMS)) then {
			[_unit] call EFUNC(common,setUnconsciousState);
		} else {
			[_unit,_newDamage] call FUNC(reactionToHit_CMS);
		};
		if (_returnDamage > 0.95) then {
			_returnDamage = 0.95;
		};
	};

	if (!(alive (vehicle _unit))) then {
		_returnDamage = 1;
		[_unit] call FUNC(setDead_CMS);
	};
} else {
	// handle damage thresholds
};

_returnDamage