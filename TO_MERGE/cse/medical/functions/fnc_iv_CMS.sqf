/**
 * fn_iv_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_attributes","_patient", "_continue", "_prevAnim"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_treatingPerson,"set"] call FUNC(treatmentMutex_CMS);

if (!([_treatingPerson, _injuredPerson, _removeItem] call FUNC(hasEquipment_CMS))) exitwith { [_treatingPerson,"release"] call FUNC(treatmentMutex_CMS); };

_prevAnim = "";
if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson) && !(stance _treatingPerson == "PRONE")) then {
	if (primaryWeapon _treatingPerson == "") then {
		_prevAnim = animationState _treatingPerson;
	};
	[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};
GVAR(ORIGINAL_POSITION_PLAYER) = getPos _treatingPerson;
if !([5,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{hint "Action aborted. You moved away";}] call EFUNC(gui,loadingBar)) exitwith {
		[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);
};

[_treatingPerson, _injuredPerson,_removeItem] call FUNC(useEquipment_CMS);
[_this, QUOTE(FUNC(ivLocal_CMS)), _injuredPerson, false] spawn BIS_fnc_MP;

if (_prevAnim != "") then {
	_treatingPerson switchMove _prevAnim;
};

[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);