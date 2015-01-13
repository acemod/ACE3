/**
 * fn_tourniquet_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller","_unit","_part","_selectionName","_removeItem", "_tourniquets", "_continue"];
_unit = _this select 0;
_caller = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
[_caller,"You attempt to apply a tourniquet"] call EFUNC(common,sendHintTo);

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller,"set"] call FUNC(treatmentMutex_CMS);
if (!([_caller, _unit, _removeItem] call FUNC(hasEquipment_CMS))) exitwith { [_caller,"release"] call FUNC(treatmentMutex_CMS); };

_part =	[_selectionName] call FUNC(getBodyPartNumber_CMS);
if (_part == 0 || _part == 1) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	[_caller,"You cannot apply a CAT on this body part!"] call EFUNC(common,sendHintTo);
};

_tourniquets = [_unit,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
if ((_tourniquets select _part) >0) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	[_caller,"There is already a tourniquet on this body part!"] call EFUNC(common,sendHintTo);
};

if (vehicle _caller == _caller && (vehicle _unit == _unit) && !(stance _caller == "PRONE")) then {
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};
GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([5,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{hint "Action aborted. You moved away";}] call EFUNC(gui,loadingBar)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};
["Now uses the magazine"] call EFUNC(common,debug);
[_caller, _unit,_removeItem] call FUNC(useEquipment_CMS);

[_this, "FUNC(tourniquetLocal_CMS)", _unit, false] spawn BIS_fnc_MP;
[_caller,"release"] call FUNC(treatmentMutex_CMS);
true