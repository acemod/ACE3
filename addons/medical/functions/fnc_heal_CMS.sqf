/**
 * fn_heal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_caller", "_selectionName", "_removeItem", "_prevAnim"];
_unit = _this select 0;
_caller = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

if !((GVAR(setting_aidKitRestrictions) == 0 && ([_caller] call FUNC(inMedicalFacility_CMS))) || (GVAR(setting_aidKitRestrictions) == 1 && ([_caller] call FUNC(inMedicalFacility_CMS)) && (!([_unit] call FUNC(hasOpenWounds_CMS)))) || (GVAR(setting_aidKitRestrictions) == 2) || (GVAR(setting_aidKitRestrictions) == 3 && (!([_unit] call FUNC(hasOpenWounds_CMS))))) exitwith {};

if (!([_caller, _unit, _removeItem] call FUNC(hasEquipment_CMS))) exitwith {};
if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller] call FUNC(treatmentMutex_CMS);

_prevAnim = "";
if (vehicle _caller == _caller && (vehicle _unit == _unit) && !(stance _caller == "PRONE")) then {
	if (primaryWeapon _caller == "") then {
	 	_prevAnim = animationState _caller;
	 };
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};

GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([5,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{hint "Action aborted. You moved away";}] call EFUNC(gui,loadingBar)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};
GVAR(ORIGINAL_POSITION_PLAYER) = nil;

if (GVAR(setting_removeAidKitOnUse)) then {
	[_caller, _unit,_removeItem] call FUNC(useEquipment_CMS);
};

if (_prevAnim != "") then {
	_caller switchMove _prevAnim;
};

[_caller,"release"] call FUNC(treatmentMutex_CMS);

if (!(_unit getvariable [QEGVAR(common,isDead),false]) && alive _unit) then {
	[[_unit,_caller], QUOTE(FUNC(healLocal_CMS)), _unit, false] call BIS_fnc_MP;
};
