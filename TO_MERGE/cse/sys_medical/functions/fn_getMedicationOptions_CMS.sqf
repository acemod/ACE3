/**
 * fn_getMedicationOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return"];
_return = [];
if (isNull ([player] call cse_fnc_getCarriedObj)) then {
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_morphine'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_MORPHINE","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_morphine'] call cse_fnc_medication_CMS;",localize "STR_CSE_ACTION_MORPHINE_TOOLTIP"];
	};
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_atropine'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_ATROPINE","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_atropine'] call cse_fnc_medication_CMS;",localize "STR_CSE_ACTION_ATROPINE_TOOLTIP"];
	};
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_epinephrine'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_EPINEPHRINE","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_epinephrine'] call cse_fnc_medication_CMS;",localize "STR_CSE_ACTION_EPINEPHRINE_TOOLTIP"];
	};

	_return = [CSE_SYS_MEDICAL_INTERACTION_TARGET, "getMedicationOptions_CMS", _return] call cse_fnc_getOptionsForCategory_CMS;

	//_return set [count _return, ["Anti-Biotics","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_antiBiotics'] call cse_fnc_medication_CMS;","To counter infections"]];
};

_return