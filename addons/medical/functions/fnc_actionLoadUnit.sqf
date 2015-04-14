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

private ["_caller", "_target","_vehicle", "_loaded"];
_caller = _this select 0;
_target = _this select 1;

if ([_target] call EFUNC(common,isAwake)) exitwith {
    // TODO localization
    ["displayTextStructured", [_caller], [["This person (%1) is awake and cannot be loaded", [_target] call EFUNC(common,getName)], 1.5, _caller]] call EFUNC(common,targetEvent);
};
if ([_target] call FUNC(isBeingCarried)) then {
	[_caller, _target] call FUNC(dropObject_carry);
};
if ([_target] call FUNC(isBeingDragged)) then {
	[_caller, _target] call FUNC(dropObject);
};

_vehicle = [_caller, _target] call EFUNC(common,loadPerson);
if (!isNull _vehicle) then {
    if (!isnil QGVAR(DROP_ADDACTION)) then {
        _caller removeAction GVAR(DROP_ADDACTION);
        GVAR(DROP_ADDACTION) = nil;
    };
};
