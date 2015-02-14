/*
    fnc_carry.sqf
    Usage: makes the calling unit start carrying the specified unit
    Author: Glowbal

    Arguments: array [caller (object), target (object)]
            1: caller (OBJECT), Object of type Man
            2: target (OBJECT), Object of type Man
    Returns: none

    Affects: Caller and target locality
    Executes: spawn
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

if (([_caller] call EFUNC(common,getCarriedObj)) != _unit && !(isNull ([_caller] call EFUNC(common,getCarriedObj))) || {!isNull(_unit getvariable [QGVAR(beingDragged),objNull]) || !isNull(_caller getvariable [QGVAR(dragging),objNull])} || {!isNull(_unit getvariable [QGVAR(beingCarried),objNull]) || !isNull(_caller getvariable [QGVAR(carrying),objNull])}) exitwith {
    [_caller,objNull] call EFUNC(common,carryObj);
    [_caller, false] call FUNC(treatmentMutex);
};
_caller action ["WeaponOnBack", _caller];
_killOnDrop = false;
if (!alive _unit) exitwith {
    [_caller, false] call FUNC(treatmentMutex);
    [{
        _this call FUNC(actionCarryUnit);
    }, [_caller, ([_unit,_caller] call FUNC(makeCopyOfBody_F)), _killOnDrop], 0.25, 0.25] call EFUNC(common,waitAndExecute);
};

if !([_caller,_unit] call EFUNC(common,carryObj)) exitwith {
    ["couldn't carry object!"] call EFUNC(common,debug); [_caller,false] call FUNC(treatmentMutex);
};

if (primaryWeapon _caller == "") then {
    _caller addWeapon "ACE_FakePrimaryWeapon";
};
_caller selectWeapon (primaryWeapon _caller);

_unit attachTo [_caller, [0.1, -0.1, -1.25], "LeftShoulder"];

[_unit,"AinjPfalMstpSnonWnonDf_carried_dead", 2, true] call EFUNC(common,doAnimation);
[_caller,"acinpercmstpsraswrfldnon", 1] call EFUNC(common,doAnimation);

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
        _target setvariable [QGVAR(beingCarried),_caller,true];
        _caller setvariable [QGVAR(carrying),_unit,true];

        // Removing any old drop scroll wheel actions
        // TODO Do we still want scroll wheel actions?
        if (!isnil QGVAR(DROP_ADDACTION)) then {
            _caller removeAction GVAR(DROP_ADDACTION);
            GVAR(DROP_ADDACTION) = nil;
        };
        // Adding the drop scroll wheel action.
        GVAR(DROP_ADDACTION) = _caller addAction [format["Drop %1",[_target] call EFUNC(common,getName)], {[_this select 1, _this select 2] call FUNC(actionDropUnit);}];

        // Raise an event
        ["onStartMovingUnit", [_caller], [_caller, _Target, _killOnDrop, false]] call EFUNC(common,targetEvent);

    }, // on success
    {
        [(_this select 0), "STR_ACE_CANCELED", ["STR_ACE_ACTION_CANCELED","STR_ACE_YOU_MOVED_AWAY"]] call EFUNC(common,sendDisplayInformationTo);
        [(_this select 0), false] call FUNC(treatmentMutex);
        [(_this select 0), objNull,[0, 0, 0]] call EFUNC(common,carryObj);
    },    // on failure
    [_caller, _unit, _killOnDrop] // arguments
] call EFUNC(common,loadingBar);