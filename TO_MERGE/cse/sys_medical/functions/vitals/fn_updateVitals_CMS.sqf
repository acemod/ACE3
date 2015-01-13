/**
 * fn_updateVitals_CMS.sqf
 * @Descr: Updates the vitals. Is expected to be called every second.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */

private ["_unit", "_heartRate","_bloodPressure","_bloodVolume","_painStatus"];
_unit = _this select 0;

_heartRate = [_unit, "cse_heartRate"] call cse_fnc_getVariable;
_bloodVolume = ([_unit, "cse_bloodVolume"] call cse_fnc_getVariable) + ([_unit] call cse_fnc_getBloodVolumeChange_CMS);
_heartRate = _heartRate + ([_unit] call cse_fnc_getHeartRateChange_CMS);
_bloodPressure = [_unit] call cse_fnc_getBloodPressure_CMS;
_painStatus = [_unit,"cse_pain",0] call cse_fnc_getVariable;

if (_bloodVolume <= 0) then {
	_bloodVolume = 0;
};

_unit setvariable  ["cse_bloodVolume", _bloodVolume];
_unit setvariable  ["cse_bloodPressure", _bloodPressure];
_unit setvariable  ["cse_heartRate", _heartRate];

if (_bloodVolume < 90) then {
	if !(_unit getvariable ["cse_hasLostBlood_CMS",false]) then {
		_unit setvariable ["cse_hasLostBlood_CMS", true, true];
	};
} else {
	if (_unit getvariable ["cse_hasLostBlood_CMS",false]) then {
		_unit setvariable ["cse_hasLostBlood_CMS", false, true];
	};
};

if ((_unit call cse_fnc_getBloodLoss_CMS) > 0) then {
	if !(_unit getvariable ["cse_isBleeding_CMS",false]) then {
		_unit setvariable ["cse_isBleeding_CMS", true, true];
	};
} else {
	if (_unit getvariable ["cse_isBleeding_CMS",false]) then {
		_unit setvariable ["cse_isBleeding_CMS", false, true];
	};
};

if (_painStatus > 0) then {
	if !(_unit getvariable ["cse_hasPain_CMS",false]) then {
		_unit setvariable ["cse_hasPain_CMS", true, true];
	};
} else {
	if (_unit getvariable ["cse_hasPain_CMS",false]) then {
		_unit setvariable ["cse_hasPain_CMS", false, true];
	};
};


if (CSE_ALLOW_AIRWAY_INJURIES_CMS) then {
	_airwayStatus = _unit getvariable ["cse_airwayStatus", 100];
	if (((_unit getvariable ["cse_airwayOccluded", false]) || (_unit getvariable ["cse_airwayCollapsed", false])) && !((_unit getvariable ["cse_airwaySecured", false]))) then {
		if (_airwayStatus >= 0.5) then {
			_unit setvariable ["cse_airwayStatus", _airwayStatus - 0.5];
		};
	} else {
		if !((_unit getvariable ["cse_airwayOccluded", false]) || (_unit getvariable ["cse_airwayCollapsed", false])) then {
			if (_airwayStatus <= 98.5) then {
				_unit setvariable ["cse_airwayStatus", _airwayStatus + 1.5];
			};
		};
	};
};

[_unit,_bloodVolume,_bloodPressure,_heartRate] call cse_fnc_bloodConditions_CMS;