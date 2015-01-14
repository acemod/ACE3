/**
 * fn_tourniquetLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

[_injuredPerson,"treatment",format["%1 applied a tourniquet on %2",[_treatingPerson] call EFUNC(common,getName),_selectionName]] call FUNC(addActivityToLog_CMS);
[_injuredPerson,_removeItem] call FUNC(addToTriageList_CMS);
[_injuredPerson] spawn FUNC(unitLoop_CMS);
_part =	[_selectionName] call FUNC(getBodyPartNumber_CMS);
_tourniquets = [_injuredPerson,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
_applyingTo = (_tourniquets select _part) +1 + round(random(100));
_tourniquets set[_part,_applyingTo];
[_injuredPerson,QGVAR(tourniquets),_tourniquets] call EFUNC(common,setDefinedVariable);

[_injuredPerson,_part,_applyingTo] spawn {
	private ["_injuredPerson","_part","_tourniquets","_appliedTo","_totalAmountOfPainAdded"];
	_injuredPerson = _this select 0;
	_part = _this select 1;
	_key = _this select 2;
	sleep 300 + (random(1800));
	_tourniquets = [_injuredPerson,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
	_totalAmountOfPainAdded = 0;
	while {((_tourniquets select _part) == _key)} do {
		// increase pain level
		_pain = [_injuredPerson, QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable);
		_pain = _pain + 0.005;
		_totalAmountOfPainAdded = _totalAmountOfPainAdded + 0.005;
		[_injuredPerson, QGVAR(amountOfPain),_pain] call EFUNC(common,setDefinedVariable);
		sleep 5;
	};

	_pain = [_injuredPerson, QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable);
	if (_pain < _totalAmountOfPainAdded) then {
		_pain = 0;
	} else {
		_pain = _pain - _totalAmountOfPainAdded;
	};
	[_injuredPerson, QGVAR(amountOfPain),_pain] call EFUNC(common,setDefinedVariable);
};
true