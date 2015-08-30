/*
 * Author: Glowbal
 * Action for loading an unconscious or dead unit in the nearest vechile
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller", "_target","_vehicle"];
_caller = _this select 0;
_target = _this select 1;

if ([_target] call EFUNC(common,isAwake)) exitwith {
    // TODO localization
    ["displayTextStructured", [_caller], [["This person (%1) is awake and cannot be loaded", [_target] call EFUNC(common,getName)], 1.5, _caller]] call EFUNC(common,targetEvent);
};
if ([_target] call FUNC(isBeingCarried)) then {
    [_caller, _target] call EFUNC(dragging,dropObject_carry);
};
if ([_target] call FUNC(isBeingDragged)) then {
    [_caller, _target] call EFUNC(dragging,dropObject);
};

_vehicle = [_caller, _target] call EFUNC(common,loadPerson);
