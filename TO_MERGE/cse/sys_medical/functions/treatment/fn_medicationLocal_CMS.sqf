/**
 * fn_medicationLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_patient","_attributes","_value"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

_attributes = switch (_removeItem) do {
	case "cse_morphine": {
		["cse_givenMorphine",1,"Morphine"]
	};
	case "cse_atropine": {
		["cse_givenAtropine",1,"Atropine"]
	};
	case "cse_epinephrine": {
		["cse_givenEpinephrine",1,"Epinephrine"]
	};
	case "cse_antiBiotics": {
		[]
	};
	default {[]};
};

if (count _attributes > 1) then {
	[_injuredPerson] spawn cse_fnc_unitLoop_CMS;
	_value = [_injuredPerson,(_attributes select 0)] call cse_fnc_getVariable;
	_value = _value + (_attributes select 1);
	[_injuredPerson,(_attributes select 0),_value] call cse_fnc_setVariable;

	_patient = "patient";
	if (_injuredPerson == _treatingPerson) then {
		_patient = "himself";
	};
	[_injuredPerson,"treatment",format["%1 has given %3 %2",[_treatingPerson] call cse_fnc_getName, (_attributes select 2),_patient]] call cse_fnc_addActivityToLog_CMS;
[_injuredPerson,_removeItem] call cse_fnc_addToTriageList_CMS;

	_usedMedication = {
		private ["_injuredPerson","_var","_usedMed","_morphineUsed","_epiUsed","_atroUsed","_totalUsed"];
		_injuredPerson = _this select 0;
		_var = _this select 1;
		_overDose = 5;
		_wearOff = 120;

		if (!alive _injuredPerson) exitwith{};
		if (count _this > 2) then {
			_overDose = _this select 2;
			if (count _this > 3) then {
				_wearOff = _this select 3;
			};
		};
		_usedMed = [_injuredPerson, _var, 0] call cse_fnc_getVariable;
		if (isnil "_usedMed") then {
			_usedMed = 0;
		};
		if (_usedMed > (_overDose + round(random(2)))) then {
			[_injuredPerson] spawn cse_fnc_setDead;
		};

		_morphineUsed = _injuredPerson getvariable ["cse_givenMorphine", 0];
		_epiUsed = _injuredPerson getvariable ["cse_givenEpinephrine", 0];
		_atroUsed = _injuredPerson getvariable ["cse_givenAtropine", 0];
		_totalUsed = _morphineUsed + _epiUsed + _atroUsed;
		if (_totalUsed > 10) then {
			[_injuredPerson] spawn cse_fnc_setDead;
		};
		[_injuredPerson,_wearOff,_var] spawn {
			sleep ((_this select 1) + (round(random(30))));
			_amountDecreased = 0;
			_usedMed = [_this select 0, _this select 2] call cse_fnc_getVariable;
			if (typeName _usedMed != typeName 0) then {
				_usedMed = 0;
			};
			while {(_usedMed > 0.000000 && _amountDecreased < 1.000000)} do {
				_usedMed = ([_this select 0, _this select 2] call cse_fnc_getVariable);
				if ( typeName _usedMed !=  typeName 0) then {
					_usedMed = 0;
				};
				[_this select 0, _this select 2,_usedMed - 0.001] call cse_fnc_setVariable;
				_amountDecreased = _amountDecreased + 0.001;
				sleep 1;
			};
		};
	};


	switch (_removeItem) do {
		case "cse_atropine": {

			_heartRate = [_injuredPerson, "cse_heartRate"] call cse_fnc_getVariable;
			//_heartRate = [_injuredPerson, "cse_heartRate"] call cse_fnc_getVariable;
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, -(10 + random(20)), 30] call cse_fnc_addHeartRateAdjustment_CMS;
					};

					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, -(10 + random(50)), 30] call cse_fnc_addHeartRateAdjustment_CMS;
						} else {
							[_injuredPerson, -(10 + random(40)), 30] call cse_fnc_addHeartRateAdjustment_CMS;
						};
					};
				};
				//[_injuredPerson, "cse_heartRate",_heartRate] call cse_fnc_setVariable;
				[_injuredPerson,(_attributes select 0),5] call _usedMedication;
			};
		};
		case "cse_epinephrine": {
			_heartRate = [_injuredPerson, "cse_heartRate"] call cse_fnc_getVariable;
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, (10 + random(20)), 30] call cse_fnc_addHeartRateAdjustment_CMS;
					};

					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, (10 + random(50)), 30] call cse_fnc_addHeartRateAdjustment_CMS;
						} else {
							[_injuredPerson, (10 + random(40)), 30, {}] call cse_fnc_addHeartRateAdjustment_CMS;
						};
					};
				};
				[_injuredPerson,(_attributes select 0),3] call _usedMedication;
			};
		};
		case "cse_morphine": {
			private ["_usedMorphine"];
			_pain = [_injuredPerson, "cse_pain"] call cse_fnc_getVariable;
			_pain = 0;
			//_pain = _pain - 35;
			if (_pain <= 0) then {
				_pain = 0;
			};
			_heartRate = [_injuredPerson, "cse_heartRate"] call cse_fnc_getVariable;
			[format["used morphine: %1",_heartRate]] call cse_fnc_debug;
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, -(10 + random(20)), 40] call cse_fnc_addHeartRateAdjustment_CMS;
					};
					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, -(10 + random(50)), 40] call cse_fnc_addHeartRateAdjustment_CMS;
						} else {
							[_injuredPerson, -(10 + random(40)), 40] call cse_fnc_addHeartRateAdjustment_CMS;
						};
					};
				};
			};
			[_injuredPerson, "cse_pain",_pain] call cse_fnc_setVariable;
			[_injuredPerson,(_attributes select 0),4,120] call _usedMedication;
		};
		default {
			[format["default got triggered for medication. %1",_this]] call cse_fnc_debug;
		};
	};
};
true