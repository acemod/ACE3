/**
 * fn_updateAttributes_CMS.sqf
 * @Descr: This is the old update vitals script. It is here just in case we need to make the switch back to the old version but is not used.
 * @Author: Glowbal
 * @DEPRECATED
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */


// OLD ALGHORIM
private ["_unit","_bloodVolume","_bloodPressure","_bloodPressureLow","_bloodPressureHigh","_heartRate","_totalBloodLoss","_hrIncrease","_bpIncreaseHigh","_bpIncreaseLow","_speed","_ivVolume","_painStatus","_showedHint", "_modifier"];
_unit = _this select 0;

_bloodVolume = [_unit,"cse_bloodVolume"] call cse_fnc_getVariable;
_bloodPressure = [_unit,"cse_bloodPressure"] call cse_fnc_getVariable;
_bloodPressureLow = _bloodPressure select 0;
_bloodPressureHigh = _bloodPressure select 1;
_heartRate = [_unit,"cse_heartRate"] call cse_fnc_getVariable;
_painStatus = [_unit,"cse_pain",0] call cse_fnc_getVariable;
_totalBloodLoss = _unit call cse_fnc_getBloodLoss_CMS;
_hrIncrease = 0;
_bpIncreaseHigh = 0;
_bpIncreaseLow = 0;

//	_totalBloodLoss affecting Heart Rate and bloodpressure

	if (_totalBloodLoss >0.0) then {
		if (_totalBloodLoss <0.5) then {
			if (_heartRate < 126) then {
				_hrIncrease = _hrIncrease + 0.5;
			};
		} else {
			if (_totalBloodLoss < 1) then {
				if (_heartRate < 161) then {
					_hrIncrease = _hrIncrease + 1;
				};
				if (_bloodPressureLow > 60 && _bloodVolume < 95) then {
					_bpIncreaseLow = _bpIncreaseLow - 0.5;
				};
			} else {
				if (_heartRate < 220) then {
					_hrIncrease = _hrIncrease + 1.5;
				};
				if (_bloodPressureLow > 60 && _bloodVolume < 95) then {
					_bpIncreaseLow = _bpIncreaseLow - 2;
				};
			};
		};
	};

	if ((_totalBloodLoss == 0) && _bloodVolume > 80) then {
		if (_bloodPressureLow < 80) then {
			_bpIncreaseLow = _bpIncreaseLow + 1;
		};
		if (_bloodPressureHigh < 120) then {
			_bpIncreaseHigh = _bpIncreaseHigh + 1;
		};
		if (_bloodPressureLow > 100) then {
			_bpIncreaseLow = _bpIncreaseLow - 1;
		};
		if (_bloodPressureHigh > 120) then {
			_bpIncreaseHigh = _bpIncreaseHigh - 1;
		};
	};

	//	affecting Heart Rate
	if !(_unit getvariable ["cse_cardiacArrest",false]) then {
		if (_bloodPressureLow > 50 && _bloodPressureHigh < 130) then {
			if (_bloodPressureHigh > 70 && _bloodPressureHigh < 190) then {
				_speed = abs(speed _unit);
				if (_speed > 0 && _bloodVolume > 60) then {
						if (_speed > 10 && (vehicle _unit == _unit)) then {
							if (_heartRate <100) then {
								_hrIncrease = _hrIncrease + (_speed/200);
							};
						};
				} else {
					if (_bloodVolume > 60 && _totalBloodLoss == 0) then {
						if (_heartRate < (60 + round(random(10)))) then {
							_hrIncrease = _hrIncrease + 0.2;
						} else {
							if (_heartRate > (77 + round(random(10)))) then {
								_hrIncrease = _hrIncrease - 0.2;
							};
						};
					};
				};
				if (_bloodVolume < 60 && _bloodPressureLow<60 && _bloodPressureHigh < 90 && _hrIncrease <1) then {
					_hrIncrease = _hrIncrease + 1;
				};
				if (_bloodVolume < 40) then {
					_hrIncrease = _hrIncrease - 3;
				};
			};
		} else {
		};
	};

	if (_heartRate > 10) then {
		if (_totalBloodLoss == 0 && _hrIncrease>0) then {
			_bpIncreaseLow = _bpIncreaseLow + (_hrIncrease/2);
			_bpIncreaseHigh = _bpIncreaseHigh + (_hrIncrease/2)
		};

		if (_hrIncrease<0) then {
			_bpIncreaseLow = _bpIncreaseLow - 0.5;
			_bpIncreaseHigh = _bpIncreaseHigh - 1.5;
		};
		if (_totalBloodLoss > 0 && _totalBloodLoss < 1 && _hrIncrease>0) then {
			_bpIncreaseLow = _bpIncreaseLow + 0.03;
			_bpIncreaseHigh = _bpIncreaseHigh + 0.03;
		};
	};
	_showedHint = false;
	if (_totalBloodLoss >0) then {
		if !(_unit getvariable ["cse_isBleeding_CMS",false]) then {
			[_unit, "cse_isBleeding_CMS",true] call cse_fnc_setVariable;
			if (CSE_DISPLAY_ADDITIONAL_HINTS_CMS) then {
				_showedHint = true;
				[_unit,"Injured","You are bleeding!",1] call cse_fnc_sendDisplayMessageTo;
			};
		};
	} else {
		if (_unit getvariable ["cse_isBleeding_CMS",false]) then {
			[_unit, "cse_isBleeding_CMS",false] call cse_fnc_setVariable;
		};
	};
	if (_painStatus > 0) then {
		if !(_unit getvariable ["cse_hasPain_CMS",false]) then {
			[_unit, "cse_hasPain_CMS",true] call cse_fnc_setVariable;
			if (CSE_DISPLAY_ADDITIONAL_HINTS_CMS && !_showedHint) then {
				[_unit,"Injured","You are in Pain!",1] call cse_fnc_sendDisplayMessageTo;
			};
		};

	} else {
		if (_unit getvariable ["cse_hasPain_CMS",false]) then {
			[_unit, "cse_hasPain_CMS",false] call cse_fnc_setVariable;
		};
	};

