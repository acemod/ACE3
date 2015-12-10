/*
 * Author: Glowbal
 * Action for unloading an unconscious or dead unit from a vechile
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Drag after unload <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_caller", "_target", ["_drag", false]];

// cannot unload a unit not in a vehicle.
if (vehicle _target == _target) exitWith {};
if (([_target] call EFUNC(common,isAwake))) exitWith {};

["unloadPersonEvent", _target, [_target, vehicle _target]] call EFUNC(common,targetEvent)
