/**
 * fn_bandage_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_treatingPerson","_injuredPerson","_part","_selectionName","_openWounds","_woundsArray","_highest_amount","_highestSpot", "_selectedData", "_continue", "_prevAnim"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_selectedData = [_this, 4, "", [""]] call BIS_fnc_Param;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_treatingPerson] call FUNC(treatmentMutex_CMS);

if (!([_treatingPerson, _injuredPerson, _removeItem] call FUNC(hasEquipment_CMS))) exitwith { [_treatingPerson,"release"] call FUNC(treatmentMutex_CMS); };

_prevAnim = "";
if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson) && !(stance _treatingPerson == "PRONE")) then {
	if (primaryWeapon _treatingPerson == "") then {
	 	_prevAnim = animationState _treatingPerson;
	 };
	[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};

[_treatingPerson,"STR_ACE_CMS_BANDAGING","STR_ACE_CMS_APPLY_BANDAGE", 0, [[_injuredPerson] call EFUNC(common,getName), _selectionName]] call EFUNC(common,sendDisplayMessageTo);

if (isnil QGVAR(setting_bandageWaitingTime)) then {
	GVAR(setting_bandageWaitingTime) = 5;
};

[QGVAR(treatmentIconID), true, QUOTE(PATHTOF(data\icons\bandage_fracture_small.paa)), [1,1,1,1]] call EFUNC(gui,displayIcon);

GVAR(ORIGINAL_POSITION_PLAYER) = getPos _treatingPerson;
if ([GVAR(setting_bandageWaitingTime),{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{[player, "STR_ACE_CMS_CANCELED", ["STR_ACE_CMS_ACTION_CANCELED","STR_ACE_CMS_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);}] call EFUNC(gui,loadingBar)) then {

	[_treatingPerson, _injuredPerson, _removeItem] call FUNC(useEquipment_CMS);

	[_this, QUOTE(FUNC(bandageLocal_CMS)), _injuredPerson, false] spawn BIS_fnc_MP;
};

if (_prevAnim != "") then {
	_treatingPerson switchMove _prevAnim;
};
[QGVAR(treatmentIconID), false, QUOTE(PATHTOF(data\icons\bandage_fracture_small.paa)), [1,1,1,1]] call EFUNC(gui,displayIcon);

[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);
true