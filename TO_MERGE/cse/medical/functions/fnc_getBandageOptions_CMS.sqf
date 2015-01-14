/**
 * fn_getBandageOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define	HAS_EQUIPMENT(ITEM)	[player,GVAR(INTERACTION_TARGET),ITEM] call FUNC(hasEquipment_CMS)


private ["_return"];
_return = [];

if (isNull ([player] call EFUNC(common,getCarriedObj))) then {
	if (HAS_EQUIPMENT('cse_bandage_basic')) then {
		_return pushback [localize "STR_ACE_ACTION_BANDAGE_BASIC", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_bandage_basic', call FUNC(getCurrentSelectedInjuryData_CMS)] call FUNC(bandage_CMS);),localize "STR_ACE_ACTION_BANDAGE_BASIC_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'cse_quikclot'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_QUIKCLOT", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_quikclot', call FUNC(getCurrentSelectedInjuryData_CMS)] call FUNC(bandage_CMS);),localize "STR_ACE_ACTION_QUIKCLOT_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'cse_bandageElastic'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_BANDAGE_ELASTIC", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_bandageElastic', call FUNC(getCurrentSelectedInjuryData_CMS)] call FUNC(bandage_CMS);),localize "STR_ACE_ACTION_BANDAGE_ELASTIC_TOOLTIP"];
	};
	if ([player,GVAR(INTERACTION_TARGET),'cse_packing_bandage'] call FUNC(hasEquipment_CMS)) then {
		_return pushback [localize "STR_ACE_ACTION_PACKING_BANDAGE", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_packing_bandage', call FUNC(getCurrentSelectedInjuryData_CMS)] call FUNC(bandage_CMS);),localize "STR_ACE_ACTION_PACKING_BANDAGE_TOOLTIP"];
	};

	if (([GVAR(INTERACTION_TARGET), call FUNC(getSelectedBodyPart_CMS)] call FUNC(hasTourniquetAppliedTo_CMS))) then {
		_return pushback [localize "STR_ACE_ACTION_REMOVE_TOURNIQUET", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_tourniquet'] call FUNC(removeTourniquet_CMS);),localize "STR_ACE_ACTION_REMOVE_TOURNIQUET_TOOLTIP"];
	} else {
		if ([player,GVAR(INTERACTION_TARGET),'cse_tourniquet'] call FUNC(hasEquipment_CMS)) then {
			_return pushback [localize "STR_ACE_ACTION_APPLY_TOURNIQUET", QUOTE([_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'cse_tourniquet'] call FUNC(tourniquet_CMS);),localize "STR_ACE_ACTION_APPLY_TOURNIQUET_TOOLTIP"];
		};
	};
	_return = [GVAR(INTERACTION_TARGET), "getBandageOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
};

_return