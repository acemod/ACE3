/*
fnc_drag.sqf
Usage: makes the calling unit start dragging the specified unit
Author: Glowbal

Arguments: array [unit (object), unit (object)]
        1: Caller OBJECT. Unit that initiats the dragging
        2: Target OBJECT. Unit that will be dragged
Returns: none

Affects: Caller and target Locality
Executes: call
*/

#include "script_component.hpp"

private ["_caller", "_unit", "_positionUnit", "_killOnDrop"];
_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_killOnDrop = [_this, 2, false, [false]] call BIS_fnc_param;

["FUNC(actionDragUnit) has been called",2] call EFUNC(common,debug);

if ([_caller] call FUNC(isSetTreatmentMutex)) exitwith {};
[_caller, true] call FUNC(treatmentMutex);

if (!(_unit isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{ [_caller, false] call FUNC(treatmentMutex);};
if (vehicle _caller != _caller || vehicle _unit != _unit) exitwith { [_caller, false] call FUNC(treatmentMutex);};

if (!([_caller] call EFUNC(common,canInteract)) || {_caller == _unit} || {(([_unit] call EFUNC(common,isAwake)))}) exitwith {
    [_caller, false] call FUNC(treatmentMutex);
};

if (([_caller] call EFUNC(common,getCarriedObj)) != _unit && !(isNull ([_caller] call EFUNC(common,getCarriedObj))) || {!isNull(_unit getvariable [QGVAR(beingDragged),objNull]) || !isNull(_caller getvariable [QGVAR(dragging),objNull])}) exitwith {
    [_caller,objNull] call EFUNC(common,carryObj);
    [_caller, false] call FUNC(treatmentMutex);
};

if (!alive _unit) exitwith {
    [_caller, false] call FUNC(treatmentMutex);
    [{
        _this call FUNC(actionDragUnit);
    }, [_caller, ([_unit,_caller] call FUNC(makeCopyOfBody_F)), _killOnDrop], 0.25, 0.25] call EFUNC(common,waitAndExecute);
};

if (primaryWeapon _caller == "") then {
    _caller addWeapon "ACE_FakePrimaryWeapon";
};
_caller selectWeapon (primaryWeapon _unit);

_unit setDir (getDir _unit + 180) % 360;
_unit setPos ((getPos _unit) vectorAdd ((vectorDir _caller) vectorMultiply 1.5));

if !([_caller,_unit,[0.125, 1.007, 0]] call EFUNC(common,carryObj)) exitwith {
    [_caller, false] call FUNC(treatmentMutex);
    // well something went horribly wrong here, should never reach this, since we do checks above..

};

[_unit, "AinjPpneMstpSnonWrflDb",  2, true] call EFUNC(common,doAnimation);

_caller selectWeapon (primaryWeapon _caller); // if no primairy weapon, add a fake one first
if (currentWeapon _caller == primaryWeapon _caller) then {
    [_caller,"AcinPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
} else {
    [_caller,"AcinPknlMstpSnonWnonDnon", 1] call EFUNC(common,doAnimation);
};

_caller setvariable [QGVAR(StartingPositionHandleTreatment), getPos _caller];
[2,
    {((vehicle (_this select 0) != (_this select 0)) ||((getPos (_this select 0)) distance ((_this select 0) getvariable QGVAR(StartingPositionHandleTreatment)) < 1.5))}, // the condition
    {
        private ["_caller","_target"];
        _caller = _this select 0;
        _target = _this select 1;
        _killOnDrop = _this select 2;
        [_caller, false] call FUNC(treatmentMutex);

        // Registration for drag/carry functions
        _target setvariable [QGVAR(beingDragged),_caller,true];
        _caller setvariable [QGVAR(dragging), _target,true];

        // Removing any old drop scroll wheel actions
        // TODO Do we still want scroll wheel actions?
        if (!isnil QGVAR(DROP_ADDACTION)) then {
        _caller removeAction GVAR(DROP_ADDACTION);
            GVAR(DROP_ADDACTION) = nil;
        };
        // Adding the drop scroll wheel action.
        GVAR(DROP_ADDACTION) = _caller addAction [format["Drop %1",[_target] call EFUNC(common,getName)], {[_this select 1, _this select 2] call FUNC(actionDropUnit);}];

        // Raise an event
        ["onStartMovingUnit", [_caller], [_caller, _Target, _killOnDrop, true]] call EFUNC(common,targetEvent);

    }, // on success
    {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(gui,sendDisplayInformationTo);
        [(_this select 0), false] call FUNC(treatmentMutex);
        [(_this select 0), objNull,[0, 0, 0]] call EFUNC(common,carryObj);
    },    // on failure
    [_caller, _unit, _killOnDrop] // arguments
] call EFUNC(gui,loadingBar);
