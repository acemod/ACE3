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
 * Public: No
 */

#include "script_component.hpp"

private "_vehicle";
params ["_caller", "_target"];

if ([_target] call EFUNC(common,isAwake)) exitwith {
    ["displayTextStructured", [_caller], [[LSTRING(CanNotLoaded), [_target] call EFUNC(common,getName)], 1.5, _caller]] call EFUNC(common,targetEvent);
};
if ([_target] call FUNC(isBeingCarried)) then {
    [_caller, _target] call EFUNC(dragging,dropObject_carry);
};
if ([_target] call FUNC(isBeingDragged)) then {
    [_caller, _target] call EFUNC(dragging,dropObject);
};

_vehicle = [_caller, _target] call EFUNC(common,loadPerson);
