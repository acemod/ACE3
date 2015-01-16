/**
 * fn_removeTourniquet_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_unit","_part","_selectionName","_removeItem","_tourniquets"];
_unit = _this select 0;
_caller = _this select 1;
_selectionName = _this select 2;

[_caller,"You attempt to remove a tourniquet"] call EFUNC(common,sendHintTo);
if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {["MUTEX HAS BEEN SET - EXITING"] call EFUNC(common,debug);};
	[_caller,"set"] call FUNC(treatmentMutex_CMS);


if !([_unit, _selectionName] call FUNC(hasTourniquetAppliedTo_CMS)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	[_caller,"There is no tourniquet on this body part!"] call EFUNC(common,sendHintTo);
};

if (vehicle _caller == _caller && (vehicle _unit == _unit)) then {
	[_caller,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
};
GVAR(ORIGINAL_POSITION_PLAYER) = getPos _caller;
if !([5,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{hint "Action aborted. You moved away";}] call EFUNC(gui,loadingBar)) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};
_part =	[_selectionName] call FUNC(getBodyPartNumber_CMS);
_tourniquets = [_unit,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
_tourniquets set[_part,0];
[_unit,QGVAR(tourniquets),_tourniquets] call EFUNC(common,setDefinedVariable);

_caller addMagazine "ACE_tourniquet";
[_caller,"release"] call FUNC(treatmentMutex_CMS);

[_unit,"treatment",format["%1 removed a tourniquet on %2",[_caller] call EFUNC(common,getName),_selectionName]] call FUNC(addActivityToLog_CMS);