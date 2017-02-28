/*
 * Author: bux
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
