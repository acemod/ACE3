/*
 * Author: GitHawk
 * Checks if unit can read supply counter.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can read supply counter <BOOL>
 *
 * Example:
 * [truck, player] call ace_rearm_fnc_canReadSupplyCounter
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_unit", objNull, [objNull]]];

!(isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _target} ||
    {(_target distance _unit) > REARM_ACTION_DISTANCE} ||
    {GVAR(supply) == 0})
