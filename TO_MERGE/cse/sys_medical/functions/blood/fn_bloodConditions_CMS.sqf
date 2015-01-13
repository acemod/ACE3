/**
 * fn_bloodConditions_CMS.sqf
 * @Descr: Check if any of the unconscious or dead conditions are true for given unit and if so, make the relevant function calls.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECt, bloodVolume NUMBER, bloodPressure ARRAY, heartRate NUMBER]
 * @Return: void
 * @PublicAPI: false
 */


private ["_unit","_bloodVolume","_bloodPressure","_heartRate","_bloodPressureL","_bloodPressureH","_bloodLoss"];
_unit = _this select 0;
_bloodVolume = _this select 1;
_bloodPressure = _this select 2;
_heartRate = _this select 3;

if ((_unit getvariable["CSE_ENABLE_REVIVE_SETDEAD_F",0]) == 0) then {
	_bloodPressureL = _bloodPressure select 0;
	_bloodPressureH = _bloodPressure select 1;
	if (!(_unit getvariable ["cse_cardiacArrest_CMS",false])) then {
		if (_bloodPressureH > 260) then {
			if (random(1) > 0.7) then {
				[_unit] spawn cse_fnc_cardiacArrest_CMS;
			};
		};
		if (_bloodPressureL < 40 && _heartRate > 190) then {
			if (random(1) > 0.7) then {
				[_unit] spawn cse_fnc_cardiacArrest_CMS;
			};
		};
		if (_bloodPressureH > 145 && _heartRate > 150) then {
			if (random(1) > 0.7) then {
				[_unit] spawn cse_fnc_cardiacArrest_CMS;
			};
		};
		if (_heartRate > 200) then {
			[_unit] spawn cse_fnc_cardiacArrest_CMS;
		};

		if (_heartRate < 20) then {
			[_unit] spawn cse_fnc_cardiacArrest_CMS;
		};
	};
	if ([_unit] call cse_fnc_isAwake) then {
		if (_bloodVolume < 60) then {
			if (random(1) > 0.9) then {
				[_unit] call cse_fnc_setUnconsciousState;
			};
		};
		if (_heartRate < 10 || _bloodPressureH < 30 || _bloodVolume < 20) then {
			[_unit] call cse_fnc_setUnconsciousState; // safety check to at least ensure unconsciousness for units if they are not dead already.
		};
	};
};
if (_bloodVolume < 30) then {
	[_unit] call cse_fnc_setDead_CMS;
};