_modifier = 1;
if (!([_unit] call cse_fnc_isAwake)) then {
	_modifier = 0.5;
};

_bloodVolume = _bloodVolume - (_totalBloodLoss * _modifier);

	_heartRate = _heartRate + (_hrIncrease * _modifier);
	_bloodPressureLow = _bloodPressureLow + (_bpIncreaseLow * _modifier);
	_bloodPressureHigh = _bloodPressureHigh + (_bpIncreaseHigh * _modifier);
	// Safety checks, prefent values below zero
	if (_bloodPressureLow <0) then {
		_bloodPressureLow = 0;
	};
	if (_bloodPressureHigh < _bloodPressureLow) then {
		_bloodPressureHigh = _bloodPressureLow + 10;
	};
	_bloodPressure = [_bloodPressureLow, _bloodPressureHigh];

	if (_heartRate <0) then {
		_heartRate = 0;
	};

if (_bloodVolume < 100.0) then {
	if (_bloodVolume <0) then {
		_bloodVolume = 0;
	};
	if (([_unit,"cse_salineIVVolume",0] call cse_fnc_getvariable) > 0) then {
		_bloodVolume = _bloodVolume + 0.2;
		_ivVolume = ([_unit,"cse_salineIVVolume",0] call cse_fnc_getvariable) - 0.2;
		_unit setvariable ["cse_salineIVVolume",_ivVolume];
	};
	if (([_unit,"cse_plasmaIVVolume",0] call cse_fnc_getvariable) > 0) then {
		_bloodVolume = _bloodVolume + 0.2;
		_ivVolume = ([_unit,"cse_plasmaIVVolume",0] call cse_fnc_getvariable) - 0.2;
		_unit setvariable ["cse_plasmaIVVolume",_ivVolume];
	};
	if (([_unit,"cse_bloodIVVolume",0] call cse_fnc_getvariable) > 0) then {
		_bloodVolume = _bloodVolume + 0.2;
		_ivVolume = ([_unit,"cse_bloodIVVolume",0] call cse_fnc_getvariable) - 0.2;
		_unit setvariable ["cse_bloodIVVolume",_ivVolume];
	};

} else {
	if (_bloodVolume > 100) then {
		_bloodVolume = 100;
	};
};

if (_bloodVolume < 90) then {
	if !(_unit getvariable ["cse_hasLostBlood_CMS",false]) then {
		[_unit, "cse_hasLostBlood_CMS",true] call cse_fnc_setVariable;
	};
} else {
	if (_unit getvariable ["cse_hasLostBlood_CMS",false]) then {
		[_unit, "cse_hasLostBlood_CMS",false] call cse_fnc_setVariable;
	};
};

[_unit,"cse_bloodVolume",_bloodVolume] call cse_fnc_setVariable;
[_unit,"cse_bloodPressure",_bloodPressure] call cse_fnc_setVariable;
[_unit,"cse_heartRate",_heartRate] call cse_fnc_setVariable;


[_unit,_bloodVolume,_bloodPressure,_heartRate] call cse_fnc_bloodConditions_CMS;