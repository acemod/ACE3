/**
 * fn_getAdvancedOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return"];
_return = [];

if (GVAR(INTERACTION_TARGET) != player && (isNull ([player] call EFUNC(common,getCarriedObj)))) then {

	if (([player,GVAR(INTERACTION_TARGET), 'cse_blood_iv'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_1000ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_blood_iv'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_BLOODIV_1000ML_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET), 'cse_blood_iv_500'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_500ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_blood_iv_500'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_BLOODIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'cse_blood_iv_250'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_250ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_blood_iv_250'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_BLOODIV_250ML_TOOLTIP"];
	};

	if (([player,GVAR(INTERACTION_TARGET),'cse_plasma_iv'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_1000ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_plasma_iv'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_PLASMAIV_1000ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'cse_plasma_iv_500'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_500ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_plasma_iv_500'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_PLASMAIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'cse_plasma_iv_250'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_250ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_plasma_iv_250'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_PLASMAIV_250ML_TOOLTIP"];
	};

	if (([player,GVAR(INTERACTION_TARGET),'cse_saline_iv'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_1000ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_saline_iv'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_SALINEIV_1000ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'cse_saline_iv_500'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_500ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_saline_iv_500'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_SALINEIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'cse_saline_iv_250'] call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_250ml","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_saline_iv_250'] call FUNC(iv_CMS);",localize "STR_ACE_ACTION_SALINEIV_250ML_TOOLTIP"];
	};

	// TODO refactor this condition into a function.
	if ((CSE_AID_KIT_RESTRICTIONS_CMS == 0 && ([player] call FUNC(inMedicalFacility_CMS))) ||
		(CSE_AID_KIT_RESTRICTIONS_CMS == 1 && ([player] call FUNC(inMedicalFacility_CMS)) && (!([GVAR(INTERACTION_TARGET)] call FUNC(hasOpenWounds_CMS)))) ||
		(CSE_AID_KIT_RESTRICTIONS_CMS == 2) ||
		(CSE_AID_KIT_RESTRICTIONS_CMS == 3 && (!([GVAR(INTERACTION_TARGET)] call FUNC(hasOpenWounds_CMS))))) then {

		if (CSE_AIDKITMEDICSONLY_CMS && [player] call FUNC(medicClass_CMS) || !CSE_AIDKITMEDICSONLY_CMS) then {
			if (([player,GVAR(INTERACTION_TARGET),'cse_personal_aid_kit'] call FUNC(hasEquipment_CMS))) then {
				_return pushback [localize "STR_ACE_ACTION_PERSONAL_AID_KIT","[_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_personal_aid_kit'] call FUNC(heal_CMS);",localize "STR_ACE_ACTION_PERSONAL_AID_KIT_TOOLTIP"];
			};
		};
	};
	if (isnil "cse_playerIsProvidingCPR_CMS") then {
		cse_playerIsProvidingCPR_CMS = false;
	};
	if ((GVAR(INTERACTION_TARGET) getvariable [QGVAR(inCardiacArrest),false]) || !([GVAR(INTERACTION_TARGET)] call EFUNC(common,isAwake)) && !cse_playerIsProvidingCPR_CMS) then {
		_return pushback [localize "STR_ACE_ACTION_PERFORM_CPR","[_this select 0,_this select 1] call FUNC(performCPR_CMS);", localize "STR_ACE_ACTION_PERFORM_CPR_TOOLTIP"];
	};
	if (cse_playerIsProvidingCPR_CMS) then {
		_return pushback [localize "STR_ACE_ACTION_STOP_CPR","cse_playerIsProvidingCPR_CMS = false;", localize "STR_ACE_ACTION_STOP_CPR_TOOLTIP"];
	};

	if ((CSE_STITCHING_ALLOW_CMS == 0 && [player] call FUNC(medicClass_CMS)) || CSE_STITCHING_ALLOW_CMS == 1) then {
		if ([player, GVAR(INTERACTION_TARGET), 'cse_surgical_kit'] call FUNC(hasEquipment_CMS)) then {
			_return pushback [localize "STR_ACE_ACTION_STITCHING","[_this select 0,_this select 1, call FUNC(getSelectedBodyPart_CMS), 'cse_surgical_kit'] call FUNC(performStitching_CMS);", localize "STR_ACE_ACTION_STITCHING_TOOLTIP"];
		};
	};

	_return = [GVAR(INTERACTION_TARGET), "getAdvancedOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
};
_return