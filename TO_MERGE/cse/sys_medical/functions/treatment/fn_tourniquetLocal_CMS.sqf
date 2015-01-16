/**
 * fn_tourniquetLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

	[_injuredPerson,"treatment",format["%1 applied a tourniquet on %2",[_treatingPerson] call cse_fnc_getName,_selectionName]] call cse_fnc_addActivityToLog_CMS;
	[_injuredPerson,_removeItem] call cse_fnc_addToTriageList_CMS;
	[_injuredPerson] spawn cse_fnc_unitLoop_CMS;
	_part =	[_selectionName] call cse_fnc_getBodyPartNumber_CMS;
	_tourniquets = [_injuredPerson,"cse_tourniquets"] call cse_fnc_getVariable;
	_applyingTo = (_tourniquets select _part) +1 + round(random(100));
	_tourniquets set[_part,_applyingTo];
	[_injuredPerson,"cse_tourniquets",_tourniquets] call cse_fnc_setVariable;

	[_injuredPerson,_part,_applyingTo] spawn {
		private ["_injuredPerson","_part","_tourniquets","_appliedTo","_totalAmountOfPainAdded"];
		_injuredPerson = _this select 0;
		_part = _this select 1;
		_key = _this select 2;
		sleep 300 + (random(1800));
		_tourniquets = [_injuredPerson,"cse_tourniquets"] call cse_fnc_getVariable;
		_totalAmountOfPainAdded = 0;
		while {((_tourniquets select _part) == _key)} do {
			// increase pain level
			_pain = [_injuredPerson, "cse_pain"] call cse_fnc_getVariable;
			_pain = _pain + 0.005;
			_totalAmountOfPainAdded = _totalAmountOfPainAdded + 0.005;
			[_injuredPerson, "cse_pain",_pain] call cse_fnc_setVariable;
			sleep 5;
		};

		_pain = [_injuredPerson, "cse_pain"] call cse_fnc_getVariable;
		if (_pain < _totalAmountOfPainAdded) then {
			_pain = 0;
		} else {
			_pain = _pain - _totalAmountOfPainAdded;
		};
		[_injuredPerson, "cse_pain",_pain] call cse_fnc_setVariable;
	};
true