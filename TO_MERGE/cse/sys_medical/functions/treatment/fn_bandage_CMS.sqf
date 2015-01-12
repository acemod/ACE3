/**
 * fn_bandage_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_treatingPerson","_injuredPerson","_part","_selectionName","_openWounds","_woundsArray","_highest_amount","_highestSpot", "_selectedData", "_continue", "_prevAnim"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_selectedData = [_this, 4, "", [""]] call BIS_fnc_Param;

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_treatingPerson] call cse_fnc_treatmentMutex_CMS;

if (!([_treatingPerson, _injuredPerson, _removeItem] call cse_fnc_hasEquipment_CMS)) exitwith { [_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS; };

_prevAnim = "";
if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson) && !(stance _treatingPerson == "PRONE")) then {
	if (primaryWeapon _treatingPerson == "") then {
	 	_prevAnim = animationState _treatingPerson;
	 };
	[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
};

[_treatingPerson,"STR_CSE_CMS_BANDAGING","STR_CSE_CMS_APPLY_BANDAGE", 0, [[_injuredPerson] call cse_fnc_getName, _selectionName]] call cse_fnc_sendDisplayMessageTo;

if (isnil "CSE_BANDAGE_WAITING_TIME_CMS") then {
	CSE_BANDAGE_WAITING_TIME_CMS = 5;
};

["cse_sys_medical_treatment", true, "cse\cse_sys_medical\data\icons\bandage_fracture_small.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _treatingPerson;
if ([CSE_BANDAGE_WAITING_TIME_CMS,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar) then {

	[_treatingPerson, _injuredPerson, _removeItem] call cse_fnc_useEquipment_CMS;

	[_this, "cse_fnc_bandageLocal_CMS", _injuredPerson, false] spawn BIS_fnc_MP;
};

if (_prevAnim != "") then {
	_treatingPerson switchMove _prevAnim;
};
["cse_sys_medical_treatment", false, "cse\cse_sys_medical\data\icons\bandage_fracture_small.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

[_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS;
true