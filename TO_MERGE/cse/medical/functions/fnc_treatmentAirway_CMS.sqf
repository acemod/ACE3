/**
 * fn_treatmentAirway_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_treatingPerson","_injuredPerson","_part","_selectionName","_openWounds","_woundsArray","_highest_amount","_highestSpot"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

[format["Treatment Airway: %1",_this]] call EFUNC(common,debug);

_part =	[_selectionName] call FUNC(getBodyPartNumber_CMS);
if (_part == 0 || _part == 1) then {
	if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
	[_treatingPerson] call FUNC(treatmentMutex_CMS);
	if (!([_treatingPerson, _injuredPerson, _removeItem] call FUNC(hasEquipment_CMS))) exitwith { [_treatingPerson,"release"] call FUNC(treatmentMutex_CMS); };

		[_treatingPerson, _injuredPerson,_removeItem] call FUNC(useEquipment_CMS);

		if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson)) then {
			[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
		};
		_name = [_injuredPerson] call EFUNC(common,getName);

		[_treatingPerson,"STR_ACE_CMS_AIRWAY","STR_ACE_CMS_YOU_TREAT_AIRWAY", 0, [_name]] call EFUNC(common,sendDisplayMessageTo);

		GVAR(ORIGINAL_POSITION_PLAYER) = getPos _treatingPerson;
		if !([5,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{[player, "STR_ACE_CMS_CANCELED", ["STR_ACE_CMS_ACTION_CANCELED","STR_ACE_CMS_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);}] call EFUNC(gui,loadingBar)) exitwith {
				[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);
		};

		[_this, QUOTE(FUNC(treatmentAirwayLocal_CMS)), _injuredPerson, false] spawn BIS_fnc_MP;
		[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);
} else {
	hintSilent "Cannot apply item on this body part";
};
true