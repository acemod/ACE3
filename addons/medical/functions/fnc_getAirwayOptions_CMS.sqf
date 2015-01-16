/**
 * fn_getAirwayOptions_CMS.sqf
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
	if (GVAR(setting_allowAirwayInjuries)) then {
		if (([player,GVAR(INTERACTION_TARGET),'ACE_nasopharyngeal_tube'] call FUNC(hasEquipment_CMS)) && !([GVAR(INTERACTION_TARGET), QGVAR(airwayTreated)] call EFUNC(common,getDefinedVariable)) && !([GVAR(INTERACTION_TARGET)] call EFUNC(common,isAwake))) then {
			_return pushback [localize "STR_ACE_ACTION_APPLY_NPA", QUOTE([ARR_4(_this select 0,_this select 1,call FUNC(getSelectedBodyPart_CMS),'ACE_nasopharyngeal_tube')] call FUNC(treatmentAirway_CMS);), localize "STR_ACE_ACTION_APPLY_NPA_TOOLTIP"];
		};
		if ([GVAR(INTERACTION_TARGET), QGVAR(airwayTreated)] call EFUNC(common,getDefinedVariable)) then {
			_return pushback [localize "STR_ACE_ACTION_REMOVE_NPA", QUOTE(GVAR(INTERACTION_TARGET) setvariable [ARR_3(QUOTE(QGVAR(airwayTreated)), nil, true)]; player addMagazine 'ACE_nasopharyngeal_tube';), localize "STR_ACE_ACTION_REMOVE_NPA_TOOLTIP"];
		};
		_return = [GVAR(INTERACTION_TARGET), "getAirwayOptions_CMS", _return] call FUNC(getOptionsForCategory_CMS);
	};
};
_return