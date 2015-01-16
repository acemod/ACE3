/**
 * fn_heal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_unit", "_caller", "_selectionName", "_removeItem", "_prevAnim"];
_unit = _this select 0;
_caller = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

if !((CSE_AID_KIT_RESTRICTIONS_CMS == 0 && ([_caller] call cse_fnc_inMedicalFacility_CMS)) || (CSE_AID_KIT_RESTRICTIONS_CMS == 1 && ([_caller] call cse_fnc_inMedicalFacility_CMS) && (!([_unit] call cse_fnc_hasOpenWounds_CMS))) || (CSE_AID_KIT_RESTRICTIONS_CMS == 2) || (CSE_AID_KIT_RESTRICTIONS_CMS == 3 && (!([_unit] call cse_fnc_hasOpenWounds_CMS)))) exitwith {};

if (!([_caller, _unit, _removeItem] call cse_fnc_hasEquipment_CMS)) exitwith {};
if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_caller] call cse_fnc_treatmentMutex_CMS;

_prevAnim = "";
if (vehicle _caller == _caller && (vehicle _unit == _unit) && !(stance _caller == "PRONE")) then {
	if (primaryWeapon _caller == "") then {
	 	_prevAnim = animationState _caller;
	 };
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
};

CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _caller;
if !([5,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{hint "Action aborted. You moved away";}] call cse_fnc_gui_loadingBar) exitwith {
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};
CSE_ORIGINAL_POSITION_PLAYER_CMS = nil;

if (CSE_AID_KIT_REMOVED_UPON_USAGE_CMS) then {
	[_caller, _unit,_removeItem] call cse_fnc_useEquipment_CMS;
};

if (_prevAnim != "") then {
	_caller switchMove _prevAnim;
};

[_caller,"release"] call cse_fnc_treatmentMutex_CMS;

if (!(_unit getvariable ["cms_isDead",false]) && alive _unit) then {
	[[_unit,_caller], "cse_fnc_healLocal_CMS", _unit, false] spawn BIS_fnc_MP;
};
