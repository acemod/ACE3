/*
 * Author: GitHawk
 * Check if a unit can pick up ammo.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Pick Up Ammo <BOOL>
 *
 * Example:
 * [player, tank] call ace_rearm_fnc_canTakeAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_unit", objNull, [objNull]]];

!(isNull _unit ||
    {!alive _target} || 
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_target distance _unit) > REARM_ACTION_DISTANCE} ||
    {!isNull (_unit getVariable [QGVAR(dummy), objNull])})
