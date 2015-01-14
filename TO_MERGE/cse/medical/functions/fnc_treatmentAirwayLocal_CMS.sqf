/**
 * fn_treatmentAirwayLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_part","_selectionName","_openWounds","_woundsArray","_highest_amount","_highestSpot","_collectiveImpact", "_highestTotal","_totalNumber"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
if (!local _injuredPerson) exitwith{["FUNC(treatmentAirwayLocal_CMS) called on non local machine",3] call EFUNC(common,debug); };
[_injuredPerson] spawn FUNC(unitLoop_CMS);
if (_treatingPerson == _injuredPerson) exitwith {};


[_injuredPerson,"STR_ACE_CMS_AIRWAY","STR_ACE_CMS_IS_TREATING_YOUR_AIRWAY",0, [([_treatingPerson] call EFUNC(common,getName))]] call EFUNC(common,sendDisplayMessageTo);
[_injuredPerson,_removeItem] call FUNC(addToTriageList_CMS);

_airwayStatus = [_injuredPerson,QGVAR(airway)] call EFUNC(common,getDefinedVariable);
if (_airwayStatus > 0) then {
	if (!([_treatingPerson] call FUNC(medicClass_CMS))) then {
		_injuredPerson setvariable [QGVAR(airwayTreated), true, true];
	//	[_injuredPerson,QGVAR(airway), _airwayStatus - 1] call EFUNC(common,getDefinedVariable);

	} else {
		if (random (1) > 0.35) then {
			_injuredPerson setvariable [QGVAR(airwayTreated), true, true];
	//	[_injuredPerson,QGVAR(airway), _airwayStatus - 1] call EFUNC(common,getDefinedVariable);
		} else {
			[_injuredPerson] call FUNC(setDead_CMS);
		};
	};
};
true