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
if (isNull ([player] call EFUNC(common,getCarriedObj))) then {
	if ([player,GVAR(INTERACTION_TARGET),'cse_morphine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_MORPHINE","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_morphine'] call FUNC(medication_CMS);",localize "STR_ACE_ACTION_MORPHINE_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'cse_atropine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_ATROPINE","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_atropine'] call FUNC(medication_CMS);",localize "STR_ACE_ACTION_ATROPINE_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'cse_epinephrine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_EPINEPHRINE","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_epinephrine'] call FUNC(medication_CMS);",localize "STR_ACE_ACTION_EPINEPHRINE_TOOLTIP"];
	};

	_return = [GVAR(INTERACTION_TARGET), "getMedicationOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);

	//_return set [count _return, ["Anti-Biotics","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_antiBiotics'] call FUNC(medication_CMS);","To counter infections"]];
};

_return