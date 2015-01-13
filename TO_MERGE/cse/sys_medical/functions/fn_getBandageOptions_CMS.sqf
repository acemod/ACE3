/**
 * fn_getBandageOptions_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define	HAS_EQUIPMENT(ITEM)	[player,CSE_SYS_MEDICAL_INTERACTION_TARGET,ITEM] call cse_fnc_hasEquipment_CMS


private ["_return"];
_return = [];

if (isNull ([player] call cse_fnc_getCarriedObj)) then {
	if (HAS_EQUIPMENT('cse_bandage_basic')) then {
		_return pushback [localize "STR_CSE_ACTION_BANDAGE_BASIC","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_bandage_basic', call cse_fnc_getCurrentSelectedInjuryData_CMS] call cse_fnc_bandage_CMS;",localize "STR_CSE_ACTION_BANDAGE_BASIC_TOOLTIP"];
	};
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_quikclot'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_QUIKCLOT","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_quikclot', call cse_fnc_getCurrentSelectedInjuryData_CMS] call cse_fnc_bandage_CMS;",localize "STR_CSE_ACTION_QUIKCLOT_TOOLTIP"];
	};
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_bandageElastic'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_BANDAGE_ELASTIC","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_bandageElastic', call cse_fnc_getCurrentSelectedInjuryData_CMS] call cse_fnc_bandage_CMS;",localize "STR_CSE_ACTION_BANDAGE_ELASTIC_TOOLTIP"];
	};
	if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_packing_bandage'] call cse_fnc_hasEquipment_CMS) then {
		_return pushback [localize "STR_CSE_ACTION_PACKING_BANDAGE","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_packing_bandage', call cse_fnc_getCurrentSelectedInjuryData_CMS] call cse_fnc_bandage_CMS;",localize "STR_CSE_ACTION_PACKING_BANDAGE_TOOLTIP"];
	};

	if (([CSE_SYS_MEDICAL_INTERACTION_TARGET, call cse_fnc_getSelectedBodyPart_CMS] call cse_fnc_hasTourniquetAppliedTo_CMS)) then {
		_return pushback [localize "STR_CSE_ACTION_REMOVE_TOURNIQUET","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_tourniquet'] call cse_fnc_removeTourniquet_CMS;",localize "STR_CSE_ACTION_REMOVE_TOURNIQUET_TOOLTIP"];
	} else {
		if ([player,CSE_SYS_MEDICAL_INTERACTION_TARGET,'cse_tourniquet'] call cse_fnc_hasEquipment_CMS) then {
			_return pushback [localize "STR_CSE_ACTION_APPLY_TOURNIQUET","[_this select 0,_this select 1,call cse_fnc_getSelectedBodyPart_CMS,'cse_tourniquet'] call cse_fnc_tourniquet_CMS;",localize "STR_CSE_ACTION_APPLY_TOURNIQUET_TOOLTIP"];
		};
	};
	_return = [CSE_SYS_MEDICAL_INTERACTION_TARGET, "getBandageOptions_CMS", _return] call cse_fnc_getOptionsForCategory_CMS;
};

_return