#include "script_component.hpp"
/*
 * Author: commy2
 * Initializes the Rallypoint module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synced units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, [ACE_Player], true] call ace_respawn_fnc_moduleRallypoint
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

{
    _x setVariable ["ACE_canMoveRallypoint", true];
    false
} count _units;

INFO("Rallypoint Module Initialized.");
