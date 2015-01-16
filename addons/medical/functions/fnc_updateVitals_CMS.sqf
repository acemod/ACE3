/**
 * fn_updateVitals_CMS.sqf
 * @Descr: Updates the vitals. Is expected to be called every second.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_heartRate","_bloodPressure","_bloodVolume","_painStatus"];
_unit = _this select 0;

_bloodVolume = ([_unit, QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) + ([_unit] call FUNC(getBloodVolumeChange_CMS));
if (_bloodVolume <= 0) then {
	_bloodVolume = 0;
};
_unit setvariable  [QGVAR(bloodVolume), _bloodVolume];


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

_painStatus = [_unit,QGVAR(amountOfPain),0] call EFUNC(common,getDefinedVariable);
if (_painStatus > 0) then {
	if !(_unit getvariable [QGVAR(hasPain),false]) then {
		_unit setvariable [QGVAR(hasPain), true, true];
	};
} else {
	if (_unit getvariable [QGVAR(hasPain),false]) then {
		_unit setvariable [QGVAR(hasPain), false, true];
	};
};

_heartRate = [_unit, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);

// handle advanced medical, with vitals
if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) > 0) exitwith {
	_heartRate = _heartRate + ([_unit] call FUNC(getHeartRateChange_CMS));
	_bloodPressure = [_unit] call FUNC(getBloodPressure_CMS);
	_unit setvariable  [QGVAR(bloodPressure), _bloodPressure];
	_unit setvariable  [QGVAR(heartRate), _heartRate];

	if (GVAR(setting_allowAirwayInjuries)) then {
		_airwayStatus = _unit getvariable [QGVAR(airwayStatus), 100];
		if (((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) && !((_unit getvariable [QGVAR(airwaySecured), false]))) then {
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
};

// handle basic medical, without any vitals
if (_bloodVolume < 30) exitwith {
	[_unit] call FUNC(setDead_CMS);
};

if ([_unit] call EFUNC(common,isAwake)) then {
	if (_bloodVolume < 60) then {
		if (random(1) > 0.9) then {
			[_unit] call EFUNC(common,setUnconsciousState);
		};
	};
};
