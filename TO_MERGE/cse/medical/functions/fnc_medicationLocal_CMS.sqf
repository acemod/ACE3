/**
 * fn_medicationLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_patient","_attributes","_value"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

_attributes = switch (_removeItem) do {
	case "ACE_morphine": {
		[QGVAR(givenMorphine),1,"Morphine"]
	};
	case "ACE_atropine": {
		[QGVAR(givenAtropine),1,"Atropine"]
	};
	case "ACE_epinephrine": {
		[QGVAR(givenEpinephrine),1,"Epinephrine"]
	};
	case "ACE_antiBiotics": {
		[]
	};
	default {[]};
};

if (count _attributes > 1) then {
	[_injuredPerson] spawn FUNC(unitLoop_CMS);
	_value = [_injuredPerson,(_attributes select 0)] call EFUNC(common,getDefinedVariable);
	_value = _value + (_attributes select 1);
	[_injuredPerson,(_attributes select 0),_value] call EFUNC(common,setDefinedVariable);

	_patient = "patient";
	if (_injuredPerson == _treatingPerson) then {
		_patient = "himself";
	};
	[_injuredPerson,"treatment",format["%1 has given %3 %2",[_treatingPerson] call EFUNC(common,getName), (_attributes select 2),_patient]] call FUNC(addActivityToLog_CMS);
[_injuredPerson,_removeItem] call FUNC(addToTriageList_CMS);

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
		_usedMed = [_injuredPerson, _var, 0] call EFUNC(common,getDefinedVariable);
		if (isnil "_usedMed") then {
			_usedMed = 0;
		};
		if (_usedMed > (_overDose + round(random(2)))) then {
			[_injuredPerson] spawn EFUNC(common,setDead);
		};

		_morphineUsed = _injuredPerson getvariable [QGVAR(givenMorphine), 0];
		_epiUsed = _injuredPerson getvariable [QGVAR(givenEpinephrine), 0];
		_atroUsed = _injuredPerson getvariable [QGVAR(givenAtropine), 0];
		_totalUsed = _morphineUsed + _epiUsed + _atroUsed;
		if (_totalUsed > 10) then {
			[_injuredPerson] spawn EFUNC(common,setDead);
		};
		[_injuredPerson,_wearOff,_var] spawn {
			sleep ((_this select 1) + (round(random(30))));
			_amountDecreased = 0;
			_usedMed = [_this select 0, _this select 2] call EFUNC(common,getDefinedVariable);
			if (typeName _usedMed != typeName 0) then {
				_usedMed = 0;
			};
			while {(_usedMed > 0.000000 && _amountDecreased < 1.000000)} do {
				_usedMed = ([_this select 0, _this select 2] call EFUNC(common,getDefinedVariable));
				if ( typeName _usedMed !=  typeName 0) then {
					_usedMed = 0;
				};
				[_this select 0, _this select 2,_usedMed - 0.001] call EFUNC(common,setDefinedVariable);
				_amountDecreased = _amountDecreased + 0.001;
				sleep 1;
			};
		};
	};


	switch (_removeItem) do {
		case "ACE_atropine": {

			_heartRate = [_injuredPerson, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
			//_heartRate = [_injuredPerson, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, -(10 + random(20)), 30] call FUNC(addHeartRateAdjustment_CMS);
					};

					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, -(10 + random(50)), 30] call FUNC(addHeartRateAdjustment_CMS);
						} else {
							[_injuredPerson, -(10 + random(40)), 30] call FUNC(addHeartRateAdjustment_CMS);
						};
					};
				};
				//[_injuredPerson, QGVAR(heartRate),_heartRate] call EFUNC(common,setDefinedVariable);
				[_injuredPerson,(_attributes select 0),5] call _usedMedication;
			};
		};
		case "ACE_epinephrine": {
			_heartRate = [_injuredPerson, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, (10 + random(20)), 30] call FUNC(addHeartRateAdjustment_CMS);
					};

					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, (10 + random(50)), 30] call FUNC(addHeartRateAdjustment_CMS);
						} else {
							[_injuredPerson, (10 + random(40)), 30, {}] call FUNC(addHeartRateAdjustment_CMS);
						};
					};
				};
				[_injuredPerson,(_attributes select 0),3] call _usedMedication;
			};
		};
		case "ACE_morphine": {
			private ["_usedMorphine"];
			_pain = [_injuredPerson, QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable);
			_pain = 0;
			//_pain = _pain - 35;
			if (_pain <= 0) then {
				_pain = 0;
			};
			_heartRate = [_injuredPerson, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
			[format["used morphine: %1",_heartRate]] call EFUNC(common,debug);
			if (alive _injuredPerson) then {
				if (_heartRate > 0) then {
					if (_heartRate <= 40) then {
						[_injuredPerson, -(10 + random(20)), 40] call FUNC(addHeartRateAdjustment_CMS);
					};
					if (_heartRate > 40) then {
						if (_heartRate > 120) then {
							[_injuredPerson, -(10 + random(50)), 40] call FUNC(addHeartRateAdjustment_CMS);
						} else {
							[_injuredPerson, -(10 + random(40)), 40] call FUNC(addHeartRateAdjustment_CMS);
						};
					};
				};
			};
			[_injuredPerson, QGVAR(amountOfPain),_pain] call EFUNC(common,setDefinedVariable);
			[_injuredPerson,(_attributes select 0),4,120] call _usedMedication;
		};
		default {
			[format["default got triggered for medication. %1",_this]] call EFUNC(common,debug);
		};
	};
};
true