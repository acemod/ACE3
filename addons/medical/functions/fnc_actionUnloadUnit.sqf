#include "script_component.hpp"
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
 * Example:
 * [bob, kevin, false] call ACE_medical_fnc_actionUnloadUnit
 *
 * Public: No
 */

params ["_caller", "_target", ["_drag", false]];

// cannot unload a unit not in a vehicle.
if (vehicle _target == _target) exitWith {};
if (([_target] call EFUNC(common,isAwake))) exitWith {};

["ace_unloadPersonEvent", [_target, vehicle _target, _caller], _target] call CBA_fnc_targetEvent;
