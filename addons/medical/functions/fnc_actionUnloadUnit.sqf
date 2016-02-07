/*
 * Author: Glowbal
 * Action for unloading an unconscious or dead unit from a vechile
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

params ["_caller", "_target"];

// cannot unload a unit not in a vehicle.
if (vehicle _target == _target) exitwith {};

[_target] call EFUNC(common,unloadPerson)
