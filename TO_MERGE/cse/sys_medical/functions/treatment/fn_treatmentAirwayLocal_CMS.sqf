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
if (!local _injuredPerson) exitwith{["cse_fnc_treatmentAirwayLocal_CMS called on non local machine",3] call cse_fnc_debug; };
[_injuredPerson] spawn cse_fnc_unitLoop_CMS;
if (_treatingPerson == _injuredPerson) exitwith {};


[_injuredPerson,"STR_CSE_CMS_AIRWAY","STR_CSE_CMS_IS_TREATING_YOUR_AIRWAY",0, [([_treatingPerson] call cse_fnc_getName)]] call cse_fnc_sendDisplayMessageTo;
[_injuredPerson,_removeItem] call cse_fnc_addToTriageList_CMS;

_airwayStatus = [_injuredPerson,"cse_airway"] call cse_fnc_getVariable;
if (_airwayStatus > 0) then {
	if (!([_treatingPerson] call cse_fnc_medicClass_CMS)) then {
		_injuredPerson setvariable ["cse_airwayTreated", true, true];
	//	[_injuredPerson,"cse_airway", _airwayStatus - 1] call cse_fnc_getVariable;

	} else {
		if (random (1) > 0.35) then {
			_injuredPerson setvariable ["cse_airwayTreated", true, true];
	//	[_injuredPerson,"cse_airway", _airwayStatus - 1] call cse_fnc_getVariable;
		} else {
			[_injuredPerson] call cse_fnc_setDead_CMS;
		};
	};
};
true