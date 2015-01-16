/**
 * fn_getBandageOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define	HAS_EQUIPMENT(ITEM)	[player,GVAR(INTERACTION_TARGET),ITEM] call FUNC(hasEquipment_CMS)
#define TREATMENT_ACTION(ITEM) QUOTE([ARR_5(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),ITEM, call FUNC(getCurrentSelectedInjuryData_CMS))] call FUNC(bandage_CMS);)


private ["_return"];
_return = [];

if (isNull ([player] call EFUNC(common,getCarriedObj))) then {
	if (HAS_EQUIPMENT('ACE_bandage_basic')) then {
		_return pushback [localize "STR_ACE_ACTION_BANDAGE_BASIC", TREATMENT_ACTION('ACE_bandage_basic'),localize "STR_ACE_ACTION_BANDAGE_BASIC_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'ACE_quikclot'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_QUIKCLOT",TREATMENT_ACTION('ACE_quikclot'),localize "STR_ACE_ACTION_QUIKCLOT_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'ACE_bandageElastic'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_BANDAGE_ELASTIC", TREATMENT_ACTION('ACE_bandageElastic'),localize "STR_ACE_ACTION_BANDAGE_ELASTIC_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'ACE_packing_bandage'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_PACKING_BANDAGE", TREATMENT_ACTION('ACE_packing_bandage'),localize "STR_ACE_ACTION_PACKING_BANDAGE_TOOLTIP"];
	};

	if (([GVAR(INTERACTION_TARGET), call FUNC(getSelectedBodyPart_CMS)] call FUNC(hasTourniquetAppliedTo_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_REMOVE_TOURNIQUET", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_tourniquet')] call FUNC(removeTourniquet_CMS);),localize "STR_ACE_ACTION_REMOVE_TOURNIQUET_TOOLTIP"];
	} else {
		if ([player,GVAR(INTERACTION_TARGET),'ACE_tourniquet'] call FUNC(hasEquipment_CMS)) then {
			_return pushback [localize "STR_ACE_ACTION_APPLY_TOURNIQUET", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_tourniquet')] call FUNC(tourniquet_CMS);),localize "STR_ACE_ACTION_APPLY_TOURNIQUET_TOOLTIP"];
		};
	};
	//_return = [GVAR(INTERACTION_TARGET), "getBandageOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
};

_return