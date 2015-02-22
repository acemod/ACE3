/*
 * Author: Glowbal, KoffeinFlummi
 * Starts the treatment process
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_config", "_availableLevels", "_medicRequired", "_items", "_locations", "_return", "_callbackSuccess", "_callbackFailure", "_onProgress", "_treatmentTime", "_callerAnim", "_patietAnim"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;

_config = (ConfigFile >> "ACE_Medical_Treatments" >> "Basic" >> _className);
if (GVAR(level)>=1) then {
	_config = (ConfigFile >> "ACE_Medical_Treatments" >> "Advanced" >> _className);
};
if !(isClass _config) exitwith {false};

_medicRequired = getNumber (_config >> "requiredMedic");
if !([_caller, _medicRequired] call FUNC(isMedic) || [_target, _medicRequired] call FUNC(isMedic)) exitwith {false};

_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitwith {false};

_locations = getArray (_config >> "treatmentLocations");

_return = false;
if ("All" in _locations) then {
	_return = true;
} else {
	{
		if (_x == "field") exitwith {_return = true;};
		if (_x == "MedicalFacility" && {([_caller] call FUNC(isInMedicalFacility)) || ([_target] call FUNC(isInMedicalFacility))}) exitwith {_return = true;};
		if (_x == "MedicalVehicle" && {([vehicle _caller] call FUNC(isMedicalVehicle)) || ([vehicle _target] call FUNC(isMedicalVehicle))}) exitwith {_return = true;};
	}foreach _locations;
};
if !(_return) exitwith {false};


// Parse the config for the success callback
_callbackSuccess = getText (_config >> "callbackSuccess");
if (isNil _callbackSuccess) then {
	_callbackSuccess = compile _callbackSuccess;
} else {
	_callbackSuccess = missionNamespace getvariable _callbackSuccess;
};

// Parse the config for the failure callback
_callbackFailure = getText (_config >> "callbackFailure");
if (isNil _callbackFailure) then {
	_callbackFailure = compile _callbackFailure;
} else {
	_callbackFailure = missionNamespace getvariable _callbackFailure;
};

// Parse the config for the onProgress callback
_onProgress = getText (_config >> "onProgress");
if (isNil _onProgress) then {
	_onProgress = compile _onProgress;
} else {
	_onProgress = missionNamespace getvariable _onProgress;
};

_treatmentTime = getNumber (_config >> "treatmentTime");
[_treatmentTime, [_caller, _target, _selectionName, _className, _items], _callbackSuccess, _callbackFailure, (localize ""), _onProgress] call EFUNC(common,progressBar);

_callerAnim = getText (_config >> "animationCaller");
_patietAnim = getText (_confg >> "animationPatient");

if (_caller != _target && {vehicle _target == _target} && {_patietAnim != ""}) then {
	[_target, _patietAnim] call EFUNC(common,doAnimation);
};
if (vehicle _caller == _caller && {_callerAnim != ""}) then {
	if (primaryWeapon _caller == "") then {
	    _caller addWeapon "ACE_FakePrimaryWeapon";
	};
	_caller selectWeapon (primaryWeapon _caller);
	_caller setvariable [QGVAR(treatmentPrevAnimCaller), animationState _target];
	[_caller, _callerAnim] call EFUNC(common,doAnimation);
};

true;
