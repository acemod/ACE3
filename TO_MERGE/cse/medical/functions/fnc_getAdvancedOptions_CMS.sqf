/**
 * fn_getAdvancedOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_return"];
_return = [];

if (GVAR(INTERACTION_TARGET) != player && (isNull ([player] call EFUNC(common,getCarriedObj)))) then {

	if (([player,GVAR(INTERACTION_TARGET), 'ACE_blood_iv')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_1000ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_blood_iv')] call FUNC(iv_CMS);),localize "STR_ACE_ACTION_BLOODIV_1000ML_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET), 'ACE_blood_iv_500')]  call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_500ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_blood_iv_500')] call FUNC(iv_CMS);),localize "STR_ACE_ACTION_BLOODIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'ACE_blood_iv_250')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_BLOODIV_250ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_blood_iv_250')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_BLOODIV_250ML_TOOLTIP"];
	};

	if (([player,GVAR(INTERACTION_TARGET),'ACE_plasma_iv')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_1000ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_plasma_iv')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_PLASMAIV_1000ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'ACE_plasma_iv_500')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_500ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_plasma_iv_500')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_PLASMAIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'ACE_plasma_iv_250')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_PLASMAIV_250ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_plasma_iv_250')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_PLASMAIV_250ML_TOOLTIP"];
	};

	if (([player,GVAR(INTERACTION_TARGET),'ACE_saline_iv')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_1000ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_saline_iv')] call FUNC(iv_CMS);),localize "STR_ACE_ACTION_SALINEIV_1000ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'ACE_saline_iv_500')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_500ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_saline_iv_500')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_SALINEIV_500ML_TOOLTIP"];
	};
	if (([player,GVAR(INTERACTION_TARGET),'ACE_saline_iv_250')]  call FUNC(hasEquipment_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_SALINEIV_250ml", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_saline_iv_250')]  call FUNC(iv_CMS);),localize "STR_ACE_ACTION_SALINEIV_250ML_TOOLTIP"];
	};

	// TODO refactor this condition into a function.
	if ((GVAR(setting_aidKitRestrictions) == 0 && ([player] call FUNC(inMedicalFacility_CMS))) ||
		(GVAR(setting_aidKitRestrictions) == 1 && ([player] call FUNC(inMedicalFacility_CMS)) && (!([GVAR(INTERACTION_TARGET)] call FUNC(hasOpenWounds_CMS)))) ||
		(GVAR(setting_aidKitRestrictions) == 2) ||
		(GVAR(setting_aidKitRestrictions) == 3 && (!([GVAR(INTERACTION_TARGET)] call FUNC(hasOpenWounds_CMS))))) then {

		if (GVAR(setting_aidKitMedicsOnly) && [player] call FUNC(medicClass_CMS) || !GVAR(setting_aidKitMedicsOnly)) then {
			if (([player,GVAR(INTERACTION_TARGET),'ACE_personal_aid_kit')]  call FUNC(hasEquipment_CMS))) then {
				_return pushback [localize "STR_ACE_ACTION_PERSONAL_AID_KIT", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_personal_aid_kit')]  call FUNC(heal_CMS);),localize "STR_ACE_ACTION_PERSONAL_AID_KIT_TOOLTIP"];
			};
		};
	};
	if (isnil QGVAR(playerIsProvidingCPR)) then {
		GVAR(playerIsProvidingCPR) = false;
	};
	if ((GVAR(INTERACTION_TARGET) getvariable [QGVAR(inCardiacArrest),false]) || !([GVAR(INTERACTION_TARGET)] call EFUNC(common,isAwake)) && !GVAR(playerIsProvidingCPR)) then {
		_return pushback [localize "STR_ACE_ACTION_PERFORM_CPR", QUOTE([ARR_2(_this select 0,_this select 1)] call FUNC(performCPR_CMS);), localize "STR_ACE_ACTION_PERFORM_CPR_TOOLTIP"];
	};
	if (GVAR(playerIsProvidingCPR)) then {
		_return pushback [localize "STR_ACE_ACTION_STOP_CPR",QUOTE(GVAR(playerIsProvidingCPR) = false;), localize "STR_ACE_ACTION_STOP_CPR_TOOLTIP"];
	};

	if ((GVAR(setting_allowStitching) == 0 && [player] call FUNC(medicClass_CMS)) || GVAR(setting_allowStitching) == 1) then {
		if ([player, GVAR(INTERACTION_TARGET), 'ACE_surgical_kit')]  call FUNC(hasEquipment_CMS)) then {
			_return pushback [localize "STR_ACE_ACTION_STITCHING", QUOTE([ARR_4(_this select 0,_this select 1, call FUNC(getSelectedBodyPart_CMS), 'ACE_surgical_kit')]  call FUNC(performStitching_CMS);), localize "STR_ACE_ACTION_STITCHING_TOOLTIP"];
		};
	};

	_return = [GVAR(INTERACTION_TARGET), "getAdvancedOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
};
_return