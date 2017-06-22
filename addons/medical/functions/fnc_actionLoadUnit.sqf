/*
 * Author: Glowbal
 * Action for loading an unconscious or dead unit in the nearest vechile
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ACE_medical_fnc_actionLoadUnit
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_caller", "_target"];

if ([_target] call EFUNC(common,isAwake)) exitWith {
    [QEGVAR(common,displayTextStructured), [[LSTRING(CanNotLoaded), [_target] call EFUNC(common,getName)], 1.5, _caller], [_caller]] call CBA_fnc_targetEvent;
};
if ([_target] call FUNC(isBeingCarried)) then {
    [_caller, _target] call EFUNC(dragging,dropObject_carry);
};
if ([_target] call FUNC(isBeingDragged)) then {
    [_caller, _target] call EFUNC(dragging,dropObject);
};

private _vehicle = [_caller, _target] call EFUNC(common,loadPerson);
