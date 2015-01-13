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

_heartRate = [_unit, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
_bloodVolume = ([_unit, QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) + ([_unit] call FUNC(getBloodVolumeChange_CMS));
_heartRate = _heartRate + ([_unit] call FUNC(getHeartRateChange_CMS));
_bloodPressure = [_unit] call FUNC(getBloodPressure_CMS);
_painStatus = [_unit,QGVAR(amountOfPain),0] call EFUNC(common,getDefinedVariable);

if (_bloodVolume <= 0) then {
	_bloodVolume = 0;
};

_unit setvariable  [QGVAR(bloodVolume), _bloodVolume];
_unit setvariable  [QGVAR(bloodPressure), _bloodPressure];
_unit setvariable  [QGVAR(heartRate), _heartRate];

if (_bloodVolume < 90) then {
	if !(_unit getvariable [QGVAR(hasLostBlood),false]) then {
		_unit setvariable [QGVAR(hasLostBlood), true, true];
	};
} else {
	if (_unit getvariable [QGVAR(hasLostBlood),false]) then {
		_unit setvariable [QGVAR(hasLostBlood), false, true];
	};
};

if ((_unit call FUNC(getBloodLoss_CMS)) > 0) then {
	if !(_unit getvariable [QGVAR(isBleeding),false]) then {
		_unit setvariable [QGVAR(isBleeding), true, true];
	};
} else {
	if (_unit getvariable [QGVAR(isBleeding),false]) then {
		_unit setvariable [QGVAR(isBleeding), false, true];
	};
};

if (_painStatus > 0) then {
	if !(_unit getvariable [QGVAR(hasPain),false]) then {
		_unit setvariable [QGVAR(hasPain), true, true];
	};
} else {
	if (_unit getvariable [QGVAR(hasPain),false]) then {
		_unit setvariable [QGVAR(hasPain), false, true];
	};
};


if (GVAR(ALLOW_AIRWAY_INJURIES)) then {
	_airwayStatus = _unit getvariable [QGVAR(airwayStatus), 100];
	if (((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) && !((_unit getvariable ["cse_airwaySecured", false]))) then {
		if (_airwayStatus >= 0.5) then {
			_unit setvariable [QGVAR(airwayStatus), _airwayStatus - 0.5];
		};
	} else {
		if !((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) then {
			if (_airwayStatus <= 98.5) then {
				_unit setvariable [QGVAR(airwayStatus), _airwayStatus + 1.5];
			};
		};
	};
};

[_unit,_bloodVolume,_bloodPressure,_heartRate] call FUNC(BloodConditions_CMS);