/**
 * fn_getMedicationOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define TREATMENT_ACTION(ITEM) QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),ITEM)] call FUNC(medication_CMS);)

private ["_return"];
_return = [];
if (isNull ([player] call EFUNC(common,getCarriedObj))) then {
	if ([player,GVAR(INTERACTION_TARGET),'ACE_morphine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_MORPHINE", TREATMENT_ACTION('ACE_morphine'),localize "STR_ACE_ACTION_MORPHINE_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'ACE_atropine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_ATROPINE", TREATMENT_ACTION('ACE_atropine'),localize "STR_ACE_ACTION_ATROPINE_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'ACE_epinephrine'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_EPINEPHRINE", TREATMENT_ACTION('ACE_epinephrine'),localize "STR_ACE_ACTION_EPINEPHRINE_TOOLTIP"];
	};
	_return = [GVAR(INTERACTION_TARGET), "getMedicationOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
};

_return