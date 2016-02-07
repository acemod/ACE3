/*
 * Author: Glowbal
 * Action for unloading an unconscious or dead unit from a vechile
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Drag after unload <BOOL> <OPTIONAL>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_caller", "_target", ["_drag", false]];

// cannot unload a unit not in a vehicle.
if (vehicle _target == _target) exitwith {};
if (([_target] call cse_fnc_isAwake)) exitwith {};

if ([_target] call EFUNC(common,unloadPerson)) then {
    if (_drag) then {
        if ((vehicle _caller) == _caller) then {
            if (local _target) then {
                ["actionDragUnit", [_caller, _target, true]] call EFUNC(common,localEvent);
            } else {
                ["actionDragUnit", _caller, [_caller, _target, true]] call EFUNC(common,targetEvent);
            };
        };
    };
};
