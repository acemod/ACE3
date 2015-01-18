/**
 * fn_removeTourniquet.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_part","_selectionName","_removeItem","_tourniquets"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;

[_caller,"You attempt to remove a tourniquet"] call EFUNC(common,sendHintTo);
if ([_caller] call FUNC(isSetTreatmentMutex)) exitwith {["MUTEX HAS BEEN SET - EXITING"] call EFUNC(common,debug);};
[_caller,true] call FUNC(treatmentMutex);

_part = [_selectionName] call FUNC(getBodyPartNumber);
_tourniquets = [_target,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);

if ((_tourniquets select _part) == 0) exitwith {
    [_caller, false] call FUNC(treatmentMutex);
    [_caller,"There is no tourniquet on this body part!"] call EFUNC(common,sendHintTo);
};

if (vehicle _caller == _caller && (vehicle _target == _target)) then {
    [_caller,"AinvPknlMstpSlayWrflDnon_medic", 1] call EFUNC(common,doAnimation);
};

_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];
[2.5,
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1))}, // the condition
    {
        private ["_caller","_target", "_selectionName", "_part","_tourniquets"];
        _caller = _this select 0;
        _target = _this select 1;
        _selectionName = _this select 2;

		_part = [_selectionName] call FUNC(getBodyPartNumber);
		_tourniquets = [_target,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
		_tourniquets set[_part,0];
		[_target,QGVAR(tourniquets),_tourniquets] call EFUNC(common,setDefinedVariable);

		_caller addItem "ACE_tourniquet";
		[_caller,false] call FUNC(treatmentMutex);

		[_target,"treatment",format["%1 removed a tourniquet on %2",[_caller] call EFUNC(common,getName),_selectionName]] call FUNC(addActivityToLog);

        [_caller,false] call FUNC(treatmentMutex);
    }, // on success
    {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(gui,sendDisplayInformationTo);
        [(_this select 0),false] call FUNC(treatmentMutex);
    },    // on failure
    [_caller, _target, _selectionName] // arguments
] call EFUNC(gui,loadingBar);


