/**
 * fn_getAirwayOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_return"];
_return = [];


if (CSE_SYS_MEDICAL_INTERACTION_TARGET != player && (isNull ([player] call cse_fnc_getCarriedObj))) then {
	if (CSE_ALLOW_AIRWAY_INJURIES_CMS) then {
		if (([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_nasopharyngeal_tube'] call cse_fnc_hasEquipment_CMS) && !([CSE_SYS_MEDICAL_INTERACTION_TARGET, "cse_airwayTreated"] call cse_fnc_getVariable) && !([CSE_SYS_MEDICAL_INTERACTION_TARGET] call cse_fnc_isAwake)) then {
			_return pushback [localize "STR_CSE_ACTION_APPLY_NPA", "[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_nasopharyngeal_tube'] call cse_fnc_treatmentAirway_CMS;", localize "STR_CSE_ACTION_APPLY_NPA_TOOLTIP"];
		};
		if ([CSE_SYS_MEDICAL_INTERACTION_TARGET, "cse_airwayTreated"] call cse_fnc_getVariable) then {
			_return pushback [localize "STR_CSE_ACTION_REMOVE_NPA", "CSE_SYS_MEDICAL_INTERACTION_TARGET setvariable ['cse_airwayTreated', nil, true]; player addMagazine 'cse_nasopharyngeal_tube';", localize "STR_CSE_ACTION_REMOVE_NPA_TOOLTIP"];
		};
		_return = [CSE_SYS_MEDICAL_INTERACTION_TARGET, "getAirwayOptions_CMS", _return] call cse_fnc_getOptionsForCategory_CMS;
	};
};
_return